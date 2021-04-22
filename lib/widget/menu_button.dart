import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final BuildContext ctx;
  final Function toTheNextPage;
  final String text;

  MenuButton(this.ctx, this.text, this.toTheNextPage);

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.all(20),
      child: ElevatedButton(
          child: Text(text),
          onPressed: () {
            toTheNextPage(ctx);
            // Navigator.push(
            //     ctx, MaterialPageRoute(builder: (ctx) => toTheNextPage()));
          },
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 20)))),
    );
  }
}
