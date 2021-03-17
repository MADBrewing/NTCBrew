class Constants {
  static String protocol = "http://";
  static String host = "10.0.0.17";
  static String port = "80";
  static String api = "api";
  static String version = "v1";
  static String url = "$protocol$host:$port/$api/$version/";

  static String socketProtocol = "ws://";
  static String socketHost = host;
  static String socketPort = port;
  static String socketVersion = "v1";
  static String socketUrl = "$socketProtocol$socketHost:$socketPort/";

}