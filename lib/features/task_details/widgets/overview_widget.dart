import 'package:flutter/material.dart';

import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';

import '../../create_new_task/data/models/task_dto.dart';

class OverviewWidget extends StatefulWidget {
  const OverviewWidget({super.key, required this.task});

  final TaskDto task;

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  bool _isExpanded = false;
  static const int _maxLines = 3;

  String _getTrimmedText({
    required String text,
    required TextStyle style,
    required double maxWidth,
    required int maxLines,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    if (!textPainter.didExceedMaxLines) return text;

    String trimmedText = text;
    while (textPainter.didExceedMaxLines && trimmedText.isNotEmpty) {
      trimmedText = trimmedText.substring(0, trimmedText.length - 1);
      textPainter.text = TextSpan(text: trimmedText, style: style);
      textPainter.layout(maxWidth: maxWidth);
    }

    return trimmedText.trimRight();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final description = widget.task.taskDescription?.trim() ?? '';

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview', style: theme.textTheme.titleLarge),
            SizedBox(height: 8),
            if (description.isNotEmpty)
              LayoutBuilder(
                builder: (context, constraints) {
                  final textStyle =
                      theme.textTheme.bodySmall ?? const TextStyle();

                  final textPainter = TextPainter(
                    text: TextSpan(text: description, style: textStyle),
                    maxLines: _maxLines,
                    textDirection: ui.TextDirection.ltr,
                  )..layout(maxWidth: constraints.maxWidth);

                  final bool isOverflowing = textPainter.didExceedMaxLines;
                  String displayText = description;

                  if (!_isExpanded && isOverflowing) {
                    // displayText = 'something new';
                    displayText = _getTrimmedText(
                      text: description,
                      style: textStyle,
                      maxWidth: constraints.maxWidth,
                      maxLines: _maxLines,
                    );
                    displayText += ' ...';
                  }

                  return RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(text: displayText, style: textStyle),
                        if (isOverflowing)
                          TextSpan(
                            text: _isExpanded ? ' Read Less' : ' Read More',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      _isExpanded = !_isExpanded;
                                    });
                                  },
                          ),
                      ],
                    ),
                  );
                },
              )
            else
              Text('no description yet', style: theme.textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
