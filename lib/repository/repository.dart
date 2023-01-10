import 'package:dio/dio.dart';

class RemoteRepository{
  const RemoteRepository();

  Future getHttp() async {
    try {
      var response = await Dio().get('https://my-json-server.typicode.com/ali-ebraheem/mockjson/Post');
      return response;
    } catch (e) {
      Exception(e);
    }
  }
}