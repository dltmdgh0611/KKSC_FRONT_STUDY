import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_scheduler/const/colors.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;        //날짜 선택 시 실행할 함수
  final DateTime selectedDate;

  MainCalendar({
    required this.onDaySelected,
    required this.selectedDate,
});

  @override
  Widget build(BuildContext context) {      // TODO: implement build
    return TableCalendar(
      locale: 'ko_kr',                        //한국어로 언어 변경
      onDaySelected: onDaySelected,           //날짜 선택 시 실행할 함수
      selectedDayPredicate: (date) =>         //선택된 날짜를 구분할 로직
        date.year == selectedDate.year &&
        date.month == selectedDate.month &&
        date.day == selectedDate.day,

      firstDay: DateTime(1800, 1, 1),   //첫째 날
      lastDay: DateTime(3000, 1, 1),    //둘째 날
      focusedDay: DateTime.now(),       //화면에 보여지는 날

      headerStyle: HeaderStyle(                 // 1) 달력 최상단 스타일
        titleCentered: true,                    //제목 중앙에 위치
        formatButtonVisible: false,             //달력 크기 선택 옵션 없애기
        titleTextStyle: TextStyle(              //제목 글꼴 지정
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(         // 2) 기본 날짜 스타일 
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_GREY_COLOR,
        ),
        weekendDecoration: BoxDecoration(         // 3) 주말 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          color: LIGHT_GREY_COLOR,
        ),
        selectedDecoration: BoxDecoration(        // 4) 선택된 날짜 스타일
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1.0,
          ),
        ),
        defaultTextStyle: TextStyle(              // 5) 기본 글꼴
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        weekendTextStyle: TextStyle(              // 6) 주말 글꼴
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        selectedTextStyle: TextStyle(             // 7) 선택된 날짜 글꼴
          fontWeight: FontWeight.w600,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}