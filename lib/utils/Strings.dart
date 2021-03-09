class Strings {
  static final Strings _instance = Strings();

  LocaliseStringsFactory factory = LocaliseStringsFactory();
  Map<String, String>? _strings;

  static init() {
    if (_instance._strings == null) {
      _instance.loadLocale("en_GB");
    }
  }

  loadLocale(String locale) {
    _strings = factory.getStrings(locale).getStrings();
  }

  static String getString(String key) {
    return _instance._strings?.entries.firstWhere((element) => element.key == key).value ?? "";
  }
}

class StringKey {
  static String HomeScreen_Title = "homescreen.title";
}

class LocaliseStringsFactory {
  LocaliseStrings getStrings(String locale) {
    switch (locale) {
      case "en_GB":
      default:
        return EnStrings();
    }
  }
}

abstract class LocaliseStrings {
  Map<String, String> getStrings();
}

class EnStrings implements LocaliseStrings {
  @override
  Map<String, String> getStrings() => <String, String>{
        StringKey.HomeScreen_Title: "NTC Brew",
      };
}
