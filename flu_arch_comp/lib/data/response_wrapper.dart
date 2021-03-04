class ResponseWrapper<T> {
  T data;
  String message;
  bool error;

  ResponseWrapper.error({this.message, this.error, this.data,});
  ResponseWrapper.success({this.data, this.message = 'success', this.error = false,});

  ResponseWrapper.loading({this.data, this.error = false,});
}