import 'package:form_validator/form_validator.dart';

typedef ValidationBuilderFunctionType = ValidationBuilder;

final class ValidationBuilderHelper {
  static ValidationBuilderFunctionType get passwordValidationBuilder =>
      ValidationBuilder()
          .required()
        
          .minLength(6)
          .maxLength(20);
}
