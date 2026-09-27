


import '../../domain/enities/video_entity.dart';

class VideoModel extends VideoEntity{
  String? iso6391;
  String? iso31661;
 final String name;
final  String key;
  String? site;
  int? size;
final  String type;
  bool? official;
  String? publishedAt;
  String? id;

  VideoModel(
      {this.iso6391,
        this.iso31661,
     required   this.name,
     required   this.key,
        this.site,
        this.size,
     required   this.type,
        this.official,
        this.publishedAt,
        this.id}): super(
title: name,
key: key,
type: type,
);

factory VideoModel.fromJson(Map<String, dynamic> json) {
return VideoModel(
id: json['id'],
iso6391: json['iso_639_1'],
iso31661: json['iso_3166_1'],
key: json['key'],
name: json['name'],
site: json['site'],
size: json['size'],
type: json['type'],
);
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    data['key'] = this.key;
    data['site'] = this.site;
    data['size'] = this.size;
    data['type'] = this.type;
    data['official'] = this.official;
    data['published_at'] = this.publishedAt;
    data['id'] = this.id;
    return data;
  }
}
