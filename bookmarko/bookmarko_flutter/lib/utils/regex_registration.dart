class RegexRegistration{
  static final userNameShortRegex = RegExp(r'^[^\s]{1,}\s[^\s]{1,}$');
  static final userNameLongRegex = RegExp(r'^[^\s]{1,}\s[^\s]{1,}\s[^\s]{1,}$');

  static final userPhoneNumberRegex = RegExp(r'^[0-9]{10}$');

  static final userEmailRegex = RegExp(r'^[^\s]{1,}@[^\s]{1,}\.[^\s]{1,}$');
}