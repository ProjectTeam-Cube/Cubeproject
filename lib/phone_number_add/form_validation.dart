class FormValidation {
  static String? nameTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null; // No error
  }

  static String? phoneTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    // 추가적인 전화번호 형식 검증 로직을 여기에 구현할 수 있습니다.
    return null; // No error
  }

  static String? emailTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // 이메일 형식 검증 로직을 유지합니다.
    return null; // No error
  }
}
