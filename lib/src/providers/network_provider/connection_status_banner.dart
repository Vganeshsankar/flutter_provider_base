import 'package:flutter/material.dart';
import 'package:flutter_provider/src/providers/network_provider/network_provider.dart';
import 'package:provider/provider.dart';

class ConnectionStatusBanner extends StatelessWidget {
  const ConnectionStatusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 2000),
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 2000),
        opacity: context.watch<NetworkProvider>().showBanner ? 1 : 0,
        curve: Curves.easeInOut,
        child: context.watch<NetworkProvider>().showBanner
            ? Container(
                color: context.watch<NetworkProvider>().isConnected
                    ? Colors.green.withOpacity(0.9)
                    : Theme.of(context).colorScheme.error.withOpacity(0.9),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                child: Text(
                  context.watch<NetworkProvider>().isConnected
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
