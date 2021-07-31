import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'environment_model.dart';

part 'base_environment_model.g.dart';

@JsonSerializable()
class PlatformEnvironmentResponseModel extends INetworkModel<PlatformEnvironmentResponseModel>{

    final int? code;
    final bool? isOk;
    final List<Environment?>? data;
    final String? error;

    PlatformEnvironmentResponseModel({
        this.code,
        this.isOk,
        this.data,
        this.error,
    });

    factory PlatformEnvironmentResponseModel.fromMap(Map<String, dynamic> json) => _$PlatformEnvironmentResponseModelFromJson(json);

    Map<String, dynamic> toMap() => _$PlatformEnvironmentResponseModelToJson(this);

    @override
    PlatformEnvironmentResponseModel fromJson(Map<String, dynamic> json) => PlatformEnvironmentResponseModel.fromMap(json);

    @override
    Map<String, dynamic> toJson() => toMap();
}


