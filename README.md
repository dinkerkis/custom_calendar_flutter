# custom_calendar_table

A new Flutter project.

## Getting Started

## 1.  Add in pubspec.yaml file under
 
 dependencies:
``` 
 custom_calendar_table:  
   git:  
     url: https://github.com/dinkerkis/custom_calendar_flutter.git
``` 
 
## 2. Add package

``` 
import 'package:custom_calendar_table/custom_calendar_table.dart';
import 'package:custom_calendar_table_example/utils.dart';

``` 


## 3.  Use in the code like this: 

``` 
CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),

```

## Calender Table Screen Shot

![tableCalendar](https://user-images.githubusercontent.com/82141553/138445226-da472a74-cb2a-4985-910b-dfb3efd4bba2.png)
