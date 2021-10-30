class ApiResponse<Type> {
  Type? data;
  bool isError;
  String? errorMessage;

  ApiResponse({
    this.data,
    required this.isError,
    this.errorMessage,
  });
}