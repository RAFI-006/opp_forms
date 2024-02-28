import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final ValueChanged<String?>? onChanged;
  final String label;

  const TextFieldWidget({super.key, this.onChanged, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '$label : ',
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(
            height: kToolbarHeight,
            width: MediaQuery.of(context).size.width * 0.4,
            child: TextFormField(
              onChanged: (value) {
                onChanged?.call(value);
              },
              decoration: InputDecoration(
                constraints: BoxConstraints.tight(
                    Size.fromWidth(MediaQuery.of(context).size.width * 0.4)),
                hintText: 'enter $label',
                hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                errorStyle:
                    const TextStyle(color: Colors.transparent, height: 0),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
