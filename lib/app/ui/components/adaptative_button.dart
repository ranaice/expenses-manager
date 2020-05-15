import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const AdaptativeButton({Key key, this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            onPressed: onTap,
          )
        : RaisedButton(
            child: Text(label),
            textColor: Theme.of(context).textTheme.button.color,
            color: Theme.of(context).primaryColor,
            onPressed: onTap,
          );
  }
}
