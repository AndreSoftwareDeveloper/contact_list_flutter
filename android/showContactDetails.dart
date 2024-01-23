import 'package:flutter/material.dart';

void showContactDetails(BuildContext context, int index, List contacts) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: Row(
        children: [
          Row(
            children: [
              Text(
                "\nFirst name:\t${contacts[index].name}"
                    "\n\nSecond name:\t${contacts[index].surname}"
                    "\n\nPhone number:\t${contacts[index].phoneNumber}",
              ),
            ],
          ),
        ],
      ),
    ),
  );
}