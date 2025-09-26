// lib/user_dashboard/domain/usecases/get_dropdown_options_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/dropdown_option.dart';
import '../repositories/armory_repository.dart';

class GetDropdownOptionsUseCase implements UseCase<List<DropdownOption>, DropdownParams> {
  final ArmoryRepository repository;
  final FirebaseAuth firebaseAuth;

  // Business Logic Services
  late final GetFirearmBrandsUseCase _getFirearmBrandsUseCase;
  late final GetFirearmModelsUseCase _getFirearmModelsUseCase;
  late final GetAmmunitionCalibersUseCase _getAmmunitionCalibersUseCase;
  late final GetAmmunitionBrandsUseCase _getAmmunitionBrandsUseCase;

  GetDropdownOptionsUseCase(this.repository, this.firebaseAuth) {
    _getFirearmBrandsUseCase = GetFirearmBrandsUseCase(repository, firebaseAuth);
    _getFirearmModelsUseCase = GetFirearmModelsUseCase(repository, firebaseAuth, _getFirearmBrandsUseCase);
    _getAmmunitionCalibersUseCase = GetAmmunitionCalibersUseCase(repository, firebaseAuth);
    _getAmmunitionBrandsUseCase = GetAmmunitionBrandsUseCase(repository, firebaseAuth);
  }

  @override
  Future<Either<Failure, List<DropdownOption>>> call(DropdownParams params) async {
    switch (params.type) {
      case DropdownType.firearmBrands:
        return await _getFirearmBrandsUseCase.call(params);

      case DropdownType.firearmModels:
        return await _getFirearmModelsUseCase.call(params);

      case DropdownType.firearmGenerations:
        return await _getFirearmGenerations(params);

      case DropdownType.calibers:
        return await _getCalibers(params);

      case DropdownType.firearmFiringMechanisms:
        return await _getFirearmFiringMechanisms(params);

      case DropdownType.firearmMakes:
        return await _getFirearmMakes(params);

      case DropdownType.ammunitionCaliber:
        return await _getAmmunitionCalibersUseCase.call(const NoParams());

      case DropdownType.ammunitionBrands:
        return await _getAmmunitionBrandsUseCase.call(params);

      case DropdownType.bulletTypes:
        return await _getBulletTypes(params);
    }
  }

  Future<Either<Failure, List<DropdownOption>>> _getFirearmGenerations(DropdownParams params) async {
    try {
      // Business Logic: Get firearm data and apply filtering
      final allData = await _getAllFirearmsData();

      // Apply cascading filters
      var filtered = allData;
      if (params.filterValue != null && !_isCustomValue(params.filterValue)) {
        filtered = _filterData(source: filtered, field: 'type', value: params.filterValue);
      }
      if (params.secondaryFilter != null && !_isCustomValue(params.secondaryFilter)) {
        filtered = _filterData(source: filtered, field: 'brand', value: params.secondaryFilter);
      }
      if (params.tertiaryFilter != null && !_isCustomValue(params.tertiaryFilter)) {
        filtered = _filterData(source: filtered, field: 'model', value: params.tertiaryFilter);
      }

      final generations = filtered
          .map((e) => e['generation']?.toString() ?? '')
          .where((g) => g.isNotEmpty)
          .toSet()
          .toList();
      generations.sort();

      return Right(generations.map((g) => DropdownOption(value: g, label: g)).toList());
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<DropdownOption>>> _getCalibers(DropdownParams params) async {
    try {
      final allData = await _getAllFirearmsData();

      // Apply cascading filters
      var filtered = allData;
      if (params.filterValue != null && !_isCustomValue(params.filterValue)) {
        filtered = _filterData(source: filtered, field: 'generation', value: params.filterValue);
      }

      final calibers = filtered
          .map((e) => e['caliber']?.toString() ?? '')
          .where((c) => c.isNotEmpty)
          .toSet()
          .toList();
      calibers.sort();

      return Right(calibers.map((caliber) => DropdownOption(value: caliber, label: caliber)).toList());
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<DropdownOption>>> _getFirearmFiringMechanisms(DropdownParams params) async {
    try {
      final allData = await _getAllFirearmsData();

      var filtered = allData;
      if (params.filterValue != null && !_isCustomValue(params.filterValue)) {
        filtered = _filterData(source: filtered, field: 'caliber', value: params.filterValue);
      }

      final mechanisms = filtered
          .map((e) => e['firing_machanism']?.toString() ?? '')
          .where((m) => m.isNotEmpty)
          .toSet()
          .toList();
      mechanisms.sort();

      return Right(mechanisms.map((mech) => DropdownOption(value: mech, label: mech)).toList());
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<DropdownOption>>> _getFirearmMakes(DropdownParams params) async {
    try {
      final allData = await _getAllFirearmsData();

      var filtered = allData;
      if (params.filterValue != null && !_isCustomValue(params.filterValue)) {
        filtered = _filterData(source: filtered, field: 'firing_machanism', value: params.filterValue);
      }

      final makes = filtered
          .map((e) => e['make']?.toString() ?? '')
          .where((m) => m.isNotEmpty)
          .toSet()
          .toList();
      makes.sort();

      return Right(makes.map((make) => DropdownOption(value: make, label: make)).toList());
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<DropdownOption>>> _getBulletTypes(DropdownParams params) async {
    try {
      final allAmmoData = await _getAllAmmoData();

      var filtered = allAmmoData;
      if (params.filterValue != null && !_isCustomValue(params.filterValue)) {
        filtered = _filterData(source: filtered, field: 'caliber', value: params.filterValue);
      }
      if (params.secondaryFilter != null && !_isCustomValue(params.secondaryFilter)) {
        filtered = _filterData(source: filtered, field: 'brand', value: params.secondaryFilter);
      }

      final bulletWeights = filtered
          .map((e) => e['bullet weight (gr)']?.toString() ?? '')
          .where((w) => w.isNotEmpty)
          .toSet()
          .toList();
      bulletWeights.sort();

      return Right(bulletWeights.map((bullet) => DropdownOption(value: bullet, label: bullet)).toList());
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  // =============== Helper Methods ===============
  Future<List<Map<String, dynamic>>> _getAllFirearmsData() async {
    final firearmsResult = await repository.getFirearmsRawData();
    final firearmsData = firearmsResult.fold((l) => <Map<String, dynamic>>[], (r) => r);

    final currentUserId = firebaseAuth.currentUser?.uid;
    if (currentUserId != null) {
      final userFirearmsResult = await repository.getUserFirearmsRawData(currentUserId);
      final userFirearmsData = userFirearmsResult.fold((l) => <Map<String, dynamic>>[], (r) => r);
      return [...firearmsData, ...userFirearmsData];
    }
    return firearmsData;
  }

  Future<List<Map<String, dynamic>>> _getAllAmmoData() async {
    final ammoResult = await repository.getAmmunitionRawData();
    final ammoData = ammoResult.fold((l) => <Map<String, dynamic>>[], (r) => r);

    final currentUserId = firebaseAuth.currentUser?.uid;
    if (currentUserId != null) {
      final userAmmoResult = await repository.getUserAmmunitionRawData(currentUserId);
      final userAmmoData = userAmmoResult.fold((l) => <Map<String, dynamic>>[], (r) => r);
      return [...ammoData, ...userAmmoData];
    }
    return ammoData;
  }

  List<Map<String, dynamic>> _filterData({
    required List<Map<String, dynamic>> source,
    String? field,
    String? value,
  }) {
    if (value == null || value.isEmpty || value.startsWith('__CUSTOM__')) {
      return source;
    }
    return source.where((item) => item[field]?.toString() == value).toList();
  }

  bool _isCustomValue(String? value) {
    return value != null && value.startsWith('__CUSTOM__');
  }
}

// Business Logic Use Cases that were moved from repository
class GetFirearmBrandsUseCase implements UseCase<List<DropdownOption>, DropdownParams> {
  final ArmoryRepository repository;
  final FirebaseAuth firebaseAuth;

  GetFirearmBrandsUseCase(this.repository, this.firebaseAuth);

  @override
  Future<Either<Failure, List<DropdownOption>>> call(DropdownParams params) async {
    try {
      final allData = await _getAllFirearmsData();
      final filtered = _filterData(source: allData, field: 'type', value: params.filterValue);

      final brands = filtered
          .map((e) => e['brand']?.toString() ?? '')
          .where((b) => b.isNotEmpty)
          .toSet()
          .toList();
      brands.sort();

      return Right(brands.map((brand) => DropdownOption(value: brand, label: brand)).toList());
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  Future<List<Map<String, dynamic>>> _getAllFirearmsData() async {
    final firearmsResult = await repository.getFirearmsRawData();
    final firearmsData = firearmsResult.fold((l) => <Map<String, dynamic>>[], (r) => r);

    final currentUserId = firebaseAuth.currentUser?.uid;
    if (currentUserId != null) {
      final userFirearmsResult = await repository.getUserFirearmsRawData(currentUserId);
      final userFirearmsData = userFirearmsResult.fold((l) => <Map<String, dynamic>>[], (r) => r);
      return [...firearmsData, ...userFirearmsData];
    }
    return firearmsData;
  }

  List<Map<String, dynamic>> _filterData({
    required List<Map<String, dynamic>> source,
    String? field,
    String? value,
  }) {
    if (value == null || value.isEmpty || value.startsWith('__CUSTOM__')) {
      return source;
    }
    return source.where((item) => item[field]?.toString() == value).toList();
  }
}

class GetFirearmModelsUseCase implements UseCase<List<DropdownOption>, DropdownParams> {
  final ArmoryRepository repository;
  final FirebaseAuth firebaseAuth;
  final GetFirearmBrandsUseCase _brandsUseCase;

  GetFirearmModelsUseCase(this.repository, this.firebaseAuth, this._brandsUseCase);

  @override
  Future<Either<Failure, List<DropdownOption>>> call(DropdownParams params) async {
    try {
      final allData = await _getAllFirearmsData();

      // Apply type filter first, then brand filter
      var filtered = allData;
      if (params.secondaryFilter != null && !_isCustomValue(params.secondaryFilter)) {
        filtered = _filterData(source: filtered, field: 'type', value: params.secondaryFilter);
      }
      if (params.filterValue != null && !_isCustomValue(params.filterValue)) {
        filtered = _filterData(source: filtered, field: 'brand', value: params.filterValue);
      }

      final models = filtered
          .map((e) => e['model']?.toString() ?? '')
          .where((m) => m.isNotEmpty)
          .toSet()
          .toList();
      models.sort();

      return Right(models.map((m) => DropdownOption(value: m, label: m)).toList());
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  Future<List<Map<String, dynamic>>> _getAllFirearmsData() async {
    final firearmsResult = await repository.getFirearmsRawData();
    final firearmsData = firearmsResult.fold((l) => <Map<String, dynamic>>[], (r) => r);

    final currentUserId = firebaseAuth.currentUser?.uid;
    if (currentUserId != null) {
      final userFirearmsResult = await repository.getUserFirearmsRawData(currentUserId);
      final userFirearmsData = userFirearmsResult.fold((l) => <Map<String, dynamic>>[], (r) => r);
      return [...firearmsData, ...userFirearmsData];
    }
    return firearmsData;
  }

  List<Map<String, dynamic>> _filterData({
    required List<Map<String, dynamic>> source,
    String? field,
    String? value,
  }) {
    if (value == null || value.isEmpty || value.startsWith('__CUSTOM__')) {
      return source;
    }
    return source.where((item) => item[field]?.toString() == value).toList();
  }

  bool _isCustomValue(String? value) {
    return value != null && value.startsWith('__CUSTOM__');
  }
}

class GetAmmunitionCalibersUseCase implements UseCase<List<DropdownOption>, NoParams> {
  final ArmoryRepository repository;
  final FirebaseAuth firebaseAuth;

  GetAmmunitionCalibersUseCase(this.repository, this.firebaseAuth);

  @override
  Future<Either<Failure, List<DropdownOption>>> call(NoParams params) async {
    try {
      final allAmmoData = await _getAllAmmoData();
      final currentUserId = firebaseAuth.currentUser?.uid;

      // Business Logic: User's firearm calibers get priority
      final ammoCalibers = allAmmoData
          .map((e) => e['caliber']?.toString() ?? '')
          .where((c) => c.isNotEmpty)
          .toSet();

      Set<String> userFirearmCalibers = {};
      if (currentUserId != null) {
        final userFirearmsResult = await repository.getUserFirearmsRawData(currentUserId);
        final userFirearms = userFirearmsResult.fold((l) => <Map<String, dynamic>>[], (r) => r);
        userFirearmCalibers = userFirearms
            .map((e) => e['caliber']?.toString() ?? '')
            .where((c) => c.isNotEmpty)
            .toSet();
      }

      final priorityCalibers = userFirearmCalibers.toList()..sort();
      final otherCalibers = ammoCalibers.difference(userFirearmCalibers).toList()..sort();

      final List<DropdownOption> options = [];

      if (priorityCalibers.isNotEmpty) {
        options.add(const DropdownOption(
            value: '---SEPARATOR---', label: '── Your Firearms Calibers ──'));
        options.addAll(priorityCalibers.map((caliber) => DropdownOption(
            value: caliber, label: caliber)));
      }

      if (priorityCalibers.isNotEmpty && otherCalibers.isNotEmpty) {
        options.add(const DropdownOption(
            value: '---SEPARATOR---', label: '── Other Calibers ──'));
      }

      options.addAll(otherCalibers.map((caliber) => DropdownOption(
          value: caliber, label: caliber)));

      return Right(options);
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  Future<List<Map<String, dynamic>>> _getAllAmmoData() async {
    final ammoResult = await repository.getAmmunitionRawData();
    final ammoData = ammoResult.fold((l) => <Map<String, dynamic>>[], (r) => r);

    final currentUserId = firebaseAuth.currentUser?.uid;
    if (currentUserId != null) {
      final userAmmoResult = await repository.getUserAmmunitionRawData(currentUserId);
      final userAmmoData = userAmmoResult.fold((l) => <Map<String, dynamic>>[], (r) => r);
      return [...ammoData, ...userAmmoData];
    }
    return ammoData;
  }
}

class GetAmmunitionBrandsUseCase implements UseCase<List<DropdownOption>, DropdownParams> {
  final ArmoryRepository repository;
  final FirebaseAuth firebaseAuth;

  GetAmmunitionBrandsUseCase(this.repository, this.firebaseAuth);

  @override
  Future<Either<Failure, List<DropdownOption>>> call(DropdownParams params) async {
    try {
      final allAmmoData = await _getAllAmmoData();

      final filtered = _filterData(
        source: allAmmoData,
        field: 'caliber',
        value: params.filterValue,
      );

      if (filtered.isEmpty) {
        final ammoBrands = allAmmoData
            .map((e) => e['brand']?.toString() ?? '')
            .where((c) => c.isNotEmpty)
            .toSet()
            .toList()..sort();

        return Right(ammoBrands.map((brand) => DropdownOption(value: brand, label: brand)).toList());
      }

      final brands = filtered
          .map((e) => e['brand']?.toString() ?? '')
          .where((b) => b.isNotEmpty)
          .toSet()
          .toList();
      brands.sort();

      return Right(brands.map((brand) => DropdownOption(value: brand, label: brand)).toList());
    } catch (e) {
      return Left(FileFailure(e.toString()));
    }
  }

  Future<List<Map<String, dynamic>>> _getAllAmmoData() async {
    final ammoResult = await repository.getAmmunitionRawData();
    final ammoData = ammoResult.fold((l) => <Map<String, dynamic>>[], (r) => r);

    final currentUserId = firebaseAuth.currentUser?.uid;
    if (currentUserId != null) {
      final userAmmoResult = await repository.getUserAmmunitionRawData(currentUserId);
      final userAmmoData = userAmmoResult.fold((l) => <Map<String, dynamic>>[], (r) => r);
      return [...ammoData, ...userAmmoData];
    }
    return ammoData;
  }

  List<Map<String, dynamic>> _filterData({
    required List<Map<String, dynamic>> source,
    String? field,
    String? value,
  }) {
    if (value == null || value.isEmpty || value.startsWith('__CUSTOM__')) {
      return source;
    }
    return source.where((item) => item[field]?.toString() == value).toList();
  }
}