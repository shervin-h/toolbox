import 'package:flutter/material.dart';

/// ## [PersonalPlate] Documentation:
///
/// A widget for displaying a customizable Iranian personal license plate.
///
/// The [PersonalPlate] widget is used to display a personal license plate with fields for entering numbers, letters,
/// and an optional third number. It allows customization of the license plate's appearance, including the initial
/// numbers, letters, and more.
///
/// Example usage:
/// ```dart
/// PersonalPlate(
///   width: 300,
///   num1: '12',
///   letter: 'ب',
///   num2: '345',
///   num3: '67',
///   enable: true,
/// )
/// ```
///
/// This widget is often used in applications that require users to input personal license plate numbers, such as vehicle
/// registration systems.
///
class PersonalPlate extends StatefulWidget {
  /// Creates a [PersonalPlate] widget with customizable parameters.
  ///
  /// The [width] parameter sets the overall width of the license plate widget.
  ///
  /// The [num1], [num2], and [num3] parameters represent the initial numbers on the license plate.
  ///
  /// The [letter] parameter represents the initial letter on the license plate.
  ///
  /// The [letters] parameter is a list of available letters for selection in the license plate.
  ///
  /// The [autofocus] parameter determines whether the first
  ///
  /// The [enable] parameter determines whether the input fields are enabled for user interaction.
  ///
  PersonalPlate({
    required this.width,
    this.num1,
    this.num2,
    this.letter,
    this.letters,
    this.num3,
    this.autofocus = false,
    this.enable = false,
    Key? key,
  }) : super(key: key);

  double width;
  String? num1;
  String? num2;
  String? letter;
  List<String>? letters;
  String? num3;
  bool autofocus;
  bool enable;

  static const String id = 'شخصي';

  @override
  State<PersonalPlate> createState() => PersonalPlateState();
}

class PersonalPlateState extends State<PersonalPlate> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late TextEditingController num3Controller;

  late FocusNode num1FocusNode;
  late FocusNode num2FocusNode;
  late FocusNode num3FocusNode;

  late String letter;
  late List<String> letters;

  @override
  void initState() {
    super.initState();

    letter = widget.letter ?? 'ب';
    letters = widget.letters ??
        [
          'ب',
          'ج',
          'د',
          'س',
          'ص',
          'ط',
          'ق',
          'ل',
          'م',
          'ن',
          'و',
          'ه',
          'ي',
        ];

    num1Controller = TextEditingController();
    if (widget.num1 != null && widget.num1!.trim().length == 2) {
      num1Controller.text = widget.num1!.trim();
    }

    num2Controller = TextEditingController();
    if (widget.num2 != null && widget.num2!.trim().length == 3) {
      num2Controller.text = widget.num2!.trim();
    }

    num3Controller = TextEditingController();
    if (widget.num3 != null && widget.num3!.trim().length == 2) {
      num3Controller.text = widget.num3!.trim();
    }

    num1FocusNode = FocusNode();
    num2FocusNode = FocusNode();
    num3FocusNode = FocusNode();
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    num3Controller.dispose();

    num1FocusNode.dispose();
    num2FocusNode.dispose();
    num3FocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide > 600;

    num1Controller.addListener(() {
      if (num1Controller.text.trim().length == 2) {
        num2FocusNode.requestFocus();
      }
    });

    num2Controller.addListener(() {
      if (num2Controller.text.trim().length == 3) {
        num3FocusNode.requestFocus();
      }
    });

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: widget.width * 0.72,
        height: widget.width * 0.18,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E3399),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '🇮🇷',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: widget.width * 0.038,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'I.R.\nIRAN',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: widget.width * 0.028,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                controller: num1Controller,
                focusNode: num1FocusNode,
                autofocus: widget.autofocus,
                enabled: widget.enable,
                keyboardType: TextInputType.number,
                maxLines: 1,
                maxLength: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: widget.width * 0.08,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(1),
                  filled: true,
                  fillColor: Colors.transparent,
                  counterText: '',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  disabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: PopupMenuButton(
                enabled: widget.enable,
                iconSize: widget.width * 0.2 * 0.6,
                icon: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    letter,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontSize: widget.width * 0.07,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                initialValue: letter,
                onSelected: (value) {
                  setState(() {
                    letter = value.toString();
                  });
                },
                itemBuilder: (context) {
                  return (letters.isNotEmpty)
                      ? letters
                          .map(
                            (String char) => PopupMenuItem(
                              value: char,
                              child: Center(
                                child: Text(
                                  char,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: widget.width * 0.05,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          )
                          .toList()
                      : <PopupMenuItem>[];
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: TextField(
                controller: num2Controller,
                focusNode: num2FocusNode,
                enabled: widget.enable,
                keyboardType: TextInputType.number,
                maxLines: 1,
                textAlign: TextAlign.center,
                maxLength: 3,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: widget.width * 0.08,
                    fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(1),
                  filled: true,
                  fillColor: Colors.transparent,
                  counterText: '',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  disabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    border: Border(left: BorderSide(width: 2))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: isTablet ? 2 : 1),
                      child: Image.asset(
                        'assets/images/iran1.png',
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 2),
                      child: TextField(
                        controller: num3Controller,
                        focusNode: num3FocusNode,
                        enabled: widget.enable,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 2,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Colors.black,
                                  fontSize: widget.width * 0.08,
                                  fontWeight: FontWeight.bold,
                                ),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          counterText: '',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          disabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    // const SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
