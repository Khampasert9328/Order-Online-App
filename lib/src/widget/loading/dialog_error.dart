import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String icons;
  final String titleBtn;
  final VoidCallback onPress;
  final Color color;

  const AlertDialogWidget(
      {Key? key,
      required this.title,
      required this.icons,
      required this.titleBtn,
      required this.onPress,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(shrinkWrap: true, children: [
          Column(
            children: [
              SvgPicture.asset(icons, width: 80, height: 80),
              const SizedBox(
                height: 10,
              ),
              // Some text
              Align(
                alignment: Alignment.center,
                child: Text(title, style: const TextStyle(fontSize: 16)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: color,
                  ),
                  onPressed: onPress,
                  child: Text(
                    titleBtn,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
