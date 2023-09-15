import 'package:flutter/material.dart';

class TemporaryPlate extends StatefulWidget {
  TemporaryPlate({
    required this.width,
    this.num1,
    this.num2,
    this.letter,
    this.letters,
    this.num3,
    this.num4,
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
  String? num4;
  bool autofocus;
  bool enable;

  static const String id = 'گذر موقت جديد';

  @override
  State<TemporaryPlate> createState() => TemporaryPlateState();
}

class TemporaryPlateState extends State<TemporaryPlate> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late TextEditingController num3Controller;
  late TextEditingController num4Controller;

  late FocusNode num1FocusNode;
  late FocusNode num2FocusNode;
  late FocusNode num3FocusNode;
  late FocusNode num4FocusNode;

  late String letter;
  late List<String> letters;

  @override
  void initState() {
    super.initState();

    letter = widget.letter ?? 'گ';
    letters = widget.letters ?? ['گ'];

    num1Controller = TextEditingController();
    if (widget.num1 != null && widget.num1!.trim().length == 2) {
      num1Controller.text = widget.num1!.trim();
    }

    num2Controller = TextEditingController();
    if (widget.num2 != null && widget.num2!.trim().length == 3) {
      num2Controller.text = widget.num2!.trim();
    }

    num3Controller = TextEditingController();
    // todo: check num3 length
    if (widget.num3 != null && widget.num3!.trim().length == 2) {
      num3Controller.text = widget.num3!.trim();
    }

    num4Controller = TextEditingController();
    // todo: check num4 length
    if (widget.num4 != null && widget.num4!.trim().length == 5) {
      num4Controller.text = widget.num4!.trim();
    }

    num1FocusNode = FocusNode();
    num2FocusNode = FocusNode();
    num3FocusNode = FocusNode();
    num4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    num3Controller.dispose();
    num4Controller.dispose();

    num1FocusNode.dispose();
    num2FocusNode.dispose();
    num3FocusNode.dispose();
    num4FocusNode.dispose();

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

    num3Controller.addListener(() {
      if (num3Controller.text.trim().length == 2) {
        num4FocusNode.requestFocus();
      }
    });

    num4Controller.addListener(() {
      if (num4Controller.value.text.trim().length == 2 &&
          !num4Controller.text.contains('/')) {
        String value = '${num4Controller.text.trim()}/';
        num4Controller.value = TextEditingValue(
          text: value,
          selection: TextSelection.collapsed(offset: value.length),
        );
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
                          fontSize: widget.width * 0.048,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'I.R.\nIRAN',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: widget.width * 0.027,
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
                  return (letters.length > 1)
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
                                          fontSize: widget.width *
                                              0.05 /*isTablet ? 18 : 14*/,
                                          fontWeight: FontWeight.bold),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Center(
                      child: TextField(
                        controller: num3Controller,
                        focusNode: num3FocusNode,
                        enabled: widget.enable,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: widget.width * 0.05,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(1),
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
                    )),
                    Expanded(
                      child: Center(
                        child: TextField(
                          controller: num4Controller,
                          focusNode: num4FocusNode,
                          enabled: widget.enable,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          maxLength: 5,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.black,
                                  fontSize: widget.width * 0.05,
                                  fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(1),
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
                    ),
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
