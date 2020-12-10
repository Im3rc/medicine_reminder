import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

import 'demo_data.dart';
import 'patientMain.dart';

enum SummaryTheme { dark, light }

Duration _duration = Duration(seconds: 10);

class FlightSummary extends StatelessWidget {
  final BoardingPassData boardingPass;
  final SummaryTheme theme;
  final bool isOpen;

  const FlightSummary(
      {Key key,
      this.boardingPass,
      this.theme = SummaryTheme.light,
      this.isOpen = false})
      : super(key: key);

  Color get mainTextColor {
    Color textColor;
    if (theme == SummaryTheme.dark) textColor = Colors.white;
    if (theme == SummaryTheme.light) textColor = Color(0xFF083e64);
    return textColor;
  }

  Color get secondaryTextColor {
    Color textColor;
    if (theme == SummaryTheme.dark) textColor = Color(0xff61849c);
    if (theme == SummaryTheme.light) textColor = Color(0xFF838383);
    return textColor;
  }

  Color get separatorColor {
    Color color;
    if (theme == SummaryTheme.light) color = Color(0xff292929);
    if (theme == SummaryTheme.dark) color = Color(0xff396583);
    return color;
  }

  TextStyle get bodyTextStyle => TextStyle(
      color: mainTextColor,
      fontSize: 13,
      fontFamily: 'Oswald',
      package: App.pkg);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getBackgroundDecoration(),
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildLogoHeader(),
            //_buildSeparationLine(),
            //_buildTicketHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Stack(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: _buildTicketOrigin()),
                  //Align(alignment: Alignment.center, child: _buildTicketDuration()),
                  Align(
                      alignment: Alignment.centerRight,
                      child: _buildTicketDestination())
                ],
              ),
            ),
            _buildBottomIcon()
          ],
        ),
      ),
    );
  }

  _getBackgroundDecoration() {
    if (theme == SummaryTheme.light)
      return BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Color(0xff292929),
      );
    if (theme == SummaryTheme.dark)
      return BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        //pull medicine image from database and put it here
        image: DecorationImage(
            image: AssetImage('images/App_logo_plain.png', package: App.pkg),
            fit: BoxFit.cover),
      );
  }

  _buildLogoHeader() {
    if (theme == SummaryTheme.light)
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child:
                    Image.asset('images/pill.png', width: 8, package: App.pkg),
              ),
              Text(
                'MedReminder'.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Circular',
                  fontSize: 16,
                  color: Color(0xffF2E7FE),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: SlideCountdownClock(
              duration: _duration,
              slideDirection: SlideDirection.Down,
              separator: "-",
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xffbb86fe),
              ),
              separatorTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xfff2e7fe),
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color(0xff292929), shape: BoxShape.rectangle),
              onDone: () {},
            ),
          ),
        ],
      );
    if (theme == SummaryTheme.dark)
      return Padding(
        padding: const EdgeInsets.only(top: 2.0),
        //child: Image.asset('images/logo_white.png', height: 12, package: App.pkg),
      );
  }

  Widget _buildSeparationLine() {
    return Container(
      width: double.infinity,
      height: 1,
      color: separatorColor,
    );
  }

  Widget _buildTicketHeader(context) {
    var headerStyle = TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.bold,
        fontSize: 11,
        color: Color(0xFFe46565),
        package: App.pkg);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Ms.PatientName", style: headerStyle),
        // Text(boardingPass.passengerName.toUpperCase(), style: headerStyle),
        //Text('BOARDING ${boardingPass.boardingTime.format(context)}', style: headerStyle),
      ],
    );
  }

  Widget _buildTicketOrigin() {
    return Column(
      children: <Widget>[
        Text(
          '\n\nParacetamol',
          style: bodyTextStyle.copyWith(fontSize: 14),
        ),
      ],
    );
  }

  // Widget _buildTicketDuration() {
  //   String planeRoutePath;
  //   if (theme == SummaryTheme.light)
  //     planeRoutePath = 'images/blank.png';
  //   if (theme == SummaryTheme.dark)
  //     planeRoutePath = 'images/blank.png';
  //
  //   return Container(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: <Widget>[
  //         Container(
  //           width: 120,
  //           height: 58,
  //           child: Stack(
  //             alignment: Alignment.center,
  //             children: <Widget>[
  //               Image.asset(planeRoutePath,
  //                   fit: BoxFit.cover, package: App.pkg),
  //               if (theme == SummaryTheme.light)
  //                 Image.asset('images/blank.png',
  //                     height: 20, fit: BoxFit.contain, package: App.pkg),
  //               if (theme == SummaryTheme.dark)
  //                 _AnimatedSlideToRight(
  //                   child: Image.asset('images/blank.png',
  //                       height: 20, fit: BoxFit.contain, package: App.pkg),
  //                   isOpen: isOpen,
  //                 )
  //             ],
  //           ),
  //         ),
  //         Text(boardingPass.duration.toString(),
  //             textAlign: TextAlign.center, style: bodyTextStyle),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTicketDestination() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          boardingPass.destination.code.toUpperCase(),
          style: bodyTextStyle.copyWith(fontSize: 42),
        ),
        Text(
          boardingPass.destination.city,
          style: bodyTextStyle.copyWith(color: secondaryTextColor),
        ),
      ],
    );
  }

  Widget _buildBottomIcon() {
    IconData icon;
    if (theme == SummaryTheme.light) icon = Icons.keyboard_arrow_down;
    if (theme == SummaryTheme.dark) icon = Icons.keyboard_arrow_up;
    return Icon(
      icon,
      color: mainTextColor,
      size: 18,
    );
  }
}

class _AnimatedSlideToRight extends StatefulWidget {
  final Widget child;
  final bool isOpen;

  const _AnimatedSlideToRight({Key key, this.child, @required this.isOpen})
      : super(key: key);

  @override
  _AnimatedSlideToRightState createState() => _AnimatedSlideToRightState();
}

class _AnimatedSlideToRightState extends State<_AnimatedSlideToRight>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1700), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isOpen) _controller.forward(from: 0);
    return SlideTransition(
      position: Tween(begin: Offset(-2, 0), end: Offset(1, 0)).animate(
          CurvedAnimation(curve: Curves.easeOutQuad, parent: _controller)),
      child: widget.child,
    );
  }
}
