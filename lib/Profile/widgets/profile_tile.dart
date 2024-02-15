import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String value;

  const ProfileTile({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  color: Color(0xff176B87),
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(value,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
          ),
        ],
      ),
    );
  }
}
