import 'dart:ffi';

import 'package:empolyee_management/configs/resouces.dart';
import 'package:empolyee_management/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../models/button_model.dart';
import 'button.dart';

class Calendar extends StatefulWidget {
  Calendar(
      {super.key,
      required this.calendarType,
      required this.onSaveButtonTapped,
      required this.firstDay,
      this.defaultDate});
  CalendarType calendarType;
  Function onSaveButtonTapped;
  DateTime? firstDay;
  DateTime? defaultDate;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late PageController _pageController;

  DateTime focusedDate = DateTime.now();

  DateTime? selectedDate = DateTime.now();
  String activeOption = "";
  DateTime? firstDay;

  onOptionSelected() {
    try {
      setState(() {
        activeOption = "Today";
      });
    } catch (e) {
      Exception(e);
    }
  }

  onCancelButtonTapped() {
    try {
      Navigator.pop(context);
    } catch (e) {
      Exception(e);
    }
  }

  onTodayTapped() {
    try {
      if (widget.firstDay != null && widget.firstDay!.isAfter(DateTime.now())) {
        return;
      }
      setState(() {
        activeOption = "Today";
        selectedDate = DateTime.now();
      });
    } catch (e) {
      Exception(e);
    }
  }

  onNextMondayTapped() {
    try {
      setState(() {
        activeOption = "Next Monday";
        selectedDate =
            DateTime.now().add(const Duration(days: 1)).next(DateTime.monday);
      });
    } catch (e) {
      Exception(e);
    }
  }

  onNextTuesdayTapped() {
    try {
      setState(() {
        activeOption = "Next Tuesday";
        selectedDate =
            DateTime.now().add(const Duration(days: 1)).next(DateTime.tuesday);
      });
    } catch (e) {
      Exception(e);
    }
  }

  onNextWeekTapped() {
    try {
      setState(() {
        activeOption = "After 1 week";
        selectedDate = DateTime.now().add(Duration(days: 7));
      });
    } catch (e) {
      Exception(e);
    }
  }

  onNoDateTapped() {
    try {
      setState(() {
        activeOption = "No date";
        selectedDate = null;
      });
    } catch (e) {
      Exception(e);
    }
  }

  String setFromSelectValue(DateTime? selectedDate) {
    try {
      String relativeDate = "";

      if (selectedDate!.isSameDate(DateTime.now())) {
        relativeDate = "Today";
      }

      return relativeDate;
    } catch (e) {
      return "";
    }
  }

  String setToSelectValue(DateTime? selectedDate) {
    try {
      String relativeDate = "";
      if (selectedDate == null) {
        relativeDate = "No date";
      }
      if (selectedDate!.isSameDate(DateTime.now())) {
        relativeDate = "Today";
      }
      return relativeDate;
    } catch (e) {
      return "";
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      activeOption = widget.defaultDate != null
          ? widget.calendarType == CalendarType.from
              ? setFromSelectValue(widget.defaultDate)
              : setToSelectValue(widget.defaultDate)
          : widget.calendarType == CalendarType.from
              ? "Today"
              : "No date";
      selectedDate = widget.defaultDate ??
          (widget.calendarType == CalendarType.from ? DateTime.now() : null);
      focusedDate = widget.defaultDate ?? widget.firstDay ?? DateTime.now();
      firstDay = widget.firstDay ?? DateTime.utc(2000, 1, 1);
      focusedDate = widget.defaultDate ?? widget.firstDay ?? DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            width: double.infinity,
            child: widget.calendarType == CalendarType.from
                ? Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                                buttonProps: ButtonDataModel(
                                    buttonColor: AppColors.lightBlue,
                                    buttonTappedFunction: onTodayTapped,
                                    buttonType: ButtonType.textButton,
                                    textColor: AppColors.primaryColor,
                                    text: "Today",
                                    isActive: activeOption == "Today",
                                    icon: AppIcons.add)),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: ButtonWidget(
                                buttonProps: ButtonDataModel(
                                    buttonColor: AppColors.lightBlue,
                                    buttonTappedFunction: onNextMondayTapped,
                                    buttonType: ButtonType.textButton,
                                    textColor: AppColors.primaryColor,
                                    text: "Next Monday",
                                    isActive: activeOption == "Next Monday",
                                    icon: AppIcons.add)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                                buttonProps: ButtonDataModel(
                                    buttonColor: AppColors.lightBlue,
                                    buttonTappedFunction: onNextTuesdayTapped,
                                    buttonType: ButtonType.textButton,
                                    textColor: AppColors.primaryColor,
                                    text: "Next Tuesday",
                                    isActive: activeOption == "Next Tuesday",
                                    icon: AppIcons.add)),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: ButtonWidget(
                                buttonProps: ButtonDataModel(
                                    buttonColor: AppColors.lightBlue,
                                    buttonTappedFunction: onNextWeekTapped,
                                    buttonType: ButtonType.textButton,
                                    textColor: AppColors.primaryColor,
                                    text: "After 1 week",
                                    isActive: activeOption == "After 1 week",
                                    icon: AppIcons.add)),
                          )
                        ],
                      )
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                                buttonProps: ButtonDataModel(
                                    buttonColor: AppColors.lightBlue,
                                    buttonTappedFunction: onNoDateTapped,
                                    buttonType: ButtonType.textButton,
                                    textColor: AppColors.primaryColor,
                                    text: "No date",
                                    isActive: activeOption == "No date",
                                    icon: AppIcons.add)),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: ButtonWidget(
                                buttonProps: ButtonDataModel(
                                    buttonColor: AppColors.lightBlue,
                                    buttonTappedFunction: onTodayTapped,
                                    buttonType: ButtonType.textButton,
                                    textColor: AppColors.primaryColor,
                                    text: "Today",
                                    isActive: activeOption == "Today",
                                    icon: AppIcons.add)),
                          )
                        ],
                      ),
                    ],
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(microseconds: 100),
                      curve: Curves.bounceIn);
                },
                icon: SvgPicture.asset(
                  AppIcons.calendarLeftArrow,
                  height: 24,
                  width: 24,
                  color: widget.calendarType == CalendarType.to
                      ? firstDay!.month == focusedDate.month
                          ? AppColors.lightgray
                          : AppColors.gray
                      : AppColors.gray,
                )),
            Text(
              "${AppResources.months[focusedDate.month - 1]} ${focusedDate.year}",
              style: AppTextStyles.mediumRoboto18
                  .copyWith(color: AppColors.secondaryColor),
            ),
            IconButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(microseconds: 100),
                      curve: Curves.bounceIn);
                },
                icon: SvgPicture.asset(
                  AppIcons.calendarRightArrow,
                  height: 24,
                  width: 24,
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TableCalendar(
          rowHeight: 42,
          onCalendarCreated: (controller) => _pageController = controller,
          firstDay: firstDay ?? DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2050, 1, 1),
          headerVisible: false,
          focusedDay: focusedDate,
          onPageChanged: (focusedDay) => {
            setState(() {
              focusedDate = focusedDay;
            })
          },
          selectedDayPredicate: (day) {
            if (selectedDate != null) {
              return day.isSameDate(selectedDate!);
            }
            return false;
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (selectedDay.month == focusedDay.month) {
              setState(() {
                selectedDate = selectedDay;
              });
            }
          },
          daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: AppTextStyles.regularRoboto15
                  .copyWith(color: AppColors.secondaryColor),
              weekdayStyle: AppTextStyles.regularRoboto15
                  .copyWith(color: AppColors.secondaryColor)),
          calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) => Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    child: Text(day.day.toString(),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regularRoboto14.copyWith(
                          color: AppColors.primaryColor,
                        )),
                  ),
              disabledBuilder: (context, day, focusedDay) {
                if (day.month != focusedDay.month) {
                  return const SizedBox();
                }
                return Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  child: Text(
                    day.day.toString(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regularRoboto14
                        .copyWith(color: AppColors.extraLightgray),
                  ),
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                if (selectedDate != null &&
                    focusedDay.month != selectedDate!.month) {
                  return const SizedBox.shrink();
                }
                return Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  alignment: Alignment.center,
                  child: Text(day.day.toString(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regularRoboto14.copyWith(
                        color: AppColors.white,
                      )),
                );
              },
              defaultBuilder: (context, day, focusedDay) {
                return Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  child: Text(
                    day.day.toString(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regularRoboto14
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                );
              },
              outsideBuilder: (context, day, focusedDay) =>
                  const SizedBox.shrink()),
        ),
        const SizedBox(
          height: 58,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.extraLightgray))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.calender),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    selectedDate == null
                        ? "No date"
                        : DateFormat.d()
                            .add_MMM()
                            .add_y()
                            .format(selectedDate!)
                            .toString(),
                    textAlign: TextAlign.start,
                    style: AppTextStyles.regularRoboto15
                        .copyWith(color: AppColors.secondaryColor),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    child: ButtonWidget(
                        buttonProps: ButtonDataModel(
                            buttonColor: AppColors.lightBlue,
                            buttonTappedFunction: onCancelButtonTapped,
                            buttonType: ButtonType.textButton,
                            textColor: AppColors.primaryColor,
                            text: "Cancel",
                            icon: AppIcons.add)),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 75,
                    child: ButtonWidget(
                        buttonProps: ButtonDataModel(
                            buttonColor: AppColors.primaryColor,
                            buttonTappedFunction: () {
                              widget.onSaveButtonTapped(selectedDate);
                              Navigator.pop(context);
                            },
                            buttonType: ButtonType.textButton,
                            textColor: null,
                            text: "Save",
                            icon: AppIcons.add)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
