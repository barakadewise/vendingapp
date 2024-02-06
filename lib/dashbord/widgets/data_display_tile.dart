import 'package:flutter/material.dart';
import 'package:vendingapp/model/transactions.dart';

class DataDisplayTile extends StatefulWidget {
  final Transaction transaction;
  const DataDisplayTile(this.transaction);

  @override
  State<DataDisplayTile> createState() => _DataDisplayTileState();
}

class _DataDisplayTileState extends State<DataDisplayTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff176B87).withOpacity(0.4),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: Image.asset(
                    'assets/img/water_Bottle.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.transaction.type,
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xff176B87)),
                  ),
                  // Visibility(
                  //   visible: widget.transaction.type == 'Purchase',
                  //   child: Text(
                  //     '2L',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w400, color: Color(0xff176B87)),
                  //   ),
                  // )
                ],
              ),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Amount',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xff176B87)),
                  ),
                  Text(
                    widget.transaction.amount,
                    style: TextStyle(color: Color(0xff176B87)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
