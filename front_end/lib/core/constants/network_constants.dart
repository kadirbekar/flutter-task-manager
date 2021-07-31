import 'dart:io';
class NetworkConstants {
  
  static NetworkConstants? _instance;
  static NetworkConstants get instance => _instance ??= NetworkConstants._initialize();

  final String _baseUrl = Platform.isAndroid ? "http://10.0.2.2:3000/api" :  'http://localhost:3000/api';
  String get baseUrl => _baseUrl;

  final int _connectTimeOut = 8000;
  int get connectTimeOut => _connectTimeOut;

  final int _receiveTimeOut = 8000;
  int get receiveTimeOut => _receiveTimeOut;

  NetworkConstants._initialize();
}
