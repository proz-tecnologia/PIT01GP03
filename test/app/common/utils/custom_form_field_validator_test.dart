import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';

void main() {
  testWidgets('custom form field validator ...', (tester) async {
    Function validateName = CustomFormFieldValidator.validateName;
    Function validateEmail = CustomFormFieldValidator.validateEmail;
    Function validateNull = CustomFormFieldValidator.validateNull;
    Function validateTitle = CustomFormFieldValidator.validateTitle;
    Function validatePassword= CustomFormFieldValidator.validatePassword;
    Function confirmValidatePassword = CustomFormFieldValidator.confirmValidatePassword;


    expect(validateName('User user'), null);
    expect(validateEmail('user@gmail.com'), null);
    expect(validateNull('123456'), null);
    expect(validateTitle('User Title'), null);
    expect(validatePassword('123456Ab'), null);
    expect(confirmValidatePassword('123456Ab','123456Ab'), null);
  });
}
