import 'package:flutter/material.dart';
class ReusableCrd extends StatelessWidget {
  final Color Colour;
  final Widget cardChild;
  final Function onPress;
  ReusableCrd({@required this.Colour, this.cardChild,this.onPress});
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
