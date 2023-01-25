import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pancake_swap_flutter/controller/pancake_swap_provider.dart';
import 'package:pancake_swap_flutter/model/token_model.dart';
import 'package:pancake_swap_flutter/view/currency_rate_screen/currency_rate_screen.dart';
import 'package:pancake_swap_flutter/view/pair_choice_screen/widgets/token_button.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3dart/web3dart.dart' as web3;

class PairChoiceScreen extends StatefulWidget {
  const PairChoiceScreen({super.key});

  @override
  State<PairChoiceScreen> createState() => _PairChoiceScreenState();
}

class _PairChoiceScreenState extends State<PairChoiceScreen> {
  @override
  void dispose() {
    context.read<PancakeSwapProvider>().fetchingTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pair = context.watch<PancakeSwapProvider>().currentPair;
    final reader = context.read<PancakeSwapProvider>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Pair Choice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 75),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TokenButton(
                  tokenName: pair.token1!.name,
                  isFirstToken: true,
                ),
                const SizedBox(height: 25),
                const Icon(
                  MdiIcons.arrowDownCircle,
                  size: 36,
                ),
                const SizedBox(height: 25),
                TokenButton(
                  tokenName: pair.token2!.name,
                  isFirstToken: false,
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
                // onPressed: getPrice,
                onPressed: () {
                  reader
                      .getPrice(pair.token1!.address, pair.token2!.address)
                      .then(
                        (_) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CurrencyRateScreen(),
                          ),
                        ),
                      );
                },
                child: const Text('Watch')),
          ],
        ),
      ),
    );
  }
}

// TODO: Почитать про ABI
