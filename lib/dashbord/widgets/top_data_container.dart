import 'package:flutter/material.dart';

class TopDataContainer extends StatelessWidget {
  const TopDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Text(
                'Total',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff176B87)),
              ),
              Text(
                '20 L',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff176B87)),
              ),
            ],
          ),
          Image.asset(
            'assets/img/drop1.png',
            height: 150,
            width: 200,
          ),
          const Column(
            children: [
              Text('Price',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff176B87))),
              Text('20,000',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff176B87))),
            ],
          ),
        ],
      ),
    );
  }
}
