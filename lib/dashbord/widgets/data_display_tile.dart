import 'package:flutter/material.dart';

class DataDisplayTile extends StatefulWidget {
  const DataDisplayTile({super.key});

  @override
  State<DataDisplayTile> createState() => _DataDisplayTileState();
}

class _DataDisplayTileState extends State<DataDisplayTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffB4D4FF),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: Image.asset(
                    'assets/img/water_Bottle.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Volume',style:TextStyle(fontWeight: FontWeight.w500),), Text('2L',style: TextStyle(fontWeight: FontWeight.w300),)],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Price',style: TextStyle(fontWeight: FontWeight.w600),), Text('1000')],
              )
            ],
          ),
        ),
      ),
    );
  }
}