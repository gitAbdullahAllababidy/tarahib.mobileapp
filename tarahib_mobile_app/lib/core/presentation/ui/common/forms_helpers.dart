import 'package:form_validator/form_validator.dart';

typedef ValidationBuilderFunctionType = ValidationBuilder;

class ValidationRegex {
  static final nameRegex = RegExp(r'^[A-Za-z ]+$');
  static final numberRegex = RegExp(r'^\d+$');
}

final class ValidationBuilderHelper {
  static ValidationBuilderFunctionType get passwordValidationBuilder =>
      ValidationBuilder().required().minLength(6).maxLength(20);
  static ValidationBuilderFunctionType get nameValidationBuilder =>
      ValidationBuilder()
          .required()
          .minLength(6)
          .maxLength(100)
          .regExp(ValidationRegex.nameRegex, "Not correct format");
  static ValidationBuilderFunctionType get emailValidationBuilder =>
      ValidationBuilder().required().email().maxLength(100);
  static ValidationBuilderFunctionType get numberValidationBuilder =>
      ValidationBuilder()
          .required()
          .minLength(1)
          .maxLength(5)
          .regExp(ValidationRegex.numberRegex, "Not correct format");
  static ValidationBuilderFunctionType get inviteNameValidationBuilder =>
      ValidationBuilder().required().minLength(3).maxLength(100);
}
