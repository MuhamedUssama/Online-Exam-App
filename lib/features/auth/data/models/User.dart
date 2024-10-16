/// id : "67001692f87c48663aee3ad7"
/// username : "elevate"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin@elevate.com"
/// phone : "01094155711"
/// isVerified : false

class User {
  User({
      this.id, 
      this.username, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone, 
      this.isVerified,
      this.token});


  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;
  String? token;



}