import 'package:formz/formz.dart';

enum PasswordValidatorError { emtpy }

class Password extends FormzInput<String, PasswordValidatorError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidatorError validator(String value) {
    if (value?.isEmpty == true) {
      return PasswordValidatorError.emtpy;
    }
    return null;
  }
}
