import 'package:flutter/material.dart';

class ProtocolPlate extends StatefulWidget {
  ProtocolPlate({
    required this.width,
    this.num,
    this.autofocus = false,
    this.enable = false,
    Key? key,
  }) : super(key: key);

  double width;
  String? num;
  bool autofocus;
  bool enable;

  static const String id = 'تشريفات';

  @override
  State<ProtocolPlate> createState() => ProtocolPlateState();
}

class ProtocolPlateState extends State<ProtocolPlate> {
  late TextEditingController numController;

  @override
  void initState() {
    super.initState();

    numController = TextEditingController();
    if (widget.num != null && widget.num!.trim().length == 4) {
      numController.text = widget.num!.trim();
    }
  }

  @override
  void dispose() {
    numController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: widget.width * 0.72,
        height: widget.width * 0.18,
        decoration: BoxDecoration(
          color: const Color(0xFFED2224),
          border: Border.all(
            width: 2,
            color: Colors.white,
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
                            fontSize: widget.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
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
              flex: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'تشریفات',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: widget.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'PROTOCOL',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: widget.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            Expanded(
              flex: 5,
              child: TextField(
                controller: numController,
                enabled: widget.enable,
                autofocus: widget.autofocus,
                keyboardType: TextInputType.number,
                maxLines: 1,
                minLines: 1,
                maxLength: 4,
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontSize: widget.width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
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
          ],
        ),
      ),
    );
  }
}
