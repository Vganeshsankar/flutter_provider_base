import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class NetworkProvider with ChangeNotifier {
  NetworkProvider() {
    _initState();
  }

  /// Internet connection status
  bool isConnected = true;

  /// Internet banner widget visibility
  bool showBanner = false;

  /// Connectivity status lessener
  late StreamSubscription streamSubscription;

  /// Banner visibility timer
  Timer? hideBannerTimer;

  void _initState() {
    checkInitialConnection();
    streamSubscription = Connectivity().onConnectivityChanged.listen(
      updateConnectionStatus,
    );
  }

  void checkInitialConnection() async {
    final result = await Connectivity().checkConnectivity();
    updateConnectionStatus(result, initial: true);
    notifyListeners();
  }

  void updateConnectionStatus(
      List<ConnectivityResult> result, {
        bool initial = false,
      }) {
    final hasInternet = result.first != ConnectivityResult.none;

    if (initial) {
      isConnected = hasInternet;
      if (!hasInternet) showBanner = true;
      notifyListeners();
      return;
    }

    if (hasInternet != isConnected) {
      isConnected = hasInternet;

      hideBannerTimer?.cancel();

      if (!hasInternet) {
        // Show "No Internet Connection" continuously
        showBanner = true;
      } else {
        // Show "Back Online" briefly
        showBanner = true;
        hideBannerTimer = Timer(const Duration(seconds: 2), () {
          showBanner = false;
          notifyListeners();
        });
      }
    }
    notifyListeners();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    hideBannerTimer?.cancel();
    super.dispose();
  }
}
