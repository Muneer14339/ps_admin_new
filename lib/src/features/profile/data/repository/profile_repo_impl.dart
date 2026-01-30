import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/utils/error_handler.dart';
import 'package:pa_sreens/src/features/profile/data/remote/source/profile_source.dart';
import '../../../auth_new/authentication/domain/entities/user.dart';
import '../../domain/repository/profile_repo.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._profileSource);
  final ProfileSource _profileSource;

  @override
  Future<Either<Map<String, dynamic>, String>> changePassword(
      String oldPass, String newPass) async {
    try {
      Response? response =
          await _profileSource.changePassword(oldPass, newPass);
      if (response?.statusCode == 200) {
        return left(response?.data);
      } else {
        return right('${response?.data['message']}');
      }
    } on DioException catch (e) {
      return right(handleDioError(e));
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<Either<User, String>> getUser(String userId) async {
    try {
      Response? response = await _profileSource.getUser(userId);
      if (response?.statusCode == 200) {
        return left(User.fromJson(response?.data));
      } else {
        return right('${response?.data['message']}');
      }
    } on DioException catch (e) {
      return right(handleDioError(e));
    } catch (e) {
      return right(e.toString());
    }
  }

  @override
  Future<Either<Map<String, dynamic>, String>> deleteUser(String userId) async {
    print('🟡 [ProfileRepository] deleteUser() called with userId: $userId');
    print('🟡 [ProfileRepository] Calling profile source');
    try {
      Response? response = await _profileSource.deleteUser(userId);
      print('🟡 [ProfileRepository] Got response - Status: ${response?.statusCode}, Data type: ${response?.data.runtimeType}');
      print('🟡 [ProfileRepository] Response data: ${response?.data}');

      if (response?.statusCode == 200) {
        print('🟢 [ProfileRepository] Status 200 - Returning SUCCESS');
        return left(response?.data);
      } else {
        print('🔴 [ProfileRepository] Status ${response?.statusCode} - Processing error response');

        // Safely extract error message - handle both JSON and non-JSON responses
        String errorMessage;
        if (response?.data is Map<String, dynamic>) {
          errorMessage = response?.data['message'] ?? 'Delete user failed';
          print('🔴 [ProfileRepository] JSON error message: $errorMessage');
        } else if (response?.data is String) {
          // HTML or plain text response
          errorMessage = 'Server error: ${response?.statusCode}';
          print('🔴 [ProfileRepository] Non-JSON response (HTML/Text), using status code message');
        } else {
          errorMessage = 'Unknown error occurred';
          print('🔴 [ProfileRepository] Unknown response type');
        }

        return right(errorMessage);
      }
    } on DioException catch (e) {
      print('🔴 [ProfileRepository] DioException caught: ${e.message}');
      print('🔴 [ProfileRepository] DioException response: ${e.response?.data}');
      return right(handleDioError(e));
    } catch (e) {
      print('🔴 [ProfileRepository] Generic exception caught: $e');
      return right(e.toString());
    }
  }

  // @override
  // Future<Either<User, String>> updateProfile(User user) async {
  //   final formData = FormData.fromMap({
  //     "full_name": user.fullName,
  //     "location": user.location,
  //     "age": user.age,
  //     "phone_no": user.phoneNo,
  //     "gender": user.gender,
  //     "city": user.city,
  //     "state": user.state,
  //     "zip_code": user.zipCode,
  //     "is_communication_true": user.isCommunicationTrue,
  //     "is_agree": user.isAgree,
  //     if (user.image != null)
  //       "image": await MultipartFile.fromFile(user.image ?? '',
  //           filename: '${user.image?.split('/').last}')
  //   });
  //
  //   try {
  //     Response? response =
  //         await _profileSource.updateProfile(user.id ?? 0, formData);
  //     if (response?.statusCode == 200) {
  //       return left(User.fromJson(response?.data));
  //     } else {
  //       return right('${response?.data['message']}');
  //     }
  //   } on DioException catch (e) {
  //     return right(handleDioError(e));
  //   } catch (e) {
  //     return right(e.toString());
  //   }
  // }
}
