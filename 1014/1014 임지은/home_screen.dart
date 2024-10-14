import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        // 시스템 UI 피해서 UI 그리기
        top: true,
        bottom: false,
        child: Column(
          // 반대 축 최대 크기로 늘리기
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 18.0,
            ),
            _CoupleImage(imagePath: 'asset/img/first_image.png'),
            SizedBox(
              height: 25.0,
            ),
            _DDay(
              // 하트 눌렀을때 실행할 함수 전달하기
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            SizedBox(
              height: 30.0,
            ),
            _CoupleImage(imagePath: 'asset/img/second_image.png'),
          ],
        ),
      ),
    );
  }

  void onHeartPressed() {
    // 하트 눌렀을때 실행할 함수
    showCupertinoDialog(
      // 쿠퍼티노 다이얼로그 실행
      context: context,
      builder: (BuildContext context) {
        return Align(
          //  정렬을 지정하는 위젯
          alignment: Alignment.bottomCenter, // ➋ 아래 중간으로 정렬
          child: Container(
            color: Colors.white, // 배경색 흰색 지정
            height: 300, // 높이 300 지정
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed, // 상위에서 함수 입력받기
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        Text(
          // 두번째 글자
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        IconButton(
          // 하트 아이콘 버튼
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.grey[300],
              ),
              Text(
                // 만난 후 DDay
                'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
                style: textTheme.displayMedium,
              ),
            ],
          ),
        ),
        Text(
          // 임시로 지정한 만난 날짜
          '${firstDay.year}.${firstDay.month}.${firstDay.day} ~',
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  final String imagePath;

  _CoupleImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          imagePath,
          height: 270.0,
          width: 270.0,
          fit: BoxFit.cover, // 사진을 원에 맞춤
        ),
      ),
    );
  }
}

