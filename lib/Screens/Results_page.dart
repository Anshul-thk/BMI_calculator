import 'package:bmi_calculator/Components/Bottom_Button.dart';
import 'package:bmi_calculator/Components/reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/constants.dart';
class Results_page extends StatelessWidget {

  Results_page({@required this.bmiresult,this.ResultText,this.Interpretation});
  final String bmiresult;
  final String ResultText;
  final String Interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RESULTS'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Results'),
              ),
            ),
            Expanded(
                flex: 5,
              child: ReusableCrd(
                Colour: kReusablecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(ResultText.toUpperCase(),style: kresulttextstyle,),
                    Text(
                      bmiresult,
                      style: kBMITextStyle,
                    ),
                    Text(Interpretation.toUpperCase(),textAlign: TextAlign.center,style: kinterpretation,),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: (){Navigator.pop(context);},
            ),
          ],
        ));
  }
}
