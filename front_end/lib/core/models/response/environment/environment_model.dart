import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'environment_model.g.dart';

@JsonSerializable()
class Environment extends INetworkModel<Environment> {

    final String? id;
    final String? type;

    Environment({
        this.id,
        this.type,
    });

    factory Environment.fromMap(Map<String, dynamic> json) => _$EnvironmentFromJson(json);

    Map<String, dynamic> toMap() => _$EnvironmentToJson(this);

    @override
    Environment fromJson(Map<String, dynamic> json) => Environment.fromMap(json);

    @override
    Map<String, dynamic> toJson() => toMap();
}