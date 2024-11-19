class RegisterModel {
  bool status;
  String message;

  RegisterModel({
    required this.status,
    required this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'] as bool,
      message: json['message'] as String,
    );
  }
}
