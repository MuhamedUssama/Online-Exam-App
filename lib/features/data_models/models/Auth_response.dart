/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDU5NzE5ZTc3ZDY4NTk1YTI5MjA3NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI4NTY5NzQzfQ.5MH1MIaP8uYfQcaXd3OaRQ_50WlXQX7gMpEpgTGT58M"

class AuthResponse {
  AuthResponse({
      this.message, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;
AuthResponse copyWith({  String? message,
  String? token,
}) => AuthResponse(  message: message ?? this.message,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}