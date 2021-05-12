import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final BuildContext ctx;
  final String text;
  final String routeName;

  MenuButton(this.ctx, this.text, this.routeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
          child: Text(text),
          onPressed: () {
            Navigator.pushNamed(ctx, routeName);
          },
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 20)))),
    );
  }
}
