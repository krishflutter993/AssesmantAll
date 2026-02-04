class Validators {
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$').hasMatch(password);
  }
}
