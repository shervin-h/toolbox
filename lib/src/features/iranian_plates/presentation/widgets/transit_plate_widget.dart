import 'package:flutter/material.dart';

class TransitPlate extends StatefulWidget {
  TransitPlate({
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

  static const String id = 'ترانزيت';

  @override
  State<TransitPlate> createState() => TransitPlateState();
}

class TransitPlateState extends State<TransitPlate> {
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

    letter = widget.letter ?? 'A';
    letters = widget.letters ??
        [
          'A',
          'B',
          'C',
          'D',
          'E',
          'F',
          'G',
          'H',
          'I',
          'J',
          'K',
          'L',
          'M',
          'N',
          'O',
          'P',
          'Q',
          'R',
          'S',
          'T',
          'U',
          'V',
          'W',
          'X',
          'Y',
          'Z',
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

    num1Controller.addListener(() {
      if (num1Controller.text.length == 2) {
        num2FocusNode.requestFocus();
      }
    });

    num2Controller.addListener(() {
      if (num2Controller.text.length == 3) {
        num3FocusNode.requestFocus();
      }
    });
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
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF294197),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/plate_transit_side.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                        ),
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
                      cursorColor: Colors.black,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontSize: widget.width * 0.07,
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
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFEC3225),
                          ),
                        ),
                        PopupMenuButton(
                          enabled: widget.enable,
                          iconSize: widget.width * 0.2 * 0.5,
                          icon: Text(
                            letter,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color: Colors.black,
                                  fontSize: widget.width * 0.07,
                                  fontWeight: FontWeight.bold,
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
                        )
                      ],
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
                      cursorColor: Colors.black,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontSize: widget.width * 0.07,
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
                          border: Border(
                              left: BorderSide(color: Colors.black, width: 2))),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: isTablet ? 2 : 1),
                              child: Image.asset(
                                'assets/images/iran1.png',
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              alignment: Alignment.center,
                              child: TextField(
                                controller: num3Controller,
                                focusNode: num3FocusNode,
                                enabled: widget.enable,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                maxLength: 2,
                                textAlign: TextAlign.center,
                                cursorColor: Colors.black,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: widget.width * 0.07,
                                        fontWeight: FontWeight.bold),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  counterText: '',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            const SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFF294197),
                ),
                child: Text(
                  'Touring & Automobile Club of The Islamic Republic of IRAN',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: widget.width * 0.03,
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
