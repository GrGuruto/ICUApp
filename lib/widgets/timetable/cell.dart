import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icuapp/model/constant.dart';
import 'package:icuapp/model/sharedpref.dart';
import 'package:icuapp/screen/choosepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

//時間割の授業名の入るセル
class Cell extends ConsumerWidget {
  final String period_day;
  const Cell(this.period_day, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eighthClass = ref.watch(eighthClassProvider);
    final remainHeight = ref.watch(remainHeightProvider);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        chosenTime = period_day;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChoosePage()),
        );
      },
      child: Container(
        height: (eighthClass == true) ? remainHeight / 9 : remainHeight / 8,
        child: Align(
          alignment: Alignment.center,
          child: CellText(period_day),
        ),
      ),
    );
  }
}

class CellText extends ConsumerWidget {
  final String period_day;
  const CellText(this.period_day, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TT = ref.watch(TTProvider);
    final FontSize = ref.watch(cellFontSizeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TT[period_day][0]!,
          style:
              TextStyle(fontSize: double.parse(FontSize), color: Colors.black),
          textAlign: TextAlign.center,
          maxLines: int.parse(FontSize) <= 11
              ? 3
              : int.parse(FontSize) <= 14
                  ? 2
                  : 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          TT[period_day][1]!,
          style:
              TextStyle(fontSize: double.parse(FontSize), color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
