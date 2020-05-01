import 'package:flutter/material.dart';

import 'adaptive.dart';
import 'main.dart';
import 'colours.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var list = ['Terms & Conditions', 'Any Setting option', 'Log Out'];
  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: isDisplayDesktop(context) ? 24 : 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            for (String title in list) ...[
              _SettingsItem(title),
//              const Divider(
//                color: DocBookColors.dividerColor,
//                height: 2,
//              )
            ]
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.black,
      color: Colors.white,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Text(title),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(DocBook.loginRoute);
      },
    );
  }
}
