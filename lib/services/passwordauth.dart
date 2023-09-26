class PassAuth {
  String? validate(value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 8) {
      return "enter atleast 8 characters";
    } else if (value.length > 15) {
      return "should not exceed 15 characters";
    } else {
      return null;
    }
  }
}
