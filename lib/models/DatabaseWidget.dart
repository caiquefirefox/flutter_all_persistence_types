import 'package:flutter/material.dart';
import 'ListTileBase.dart';

class DatabaseWidget {
  final String title;
  final String subtitle;
  IconData? icon;
  bool selected = false;
  DatabaseWidget(this.title, this.subtitle, [this.icon]);
}
