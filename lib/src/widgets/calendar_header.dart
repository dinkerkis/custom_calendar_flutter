// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../customization/header_style.dart';
import '../shared/utils.dart' show CalendarFormat, DayBuilder;
import 'custom_icon_button.dart';
import 'format_button.dart';

class CalendarHeader extends StatelessWidget {

  final dynamic locale;
  final DateTime focusedMonth;
  final CalendarFormat calendarFormat;
  final HeaderStyle headerStyle;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onHeaderTap;
  final VoidCallback onHeaderLongPress;
  final ValueChanged<CalendarFormat> onFormatButtonTap;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;

  const CalendarHeader({
    Key? key,
    this.locale,
    required this.focusedMonth,
    required this.calendarFormat,
    required this.headerStyle,
    required this.onTodayButtonTap,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onHeaderTap,
    required this.onHeaderLongPress,
    required this.onFormatButtonTap,
    required this.availableCalendarFormats,
    this.headerTitleBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = headerStyle.titleTextFormatter?.call(focusedMonth, locale) ?? DateFormat.yMMMM(locale).format(focusedMonth);

    return Container(
      decoration: headerStyle.decoration,
      margin: headerStyle.headerMargin,
      padding: headerStyle.headerPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              text,
              style: headerStyle.titleTextStyle,
              textAlign: headerStyle.titleCentered
                  ? TextAlign.center
                  : TextAlign.start,
            ),
          ),
          Row(
            children: [
              if (headerStyle.todayButtonVisible)
                InkWell(
                  onTap: onTodayButtonTap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    margin: EdgeInsets.only(right: 5.0),
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Text(
                      'today',
                      style: TextStyle(color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (headerStyle.leftChevronVisible)
                CustomIconButton(
                  icon: headerStyle.leftChevronIcon,
                  onTap: onLeftChevronTap,
                  margin: headerStyle.leftChevronMargin,
                  padding: headerStyle.leftChevronPadding,
                ),
              if (headerStyle.rightChevronVisible)
                CustomIconButton(
                  icon: headerStyle.rightChevronIcon,
                  onTap: onRightChevronTap,
                  margin: headerStyle.rightChevronMargin,
                  padding: headerStyle.rightChevronPadding,
                ),
            ],
          )
        ],
      ),
    );
  }
}
