class ResponseSignUp {
  bool? error;
  String? message;

  ResponseSignUp({this.error, this.message});

  factory ResponseSignUp.formJson(Map<String, dynamic> json) {
    return ResponseSignUp(
      error: json['error'],
      message: json ['message']
    );
  }
}