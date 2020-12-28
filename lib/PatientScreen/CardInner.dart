//Details in the opened card
import 'package:medicine_reminder/Backend%20Services/Database%20System/Data%20Models/ScheduleModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CardData.dart';

class MiddleCard extends StatelessWidget {
  final newScheduleModel medicineCard;
   MiddleCard(this.medicineCard);
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Color(0xff292929),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Name'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 14,
                          color: Color(0xffF2E7FE).withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                        ),
                      ), //titleTextStyle),
                      Text(
                        medicineCard.medName,
                        style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 16,
                          color: Colors.white,
                          //fontWeight: FontWeight.w600,
                          fontWeight: FontWeight.bold,
                          height: 2,
                          letterSpacing: .5,
                        ),
                      ), //contentTextStyle),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Quantity'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 14,
                          color: Color(0xffF2E7FE).withOpacity(0.6),
                          fontWeight: FontWeight.w700,
                        ),
                      ), //titleTextStyle),
                      Text(
                        "       "+medicineCard.dosage,
                        style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 2,
                          letterSpacing: .5,
                        ),
                      ), //contentTextStyle),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'TIME',
                        style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 14,
                          color: Color(0xffF2E7FE).withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                        ),
                      ), //titleTextStyle),
                      Text(
                         medicineCard.time,
                        style: TextStyle(
                          fontFamily: 'Circular',
                          fontSize: 16,
                          color: Color(0xfff2e7fe),
                          fontWeight: FontWeight.bold,
                          height: 2,
                          letterSpacing: .5,
                        ),
                      ), //contentTextStyle)
                    ]),
              ],
            ),
          ],
        ),
      );
}
