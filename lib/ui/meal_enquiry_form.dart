import 'package:demo_app/modal/onbordingmodal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MealEnquiryForm extends StatefulWidget {
  const MealEnquiryForm({Key? key}) : super(key: key);

  @override
  _MealEnquiryFormState createState() => _MealEnquiryFormState();
}

class _MealEnquiryFormState extends State<MealEnquiryForm> {
  String _firstMeal = "Breakfast";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 8.0,
            titleSpacing: -5,
            pinned: true,
            leading:
                Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
            title: Text(
              "Food Meal Enquiry",
              style: TextStyle(color: Colors.black),
            ),
          ),
          SliverPersistentHeader(
            delegate: _EnquiryBackGround(),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)]),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                children: [
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text("First Day Meal".toUpperCase()),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                          child: Radio<String>(
                              value: "Breakfast",
                              groupValue: _firstMeal,
                              onChanged: (value) {
                                setState(() {
                                  _firstMeal = value!;
                                });
                              })),
                      SizedBox(width: 10),
                      Expanded(
                          child: Radio<String>(
                              value: "Lunch",
                              groupValue: _firstMeal,
                              onChanged: (value) {
                                setState(() {
                                  _firstMeal = value!;
                                });
                              })),
                      SizedBox(width: 10),
                      Expanded(
                          child: Radio<String>(
                              value: "Dinner",
                              visualDensity:
                                  VisualDensity(horizontal: 2.0, vertical: 1.0),
                              groupValue: _firstMeal,
                              onChanged: (value) {
                                setState(() {
                                  _firstMeal = value!;
                                });
                              })),
                    ],
                  ),
                  SizedBox(height: 15),
                  RadioButton<String>(
                    value: "Dinner",
                    groupValue: _firstMeal,
                    onChange: (value) {
                      setState(() {
                        _firstMeal = value;
                      });
                    },
                  ),
                  SizedBox(height: 45),
                  Row(
                    children: [
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: MealTextField(
                          hintText: "Select Data",
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioButton<T extends Object> extends StatelessWidget {
  const RadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChange,
    this.size = 25,
  }) : super(key: key);

  final T value;
  final T groupValue;
  final Function(T) onChange;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RawMaterialButton(
          shape: StadiumBorder(),
          splashColor: Colors.indigo.withAlpha(1),
          constraints: BoxConstraints(maxHeight: size, maxWidth: size),
          onPressed: () => onChange.call(value),
          child: SizedBox(
            width: size,
            height: size,
            child: AnimatedContainer(
              padding: EdgeInsets.all(value == groupValue ? 3 : 30),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: value == groupValue ? Colors.indigo : Colors.grey,
                      width: 1.5),
                  shape: BoxShape.circle),
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.indigo),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MealTextField extends StatelessWidget {
  const MealTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1.5)),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Select date",
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            suffixIcon: Icon(Icons.calendar_today_outlined)),
      ),
    );
  }
}

class _EnquiryBackGround extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset('images/cover.jpeg',
            width: double.infinity, height: 300, fit: BoxFit.cover),
        Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.amber,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            // alignment: Alignment.bottomCenter,
            // margin: const EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
        Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)],
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text('START DATE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black))),
                SizedBox(width: 15),
                Expanded(
                    child: Text('END DATE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 300.0;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
