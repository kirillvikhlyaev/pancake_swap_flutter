import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pancake_swap_flutter/controller/pancake_swap_provider.dart';
import 'package:provider/provider.dart';

class CurrencyRateScreen extends StatelessWidget {
  const CurrencyRateScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<PancakeSwapProvider>();
    final pair = context.watch<PancakeSwapProvider>().currentPair;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Currency Rate'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              '1 ${pair.token1!.name} = ${watcher.result} ${pair.token2!.name}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text('Actual for ${watcher.dateOfReceipt}',
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
