import 'package:flutter/material.dart';
import 'package:vendingapp/dashbord/widgets/data_display_tile.dart';

class DisplayContainer extends StatelessWidget {
  const DisplayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        child: Container(
      width: size.width,
      decoration: const BoxDecoration(
          color: Color(0xff86B6F6),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(55), topRight: Radius.circular(55))),
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 15),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Recent usage',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 25,
                        color: Color(0xff176B87)))
              ],
            ),
            const SizedBox(
              height:15,
            ),
            Expanded(
                child: ListView(
              scrollDirection: Axis.vertical,
              children: const [
                DataDisplayTile(),
                DataDisplayTile(),
                DataDisplayTile(),
                DataDisplayTile(),
                DataDisplayTile(),
                DataDisplayTile()
              ],
            ))
          ],
        ),
      ),
    ));
  }
}
