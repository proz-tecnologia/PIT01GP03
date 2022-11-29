class CustomFormFieldValidator {
  CustomFormFieldValidator._();

  //TODO: CHARLESTON: TRAZER OUTRAS VALIDAÇÕES PARA ESSE ARQUIVO

  // VALIDAÇÃO DO CAMPO DE NOME
  static String? validateName(String? value) {
    final nameValidate = RegExp(r'^[a-zA-Z]{2,}(?: [a-zA-Z]+){0,2}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório.";
    }
    if (value != null && !nameValidate.hasMatch(value)) {
      return "Dados inválidos. Digite um nome válido";
    }
    return null;
  }

  // VALIDAÇÃO DO CAMPO DE E-MAIL
  static String? validateEmail(String? value) {
    final emailValidate = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !emailValidate.hasMatch(value)) {
      return "Dados inválidos. Digite um e-mail válido";
    }
    return null;
  }

  // VALIDAÇÃO DO CAMPO DE CRIAÇÃO DE SENHA
  static String? validatePassword(String? value) {
    final passwordValidate =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    if (value != null && !passwordValidate.hasMatch(value)) {
      return "Dados inválidos. Digite uma senha válida de no mínimo 8 caracteres.";
    }
    return null;
  }

  // VALIDAÇÃO DO CAMPO DE CONFIRMAÇÃO DE SENHA
  static String? confirmValidatePassword(String? first, String? second) {
    if (second != null && second.isEmpty) {
      return "Campo obrigatório";
    }
    if (first != second) {
      return "Dados inválidos. A confirmação é diferente da senha digitada.";
    }
    return null;
  }
}
