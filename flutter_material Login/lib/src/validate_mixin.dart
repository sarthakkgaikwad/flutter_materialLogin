class ValidateMixin {
  String emailMixin(String value) {
    if (!value.contains('@')) {
      return 'Invalid Email';
    }
    return null;
  }

  String passwordMixin(String value) {
    if (value.length < 6) {
      return 'Invalid Password';
    }
    return null;
  }
}
