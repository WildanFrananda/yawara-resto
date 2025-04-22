import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityService {
  final connectivity = Connectivity();

  Future<bool> isConnected() async {
    final List<ConnectivityResult> results = await connectivity.checkConnectivity();

    return results.any((final result) => result != ConnectivityResult.none);
  }

  Stream<List<ConnectivityResult>> get connectivityStream =>
      connectivity.onConnectivityChanged;
}
