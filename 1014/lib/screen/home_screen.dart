import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// HomeScreen은 메인 화면 구성, 기능: 사용자가 날짜선택 기능
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime.now();  //firstDay를 사용해 날짜를 저장




  // onHeartPressed는 빨간색 하트 아이콘 눌렀을 때 날짜 선택창 호출
  void onHeartPressed() {
    showCupertinoDialog(   //Cupertino 스타일로 다이얼을 띄워서 날짜 선택가능
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date, // 날짜 선택 모드
              initialDateTime: firstDay, // 초기 날짜 설정
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date; // 날짜 업데이트
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true, // 오타 수정
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      //SafeArea는 화면 안전 영역을 고려하여 배치를 해줌
      body: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView( // 스크롤 가능하게 수정
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DDay(
                onHeartPressed: onHeartPressed,
                firstDay: firstDay,
              ),
              _CoupleImage(),
            ],
          ),
        ),
      ),
    );
  }
}





//위젯 _DDay  - 설정한 날짜와 오늘의 날짜를 비교해 D-Day를 계산
class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed,
    required this.firstDay,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now(); //중요 현재 날짜를 가져와 firstDay와 차이를 계산

    return Column(
      children: [
        const SizedBox(height: 16.0),
        Text(
          'U&I',
          style: textTheme.headlineLarge,
        ),
        const SizedBox(height: 16.0),
        Text(
          '우리 처음 만난 날',
          style: textTheme.bodyLarge,
        ),
        Text(
          '${firstDay.year}.${firstDay.month}.${firstDay.day}',
          style: textTheme.bodyMedium,
        ),
        const SizedBox(height: 16.0),
        IconButton(
          iconSize: 60.0,
          onPressed: onHeartPressed,
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          'D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}',
          style: textTheme.headlineMedium,
        ),
      ],
    );
  }
}





//위젯 _CoupleImage
class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        //이미지를 불러옴
        'asset/img/middle_image.png',
        //MediaQuery는 화면 크기를 기준으로 이미지높이를 설정
        height: MediaQuery.of(context).size.height / 2,
        fit: BoxFit.cover, // 이미지를 화면에 맞게 조정
      ),
    );
  }
}