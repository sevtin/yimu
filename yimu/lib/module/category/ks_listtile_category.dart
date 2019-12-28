

import 'package:flutter/material.dart';

class KSListTile {

  static ks_init({String title, GestureTapCallback onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}