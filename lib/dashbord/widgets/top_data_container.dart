import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vendingapp/model/reading.dart';
import 'package:vendingapp/redux/app_state.dart';

class TopDataContainer extends StatelessWidget {
  const TopDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Reading?>(
        converter: (store) => store.state.reading,
        builder: (context, reading) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Consumed',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff176B87)),
                    ),
                    Text(
                      '${reading != null ? reading.totalVolume.toString() : 0} L',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff176B87)),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/img/drop1.png',
                  height: 150,
                  width: 120,
                ),
                 Column(
                  children: [
                   const Text('Balance',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff176B87))),
                    Text(reading != null ? reading.balance.toString() : '0',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff176B87))),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
