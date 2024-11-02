// // To parse this JSON data, do
// //
// //     final loginModel = loginModelFromJson(jsonString);

// import 'dart:convert';

// LoginModel loginModelFromJson(String str) =>
//     LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//   String message;
//   int userId;
//   String username;
//   String email;
//   String firstName;
//   String lastName;

//   LoginModel({
//     required this.message,
//     required this.userId,
//     required this.username,
//     required this.email,
//     required this.firstName,
//     required this.lastName,
//   });

//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         message: json["message"],
//         userId: json["user_id"],
//         username: json["username"],
//         email: json["email"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "user_id": userId,
//         "username": username,
//         "email": email,
//         "first_name": firstName,
//         "last_name": lastName,
//       };
// }

class LoginModel {
  String? message;
  int? userId;
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  LoginModel({
    this.message,
    this.userId,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"] as String?,
        userId: json["user_id"] as int?,
        username: json["username"] as String?,
        email: json["email"] as String?,
        firstName: json["first_name"] as String?,
        lastName: json["last_name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user_id": userId,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      };
}
