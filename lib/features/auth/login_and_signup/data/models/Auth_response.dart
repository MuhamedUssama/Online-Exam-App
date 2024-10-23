import 'user.dart';

class AuthResponse {
  String? message;
  String? token;
  User? user;

  AuthResponse({
    this.message,
    this.token,
    this.user,
  });

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    user = json['user'];
  }

  AuthResponse copyWith({
    String? message,
    String? token,
    User? user,
  }) =>
      AuthResponse(
        message: message ?? this.message,
        token: token ?? this.token,
        user: user ?? this.user,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['user'] = user;
    return map;
  }
}
