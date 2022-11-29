class Validator {
  Validator._();

  //TODO:passar validações Charleston e Paulo para esse arquivo
  //TODO: debater onde arquivo Validator.dart deve ser localizado

  static String? validateName(String? value) {
    final nameValidate = RegExp(r'^[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !nameValidate.hasMatch(value)) {
      return "Nome inválido. Digite um nome válido";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final emailValidate = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !emailValidate.hasMatch(value)) {
      return "E-mail inválido. Digite um E-mail válido";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    //TODO: inserir texto explicativo das regras para registro de senhas
    final passwordValidate = RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !passwordValidate.hasMatch(value)) {
      return "Senha inválida. Digite uma senha válida";
    }
    return null;
  }

  static String? confirmValidatePassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Campo obrigatório";
    }
    if (first != second) {
      return "As senhas digitadas são diferentes";
    }
    return null;
  }
}