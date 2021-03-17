import 'package:ntcbrew/network/const.dart';
import 'package:web_socket_channel/io.dart';


IOWebSocketChannel openSocket(String endpoint) {
  return IOWebSocketChannel.connect(Uri.parse("${Constants.socketUrl}$endpoint"));
}