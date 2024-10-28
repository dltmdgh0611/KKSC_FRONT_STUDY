import 'package:calendar_scheduler/component/main_calendar.dart';
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/schedule_card.dart';
import 'package:calendar_scheduler/component/today_banner.dart';
import 'package:calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:calendar_scheduler/const/colors.dart';

class HomeScreen extends StatefulWidget {
  //StatefulWidget 로 변경
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: (){
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            builder: (_) => ScheduleBottomSheet(),

            isScrollControlled: true,
          );
        },
        child: Icon(
            Icons.add,
        ),
    ),
      body: SafeArea(
      child:
        Column(
            children: [
              MainCalendar(
                selectedDate: selectedDate,       //선택된 날짜 전달
                //날짜 선택시 실행할 함수
                onDaySelected: onDaySelected,
              ),
              SizedBox(height: 8.0),
              TodayBanner(                      //배너 추가하기
                  selectedDate: selectedDate,
                  count: 0,
              ),
              SizedBox(height: 8.0),
              ScheduleCard(     //일정 카드
                  startTime: 12,
                  endTime: 14,
                  content: '프로그래밍 공부',
              ),
            ],
          ),
      ),
    );
  }
  
  void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    // 날짜 선택될 때마다 실행할 함수
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}