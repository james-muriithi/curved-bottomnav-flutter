import 'package:bottom_nav/seat_arrangement.dart';
import 'package:flutter/material.dart';

Color purpleColor = Color(0xFF2B1AAF);
Color lightGreyColor = Color(0xFFABB6C9);
Color greyColor = Color(0xFF4F4F51);
Color black = Color(0xFF161515);
Color brown = Color(0xFFA6725F);
Color green = Color(0xFF00BB00);

TextStyle boldBlackLargeTextStyle = TextStyle(
    color: black,
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Josefin');

TextStyle lightJosefin = TextStyle(
    color: Color.fromRGBO(153, 162, 168, 1),
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    fontFamily: 'Josefin');

TextStyle normalGreyTextStyle = TextStyle(
  color: greyColor,
  fontSize: 14.0,
);

TextStyle boldPurpleTextStyle =
    TextStyle(color: purpleColor, fontSize: 16.0, fontWeight: FontWeight.w600);

TextStyle normalBlackSmallTextStyle = TextStyle(
  color: black,
  fontSize: 12.0,
);

class ResultCard extends StatefulWidget {
  final String busName, numberPlate, from, to, availability, fare;
  ResultCard(this.busName, this.numberPlate, this.from, this.to,
      this.availability, this.fare);

  @override
  ResultCardState createState() => ResultCardState();
}

class ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(6.0),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 0.0, left: 16.0, right: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://james-muriithi.github.io/bus/images/p.png'),
                      width: 70,
                      height: 70,
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "KCD 452G (Majaoni School Bus)",
                          style: boldBlackLargeTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 4.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 0.0, left: 16.0, right: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _showDetals(Icons.watch, 'Departure:', '20:30 hr'),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        _showDetals(
                            Icons.directions, 'Route', 'Pwani Uni - Kabarak'),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        _showDetals(Icons.airline_seat_legroom_extra,
                            'Availability', '2 seats left'),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        _showDetals(Icons.monetization_on, 'Fare', '3000')
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Divider(
                height: 0.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.deepPurple,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) =>
                              new MyHomePage(title: 'Seat Arrangement'),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Book'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _showDetals(IconData icon, String label, String value) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.84,
        child: Row(children: <Widget>[
          Icon(
            icon,
            color: Color.fromRGBO(153, 162, 168, 1),
          ),
          Text(
            label,
            style: lightJosefin,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: Text(value, style: boldBlackLargeTextStyle)),
          )
        ]));
  }
}
