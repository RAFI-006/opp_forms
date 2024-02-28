import 'package:flutter/material.dart';

class ExpandableWidget extends StatelessWidget {
  final _isExpandable = ValueNotifier(false);

  final String? title;
  final String? description;
  final Widget? widget;
  final bool? isExpandable;

  ExpandableWidget({
    this.widget,
    this.title,
    this.description,
    this.isExpandable,
  }) {
    _isExpandable.value = isExpandable ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ValueListenableBuilder(
        valueListenable: _isExpandable,
        builder: (_, bool isExpandable, ___) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () => _isExpandable.value = !_isExpandable.value,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff655EB7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title ?? '',
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white)),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              isExpandable
                  ? Flexible(
                      child: AnimatedOpacity(
                          opacity: isExpandable ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          child: widget),
                    )
                  : const SizedBox.shrink()
            ],
          );
        },
      ),
    );
  }
}
