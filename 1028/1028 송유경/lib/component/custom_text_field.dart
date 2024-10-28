import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget{
  final String label;     //텍스트 필드 제목
  final bool isTime;      //시간 선택하는 텍스트 필드인지 여부

  const CustomTextField({
    required this.label,
    required this.isTime,
    Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(        //세로로 텍스트, 텍스트 필드 배치
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: isTime ? 0:1,
            child: TextFormField(
              cursorColor: Colors.grey,
              maxLines: isTime ? 1:null,

              expands: !isTime,
              keyboardType: isTime ? TextInputType.number : TextInputType.multiline,

              inputFormatters: isTime
                  ?[
                FilteringTextInputFormatter.digitsOnly,
              ]   :[],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[300],
                suffixText: isTime ? '시' :null,
              ),
            ),
        ),
      ],
    );
  }
}