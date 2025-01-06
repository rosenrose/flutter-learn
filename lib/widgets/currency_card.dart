import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String currencyName;
  final String currencyCode;
  final double currencyAmt;
  final IconData currencyIcon;
  final bool isLightMode;

  final Color _blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.currencyName,
    required this.currencyCode,
    required this.currencyAmt,
    required this.currencyIcon,
    this.isLightMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isLightMode ? Colors.white : _blackColor,
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currencyName,
                  style: TextStyle(
                    color: isLightMode ? _blackColor : Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      currencyAmt.toString(),
                      style: TextStyle(
                        color: isLightMode ? _blackColor : Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      currencyCode,
                      style: TextStyle(
                        color: isLightMode ? Colors.black87 : Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: const Offset(-5, 12),
                child: Icon(
                  currencyIcon,
                  color: isLightMode ? _blackColor : Colors.white,
                  size: 88,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
