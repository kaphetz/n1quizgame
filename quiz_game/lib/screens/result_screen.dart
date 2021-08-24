import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: NeumorphicAppBar(
          iconTheme: IconThemeData(
            color: NeumorphicTheme.defaultTextColor(context),
          ),
          automaticallyImplyLeading: false,
          actions: [],
          title: _title(context),
          centerTitle: true,
        ),
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You got ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: NeumorphicTheme.defaultTextColor(context),
                      ),
                    ),
                    Text(
                      '90',
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: NeumorphicTheme.defaultTextColor(context),
                      ),
                    ),
                    Text(
                      ' points!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: NeumorphicTheme.defaultTextColor(context),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    child: GridView.count(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      children: List.generate(20, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NeumorphicButton(
                            style: NeumorphicStyle(
                              color: index % 2 == 0
                                  ? Colors.redAccent[100]
                                  : Colors.teal[400],
                              intensity: 0.75,
                              shape: NeumorphicShape.flat,
                              depth: 3,
                            ),
                            onPressed: () {
                              _showDialog(context);
                            },
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 25,
                                  color:
                                      NeumorphicTheme.defaultTextColor(context),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _groupButton(context),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Correct answer',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        content: Column(
          children: [
            SizedBox(height: 10,),
            Text(
              '勉強',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[700],
              ),
            ),
            Text(
              'べんきょう',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            Text(
              'Học tập',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          )
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return NeumorphicText(
      "Result",
      style: NeumorphicStyle(
        color: NeumorphicTheme.defaultTextColor(context),
        depth: 0,
      ),
      textStyle: NeumorphicTextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _groupButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: NeumorphicButton(
            style: NeumorphicStyle(
              intensity: 0.75,
              shape: NeumorphicShape.flat,
              depth: 3,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: NeumorphicTheme.defaultTextColor(context),
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                NeumorphicText(
                  'Home',
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.defaultTextColor(context),
                    depth: 0,
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            },
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: NeumorphicButton(
            style: NeumorphicStyle(
              intensity: 0.75,
              shape: NeumorphicShape.flat,
              depth: 3,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh,
                  color: NeumorphicTheme.defaultTextColor(context),
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                NeumorphicText(
                  'Try again',
                  style: NeumorphicStyle(
                    color: NeumorphicTheme.defaultTextColor(context),
                    depth: 0,
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/quiz', (Route<dynamic> route) => false);
            },
          ),
        ),
      ],
    );
  }
}
