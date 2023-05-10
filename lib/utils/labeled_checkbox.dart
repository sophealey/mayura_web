import 'package:flutter/material.dart';
import 'package:mayura_web/utils/color_manager.dart';


class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
        child: Row(
          children: <Widget>[

            Checkbox(
              value: value,
              activeColor: ColorManager.getPurpleLightPurple(),
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(height: 1.1),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
