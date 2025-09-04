import 'package:flutter/material.dart';
import 'package:flutter_provider/src/providers/network_provider/network_provider.dart';
import 'package:provider/provider.dart';

class ConnectionStatusBanner extends StatefulWidget {
  const ConnectionStatusBanner({super.key});

  @override
  State<ConnectionStatusBanner> createState() => _ConnectionStatusBannerState();
}

class _ConnectionStatusBannerState extends State<ConnectionStatusBanner> {
  @override
  void didChangeDependencies() {
    context.read<NetworkProvider>().onApiCall = () {
      debugPrint("Internet is back! Recall APIs here...");
      debugPrint("didChangeDependencies");
    };
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final network = context.watch<NetworkProvider>();

    return AnimatedSize(
      duration: const Duration(milliseconds: 2000),
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 2000),
        opacity: network.showBanner ? 1 : 0,
        curve: Curves.easeInOut,
        child: network.showBanner
            ? Container(
                color: network.isConnected
                    ? Colors.green.withOpacity(0.9)
                    : Theme.of(context).colorScheme.error.withOpacity(0.9),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                child: Text(
                  network.isConnected
                      ? 'Back to online'
                      : 'No internet connection',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
