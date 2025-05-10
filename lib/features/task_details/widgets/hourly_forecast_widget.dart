import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_images.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 24,
          itemExtent: 60,
          itemBuilder: (BuildContext context, int index) {
            return _HourlyForecastItemWidget();
          },
        ),
      ),
    );
  }
}

class _HourlyForecastItemWidget extends StatelessWidget {
  const _HourlyForecastItemWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.description,
          border: Border.all(color: Color(0x80000000)),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color(0x802196F3),
              blurRadius: 8,
              offset: const Offset(4, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Image(image: AssetImage(AppImages.smallIconSun)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 4),
                      RichText(
                        softWrap: false,
                        text: TextSpan(
                          style: theme.textTheme.titleSmall,
                          children: [
                            TextSpan(
                              text: '18 ',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: '\u00B0C',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '09:00',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
