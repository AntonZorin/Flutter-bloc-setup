import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../locale/app_localization.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.getString("second_page_title"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Text("Empty"),
      ),
    );
  }
}
