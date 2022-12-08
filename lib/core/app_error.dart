class AppError {
  AppError({this.message = 'Something went wrong.'});
  String message;

  @override
  String toString() => message;
}
