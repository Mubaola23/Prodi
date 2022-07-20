class MobileDeviceResponse {
  MobileDeviceResponse({
    required this.results,
  });
  late final List<Results> results;

  MobileDeviceResponse.fromJson(Map<dynamic, dynamic> json) {
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.objectId,
    required this.createdAt,
    required this.updatedAt,
    required this.cellPhoneBrand,
    required this.cellPhoneModels,
  });
  late final String objectId;
  late final String createdAt;
  late final String updatedAt;
  late final String cellPhoneBrand;
  late final CellPhoneModels cellPhoneModels;

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cellPhoneBrand = json['Cell_Phone_Brand'];
    cellPhoneModels = CellPhoneModels.fromJson(json['Cell_Phone_Models']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['objectId'] = objectId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['Cell_Phone_Brand'] = cellPhoneBrand;
    _data['Cell_Phone_Models'] = cellPhoneModels.toJson();
    return _data;
  }
}

class CellPhoneModels {
  CellPhoneModels({
    required this.types,
    required this.className,
  });
  late final String types;
  late final String className;

  CellPhoneModels.fromJson(Map<String, dynamic> json) {
    types = json['__type'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['__type'] = types;
    _data['className'] = className;
    return _data;
  }
}
