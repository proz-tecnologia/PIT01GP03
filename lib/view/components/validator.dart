class Validator {
  Validator._();

  static String? validateData(String? value) {
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  static String? validateName(String? value) {
    final nameValidate = RegExp(r'^[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != nameValidate.hasMatch(value!)) {
      return "Nome inválido. Digite um nome válido";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final emailValidate = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != emailValidate.hasMatch(value!)) {
      return "E-mail inválido. Digite um E-mail válido";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final passwordValidate = RegExp(r'.{8,20}');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != passwordValidate.hasMatch(value!)) {
      return "Senha inválida. Digite uma senha válida";
    }
    return null;
  }
}
