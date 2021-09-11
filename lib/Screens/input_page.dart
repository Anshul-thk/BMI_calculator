import 'Results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import '../Components/reusablecard.dart';
import '../constants.dart';
import 'Results_page.dart';
import 'package:bmi_calculator/Components/Rond_Icon.dart';
import 'package:bmi_calculator/Components/Bottom_Button.dart';
import 'package:bmi_calculator/Calculator.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height=180;
  int weight=60;
  int age=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCrd(
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      Colour: selectedgender == Gender.male
                          ? kReusablecardcolor
                          : kInactivecardcolor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.male,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCrd(
                        onPress: () {
                          setState(() {
                            selectedgender = Gender.female;
                          });
                        },
                        Colour: selectedgender == Gender.female
                            ? kReusablecardcolor
                            : kInactivecardcolor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.female,
                          label: 'FEMALE',
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCrd(
                Colour: kReusablecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabeltextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text('cm',style: kLabeltextstyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCrd(Colour: kReusablecardcolor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',
                          style: kLabeltextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onpressed: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                             ),

                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: (){
                            setState(() {
                              weight++;
                            }
                            );
                          },)
                            ],
                          ),
                            ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCrd(
                        Colour: kReusablecardcolor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',
                            style: kLabeltextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: (){
                                  setState(() {
                                    age --;
                                  });
                                },
                              ),

                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: (){
                                  setState(() {
                                    age++;
                                  }
                                  );
                                },)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(buttonTitle: 'Calculate',
            onTap: (){

              CalculatorBrain calc= CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Results_page(
                bmiresult: calc.CalculateBMI(),
                ResultText: calc.GetResult(),
                Interpretation: calc.GetInterpretataion(),
              )));
            },),
          ],
        ));
  }
}

