import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/Button.dart';
import 'package:flutter_learn/widgets/currency_card.dart';

void main() {
  var nico = Player(name: "nico");

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Hey, Flutter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "\$5,194,482",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: "Transfer",
                      textColor: Colors.black,
                      bgColor: Color(0xFFF2B33A),
                    ),
                    Button(
                      text: "Request",
                      textColor: Colors.white,
                      bgColor: Color(0xFF1F2123),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                const CurrencyCard(
                  currencyName: "Euro",
                  currencyCode: "EUR",
                  currencyAmt: 6.428,
                  currencyIcon: Icons.euro_rounded,
                ),
                Transform.translate(
                  offset: const Offset(0, -25),
                  child: const CurrencyCard(
                    currencyName: "Dollar",
                    currencyCode: "USD",
                    currencyAmt: 10.998,
                    currencyIcon: Icons.attach_money_rounded,
                    isLightMode: true,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -50),
                  child: const CurrencyCard(
                    currencyName: "Bitcoin",
                    currencyCode: "BTC",
                    currencyAmt: 9.785,
                    currencyIcon: Icons.currency_bitcoin_rounded,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Player {
  String name;

  Player({required this.name});
}
