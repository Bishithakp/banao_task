import 'package:flutter/cupertino.dart';


class Apploading extends StatelessWidget {
  const Apploading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}