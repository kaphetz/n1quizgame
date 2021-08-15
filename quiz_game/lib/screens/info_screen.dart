import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        iconTheme: IconThemeData(
          color: NeumorphicTheme.defaultTextColor(context),
        ),
        automaticallyImplyLeading: true,
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
            NeumorphicText(
              "JLPT N1 Quiz",
              style: NeumorphicStyle(
                color: NeumorphicTheme.defaultTextColor(context),
                depth: 0,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            NeumorphicText(
              'Version 1.0',
              style: NeumorphicStyle(
                color: NeumorphicTheme.defaultTextColor(context),
                depth: 0,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Ứng dụng hỗ trợ các bạn đang học tiếng Nhật cấp độ N1. Thông qua quiz game, hy vọng các bạn có thể ghi nhớ nhanh từ vựng N1.',
              style: TextStyle(
                fontSize: 16,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'My Food được phát triển bởi KaphetzSoft.',
              style: TextStyle(fontSize: 16, color: NeumorphicTheme.defaultTextColor(context),),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Liên hệ với chúng tôi: kienpt.japan@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '@2021 KaphetzSoft Ltd. All rights reserved.',
              style: TextStyle(
                fontSize: 16,
                color: NeumorphicTheme.defaultTextColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return NeumorphicText(
      "About",
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
}
