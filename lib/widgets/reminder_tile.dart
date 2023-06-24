import 'package:checklist/utilities/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderTile extends StatefulWidget {
  final bool isLocationBased;

  final String title;
  final String description;
  final String date;
  final String time;
  final userLocation;
  final bool isChecked;
  final void Function(bool) checkBoxCallBack;
  final Function deleteCallBack;

  ReminderTile({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.userLocation,
    required this.isLocationBased,
    required this.isChecked,
    required this.checkBoxCallBack,
    required this.deleteCallBack,
  });

  @override
  _ReminderTileState createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> {
  final _random = new Random();
  Color? _color;

  void getColor() {
    setState(() {
      _color = colorsList[_random.nextInt(colorsList.length)];
    });
  }

  @override
  void initState() {
    getColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(432.0, 816.0));

    return Padding(
      padding: EdgeInsets.only(top: 10.0.h),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 110.0.h,
            padding: EdgeInsets.only(
              top: 20.0.h,
              left: 20.0.w,
            ),
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Slidable(
              enabled: true,
              closeOnScroll: true,
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: (context) {
                      widget.deleteCallBack();
                    },
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {

                    },
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
              endActionPane: null, // Set the endActionPane as per your requirement
              direction: Axis.horizontal,
              dragStartBehavior: DragStartBehavior.down,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 110.0.h,
                padding: EdgeInsets.only(
                  top: 20.0.h,
                  left: 20.0.w,
                ),
                decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  border: Border.all(color: Colors.grey[200]!, width: 2.0.w),
                  borderRadius: BorderRadius.all(Radius.circular(20.0.h)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: widget.isChecked
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                        Container(
                          width: 50.0.w,
                          height: 5.0.h,
                          decoration: BoxDecoration(
                            color: _color,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0.h),
                              bottomLeft: Radius.circular(10.0.h),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Text(
                        widget.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 14.0.sp,
                          fontFamily: 'WorkSans',
                          color: Colors.grey[450],
                        ),
                      ),
                    ),
                    widget.isLocationBased
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: _color,
                              size: 15.0.h,
                            ),
                            Text(
                              widget.userLocation,
                              style: TextStyle(
                                fontSize: 13.0.sp,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w600,
                                color: _color,
                              ),
                            ),
                          ],
                        ),
                        Transform.scale(
                          scale: 0.7,
                          child: MSHCheckbox(
                            value: widget.isChecked,
                            checkedColor: Colors.grey[350],
                            uncheckedColor: Colors.grey,
                            isDisabled: false,
                            size: 18,
                            onChanged: widget.checkBoxCallBack,
                          ),
                        ),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.alarm,
                              color: _color,
                              size: 15.0.h,
                            ),
                            Text(
                              ' ${widget.date}, ${widget.time}',
                              style: TextStyle(
                                fontSize: 13.0.sp,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w600,
                                color: _color,
                              ),
                            ),
                          ],
                        ),
                        Transform.scale(
                          scale: 0.7,
                          child: MSHCheckbox(
                            value: widget.isChecked,
                            checkedColor: Colors.grey[350],
                            uncheckedColor: Colors.grey,
                            isDisabled: false,
                            size: 18,
                            onChanged: widget.checkBoxCallBack,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }
}
