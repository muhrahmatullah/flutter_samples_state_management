
import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class MetaInfo {

  MetaInfo(this.totalPage, this.currentPage, this.nextPage, this.perPage, this.count);

  @JsonKey(name: 'total_page')
  final int totalPage;
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'next_page')
  final int nextPage;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'total_count')
  final int count;

  factory MetaInfo.fromJson(Map<String, dynamic> json) => _$MetaInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MetaInfoToJson(this);

}