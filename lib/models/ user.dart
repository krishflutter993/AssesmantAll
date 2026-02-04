class User {
  String firstName;
  String lastName;
  String email;
  String password;

  User(this.firstName, this.lastName, this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email.toLowerCase(),
      'password': password,
    };
  }
}
