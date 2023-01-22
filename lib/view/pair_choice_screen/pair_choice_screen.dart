import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pancake_swap_flutter/view/currency_rate_screen/currency_rate_screen.dart';
import 'package:pancake_swap_flutter/view/pair_choice_screen/widgets/token_button.dart';
import 'package:http/http.dart' as http;

class PairChoiceScreen extends StatelessWidget {
  const PairChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pair Choice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TokenButton(tokenName: 'ATOM'),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 25),
            TokenButton(tokenName: 'CAKE'),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            Spacer(),
            OutlinedButton(

                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CurrencyRateScreen(),
                    )),
                child: Text('Watch')),
          ],
        ),
      ),
    );
  }
}
