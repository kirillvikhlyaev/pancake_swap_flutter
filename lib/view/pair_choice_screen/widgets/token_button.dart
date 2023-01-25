import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pancake_swap_flutter/model/token_model.dart';
import 'package:pancake_swap_flutter/view/currency_choice_screen/currency_choice_screen.dart';

class TokenButton extends StatelessWidget {
  const TokenButton(
      {super.key, required this.tokenName, required this.isFirstToken});

  final String tokenName;
  final bool isFirstToken;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CurrencyChoiceScreen(isFirstToken: isFirstToken),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 16,
                child: Center(
                  child: Text(tokenName[0]),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                tokenName,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(width: 10),
              const Icon(Icons.expand_more),
            ],
          ),
        ),
      ),
    );
  }
}
