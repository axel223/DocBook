import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colours.dart';

enum ConfirmAction
{
  CANCEL,ACCEPT
}

class Alerts {

  Future<void> _ackAlert(BuildContext context , String title,String text,String buttonText) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              title,
              style: GoogleFonts.poppins(
                color: DocBookColors.buttonColor,
                fontSize: 15
              )
          ),
          content: Text(
              text,
              style: GoogleFonts.poppins(
              color: DocBookColors.buttonColor,
              fontSize: 15
              )
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset settings?'),
        content: const Text(
            'This will reset your device to its default factory settings.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}
}