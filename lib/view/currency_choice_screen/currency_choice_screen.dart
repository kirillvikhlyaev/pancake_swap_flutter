import 'package:flutter/material.dart';
import 'package:pancake_swap_flutter/controller/pancake_swap_provider.dart';
import 'package:pancake_swap_flutter/model/token_model.dart';
import 'package:pancake_swap_flutter/view/currency_choice_screen/widgets/token_tile.dart';
import 'package:provider/provider.dart';

class CurrencyChoiceScreen extends StatelessWidget {
  const CurrencyChoiceScreen({
    super.key,
    required this.isFirstToken,
  });
  final bool isFirstToken;
  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<PancakeSwapProvider>();

    List<Widget> tiles = tokens.map((token) {
      return TokenTile(
        tokenModel: token,
        isFirstToken: isFirstToken,
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Choice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) => tiles[index],
          itemCount: tiles.length,
          separatorBuilder: (context, _) => const SizedBox(
            height: 10,
          ),
        ),
      ),
    );
  }
}
