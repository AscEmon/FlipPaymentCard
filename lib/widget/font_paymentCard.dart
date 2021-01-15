import 'package:flutter/material.dart';

class FontPaymentCard extends StatelessWidget {
  final String cardNumber;
  final String holderName;
  final String cardExpiry;
  String _formattedCardNumber;
  String _formattedExpiryDate;
  FontPaymentCard({Key key,this.cardNumber,this.holderName,this.cardExpiry}) : super(key: key)
  {
   _formattedCardNumber=this.cardNumber.padRight(16,'*');
   _formattedCardNumber= _formattedCardNumber.replaceAllMapped(RegExp(r".{4}"),(match)=>"${match.group(0)} ");
 _formattedExpiryDate =
        this.cardExpiry.replaceAllMapped(RegExp(r".{2}"), (match) => "${match.group(0)}");

    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 240,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffD2D2D2),
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: SingleChildScrollView(
                     child: Column(
                    
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20,top: 20),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Visa Card',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_formattedCardNumber,style: TextStyle(color: Colors.black,letterSpacing: 2,fontSize: 20,fontWeight: FontWeight.w900),),
                          ],
                        ),
                      ),
                        SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Card Holder',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                                Text(holderName,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Expiry',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                                Text(_formattedExpiryDate,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700,fontStyle: FontStyle.normal),)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ); 
  }
}