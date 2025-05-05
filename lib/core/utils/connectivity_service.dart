import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityService {
  final Connectivity _connectivity;

  ConnectivityService(this._connectivity);

  Future<bool> isConnected() async {
    final List<ConnectivityResult> results = await _connectivity.checkConnectivity();

    return results.any((final result) => result != ConnectivityResult.none);
  }

  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivity.onConnectivityChanged;
}
