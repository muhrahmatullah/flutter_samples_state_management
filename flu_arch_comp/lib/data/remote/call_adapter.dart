import 'package:dio/dio.dart';

class AppCallAdapter extends HttpClientAdapter {
  @override
  void close({bool force = false}) {

  }

  @override
  Future<ResponseBody> fetch(RequestOptions options, Stream<List<int>> requestStream, Future<dynamic> cancelFuture) {

  }

}