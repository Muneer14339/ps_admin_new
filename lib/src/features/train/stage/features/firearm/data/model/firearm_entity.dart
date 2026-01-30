// To parse this JSON data, do
//
//     final firearmEntity = firearmEntityFromJson(jsonString);

import 'dart:convert';

FirearmEntity firearmEntityFromJson(String str) =>
    FirearmEntity.fromJson(json.decode(str));

String firearmEntityToJson(FirearmEntity data) => json.encode(data.toJson());

class FirearmEntity {
  int? id;
  String? type;
  String? brand;
  String? model;
  String? generation;
  String? caliber;
  String? firingMachanism;
  String? ammoType;
  int? addedByUser;
  bool? brandIsCustom;
  bool? modelIsCustom;
  bool? generationIsCustom;
  bool? caliberIsCustom;
  bool? firingMacIsCustom;
  bool? ammoTypeMacIsCustom;

  FirearmEntity({
    this.id,
    this.type,
    this.brand,
    this.model,
    this.generation,
    this.caliber,
    this.firingMachanism,
    this.ammoType,
    this.addedByUser,
    this.brandIsCustom,
    this.modelIsCustom,
    this.generationIsCustom,
    this.caliberIsCustom,
    this.firingMacIsCustom,
    this.ammoTypeMacIsCustom,
  });

  FirearmEntity copyWith({
    int? id,
    String? type,
    String? brand,
    String? model,
    String? generation,
    String? caliber,
    String? firingMachanism,
    String? ammoType,
    int? addedByUser,
    bool? brandIsCustom,
    bool? modelIsCustom,
    bool? generationIsCustom,
    bool? caliberIsCustom,
    bool? firingMacIsCustom,
    bool? ammoTypeMacIsCustom,
  }) =>
      FirearmEntity(
        id: id ?? this.id,
        type: type ?? this.type,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        generation: generation ?? this.generation,
        caliber: caliber ?? this.caliber,
        firingMachanism: firingMachanism ?? this.firingMachanism,
        ammoType: ammoType ?? this.ammoType,
        addedByUser: addedByUser ?? this.addedByUser,
        //
        brandIsCustom: brandIsCustom ?? this.brandIsCustom,
        modelIsCustom: modelIsCustom ?? this.modelIsCustom,
        generationIsCustom: generationIsCustom ?? this.generationIsCustom,
        caliberIsCustom: caliberIsCustom ?? this.caliberIsCustom,
        firingMacIsCustom: firingMacIsCustom ?? this.firingMacIsCustom,
        ammoTypeMacIsCustom: ammoTypeMacIsCustom ?? this.ammoTypeMacIsCustom,
      );

  factory FirearmEntity.fromJson(Map<String, dynamic> json) => FirearmEntity(
        id: json["id"],
        type: json["type"],
        brand: json["brand"],
        model: json["model"],
        generation: json["generation"],
        caliber: json["caliber"],
        firingMachanism: json["firing_machanism"],
        ammoType: json["ammo_type"],
        addedByUser: json["added_by_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "brand": brand,
        "model": model,
        "generation": generation,
        "caliber": caliber,
        "firing_machanism": firingMachanism,
        "ammo_type": ammoType,
        "added_by_user": addedByUser,
      };
}



// class FirearmEntity {
//   String? weaponType;
//   String? brand;
//   String? model;
//   String? genvar;
//   String? caliber;
//   String? mechanism;
//   String? ammoType;
//   FirearmEntity({
//     this.weaponType,
//     this.brand,
//     this.model,
//     this.genvar,
//     this.caliber,
//     this.mechanism,
//     this.ammoType,
//   });
// }


/*
 "type":"sdf"
   "brand":"aesdf"
   "model":"asgdf"
   "generation":"asdqqwef"
   "caliber":"fgas"
   "firing_machanism":"wer"
   "ammo_type":"a43rd"
 */