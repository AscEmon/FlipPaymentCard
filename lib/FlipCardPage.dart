import 'dart:math' as math;

import 'package:flipPaymentCard/widget/back_paymentCard.dart';
import 'package:flipPaymentCard/widget/font_paymentCard.dart';
import 'package:flutter/material.dart';

class FlipCardPage extends StatefulWidget {
  FlipCardPage({Key key}) : super(key: key);

  @override
  _FlipCardPageState createState() => _FlipCardPageState();
}

class _FlipCardPageState extends State<FlipCardPage>
    with SingleTickerProviderStateMixin {
  String _cardNumber = '';
  String _holderName = '';
  String _cardExpiry = '';
  String _cvvNumber = '';
  TextEditingController cardNum, holderNameedit, cardExpiryController, cvvEdit;
  AnimationController _flipanimationController;
  Animation<double> _flipAnimation;
  FocusNode _cvvFocus;
 @override
  void initState() {
    super.initState();
    _flipanimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 450));
    _flipAnimation =
        Tween<double>(begin: 0, end: 1).animate(_flipanimationController)
          ..addListener(() {
            setState(() {});
          });
    //  flipanimationController.forward();
  }

  _FlipCardPageState() {
    cardNum = TextEditingController();
    holderNameedit = TextEditingController();
    cardExpiryController = TextEditingController();
    cvvEdit = TextEditingController();
    _cvvFocus = FocusNode();
    cardNum.addListener(() {
      _cardNumber = cardNum.text;
      setState(() {});
    });
    holderNameedit.addListener(() {
      _holderName = holderNameedit.text;
      setState(() {});
    });
    cardExpiryController.addListener(() {
      _cardExpiry = cardExpiryController.text;
      setState(() {});
    });
    cvvEdit.addListener(() {
      _cvvNumber = cvvEdit.text;
      setState(() {});
    });
    _cvvFocus.addListener(() {
      _cvvFocus.hasFocus
          ? _flipanimationController.forward()
          : _flipanimationController.reverse();
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 280,
              child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(math.pi * _flipAnimation.value),
                  origin: Offset(MediaQuery.of(context).size.width / 2, 0),
                  child: _flipAnimation.value < 0.5
                      ? FontPaymentCard(
                          cardNumber: _cardNumber,
                          holderName: _holderName,
                          cardExpiry: _cardExpiry,
                        )
                      : BackPaymnetCard(cvvNumber: _cvvNumber)),
            ),
          

            SingleChildScrollView(
                 child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TextField(
                           keyboardType: TextInputType.number,
                          controller: cardNum,
                          maxLength: 16,
                          decoration: InputDecoration(hintText: 'Enter Card Number'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: holderNameedit,
                          decoration:
                              InputDecoration(hintText: 'Enter Card Holder Name'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextField(
                                keyboardType: TextInputType.datetime,
                                controller:cardExpiryController,
                                decoration: InputDecoration(hintText: 'Expiry Date'),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: cvvEdit,
                                focusNode: _cvvFocus,
                                maxLength: 4,
                                decoration: InputDecoration(hintText: 'CVV Number',counterText: ''),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
