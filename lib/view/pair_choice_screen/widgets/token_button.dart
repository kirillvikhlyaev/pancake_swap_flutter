import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pancake_swap_flutter/view/currency_choice_screen/currency_choice_screen.dart';

class TokenButton extends StatelessWidget {
  const TokenButton({super.key, required this.tokenName});

  final String tokenName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CurrencyChoiceScreen(),
        ),
      ),
      child: Row(
        children: [
          Text(tokenName),
          const SizedBox(width: 10),
          const Icon(Icons.expand_more),
        ],
      ),
    );
  }
}
