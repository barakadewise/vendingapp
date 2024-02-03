import 'package:flutter/material.dart';

void showSnack(context, message) {
  if (context != null) {
    final snackBar = SnackBar(
        backgroundColor: const Color(0xffEEF5FF),
        content: Container(
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xff176B87).withOpacity(0.5),
              borderRadius: BorderRadius.circular(17)),
          child: Center(
            child: Text(
              message.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
