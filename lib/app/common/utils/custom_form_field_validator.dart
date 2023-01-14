class CustomFormFieldValidator {
  CustomFormFieldValidator._();

  static String? validateName(String? value) {
    final validatedName = RegExp(r'^[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !validatedName.hasMatch(value)) {
      return "Dados inválidos.";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final validatedEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !validatedEmail.hasMatch(value)) {
      return "Dados inválidos";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final validatedPassword =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !validatedPassword.hasMatch(value)) {
      return "Dados inválidos";
    }
    return null;
  }

  static String? confirmValidatePassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Campo obrigatório";
    }
    if (first != second) {
      return "Dados inválidos";
    }
    return null;
  }

  static String? validateNull(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Campo obrigatório";
    }
    if (value.trim().length < 3) {
      return 'Pelo menos 3 caracteres';
    }
    return null;
  }
}
