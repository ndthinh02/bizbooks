import 'package:dio/dio.dart';

class Audio {
  String? urlImage;
  String? urlAudio;
  int? idCategory;
  String? id;

  Audio({this.urlImage, this.urlAudio, this.idCategory, this.id});

  Audio.fromJson(Map<String, dynamic> json) {
    urlImage = json['urlImage'];
    urlAudio = json['urlAudio'];
    idCategory = json['idCategory'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['urlImage'] = urlImage;
    data['urlAudio'] = urlAudio;
    data['idCategory'] = idCategory;
    data['id'] = id;
    return data;
  }
}

class Repository {
  final _dio = Dio();
  Future<List<Audio>?> fetchListAudio() async {
    final respone =
        await _dio.get("https://644a3ce2a8370fb32148662e.mockapi.io/audio");
    var listAudio = respone.data as List;
    print(listAudio);
    return listAudio.map((e) => Audio.fromJson(e)).toList();
  }
}
