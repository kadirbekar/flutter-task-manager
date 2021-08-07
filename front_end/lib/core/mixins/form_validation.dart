mixin FormValidation {
  String? checkFormInputValue(String value) => value.isEmpty || value.length == 0 ? "This field must be filled" : null;
}