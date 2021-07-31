import 'package:vexana/vexana.dart';

import '../../constants/network_constants.dart';
class NetworkSettings {

  static NetworkSettings? _instance;
  static NetworkSettings get instance => _instance ??= NetworkSettings._initialize();

  late final INetworkManager manager;

  Future<void>? initializeNetworkSettings() {
    manager = NetworkManager(
      options: BaseOptions(
        baseUrl: NetworkConstants.instance.baseUrl,
        connectTimeout: NetworkConstants.instance.connectTimeOut,
        receiveTimeout: NetworkConstants.instance.receiveTimeOut,
      ),
      isEnableLogger: false,
    );
  }

  NetworkSettings._initialize();
}
