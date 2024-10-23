import '../../data/models/user.dart';

class UserDto {
  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isVerified,
    this.token,
  });

  UserDto.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    isVerified = json['isVerified'];
    token = json['token'];
  }
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;
  String? token;
  UserDto copyWith({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    bool? isVerified,
    String? token,
  }) =>
      UserDto(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        isVerified: isVerified ?? this.isVerified,
        token: token ?? this.token,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['isVerified'] = isVerified;
    map['token'] = token;
    return map;
  }

  User toUser() {
    return User(
      id: id,
      email: email,
      firstName: firstName,
      isVerified: isVerified,
      lastName: lastName,
      phone: phone,
      token: token,
      username: username,
    );
  }
}
