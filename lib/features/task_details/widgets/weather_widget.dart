// import 'package:flutter/material.dart';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../../core/theme/app_colors.dart';
// import '../../../core/theme/app_images.dart';
// import '../../create_new_task/data/models/task_entity.dart';
//
// class WeatherWidget extends StatefulWidget {
//   const WeatherWidget({super.key, required this.task});
//
//   final Task task;
//
//   @override
//   State<WeatherWidget> createState() => _WeatherWidgetState();
// }
//
// class _WeatherWidgetState extends State<WeatherWidget> {
//   Widget _getWeatherIcon(int weatherIcon) {
//     const iconMap = {
//       1: AppImages.smallIconSun,
//       2: AppImages.smallIconPartlyCloudy,
//       3: AppImages.smallIconCloud,
//       4: AppImages.smallIconRain,
//       5: AppImages.smallIconSnow,
//       6: AppImages.smallIconSun,
//       7: AppImages.smallIconPartlyCloudy,
//       8: AppImages.smallIconCloud,
//       9: AppImages.smallIconRain,
//       10: AppImages.smallIconSnow,
//     };
//     if (iconMap.containsKey(weatherIcon)) {
//       return Image.asset(iconMap[weatherIcon]!);
//     } else {
//       return SizedBox(
//         height: 48,
//         width: 48,
//         child: Lottie.asset('assets/lottie_animation/hare.json'),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     if (widget.task.taskLocation == null) {
//       return const SizedBox.shrink();
//     }
//     return BlocProvider(
//       create: (context) {
//         final weatherBloc = WeatherBloc(getIt<WeatherRepository>());
//         weatherBloc.add(WeatherSelectEvent(widget.task.taskLocation!));
//         return weatherBloc;
//       },
//       child: BlocBuilder<WeatherBloc, WeatherState>(
//         builder: (context, state) {
//           if (state is WeatherLoadingState) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is WeatherSelectedFailureState) {
//             return Text(
//               'Error: ${state.exception}',
//               style: theme.textTheme.displaySmall,
//             );
//           } else if (state is WeatherSelectedState) {
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0x1F000000),
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 12,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Transform.scale(
//                           scale: 1.25,
//                           child: _getWeatherIcon(state.weatherCurrentIcon),
//                         ),
//                         SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               '${state.localizedName}, ${state.countryName}',
//                               style: theme.textTheme.titleSmall?.copyWith(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               state.weatherCurrentDescription.toString(),
//                               style: theme.textTheme.titleSmall?.copyWith(
//                                 fontSize: 12,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               DateFormat(
//                                 "HH:mm",
//                               ).format(state.weatherLocalObservationDateTime),
//                               style: theme.textTheme.titleSmall?.copyWith(
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 100),
//                         Text(
//                           '${state.weatherCurrentTemperature.toStringAsFixed(0)}\u00B0',
//                           style: theme.textTheme.titleSmall?.copyWith(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   _HourlyForecastWidget(),
//                   SizedBox(height: 16),
//                 ],
//               ),
//             );
//           } else {
//             return SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }
// }
//
// class _HourlyForecastWidget extends StatelessWidget {
//   const _HourlyForecastWidget();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: SizedBox(
//         height: 120,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           shrinkWrap: true,
//           itemCount: 24,
//           itemExtent: 60,
//           itemBuilder: (BuildContext context, int index) {
//             return _HourlyForecastItemWidget();
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class _HourlyForecastItemWidget extends StatelessWidget {
//   const _HourlyForecastItemWidget();
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: AppColors.description,
//           border: Border.all(color: Color(0x80000000)),
//           borderRadius: const BorderRadius.all(Radius.circular(20)),
//           boxShadow: [
//             BoxShadow(
//               color: Color(0x802196F3),
//               blurRadius: 8,
//               offset: const Offset(4, 2),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//           clipBehavior: Clip.hardEdge,
//           child: Column(
//             children: [
//               const SizedBox(height: 12),
//               const Image(image: AssetImage(AppImages.smallIconSun)),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const SizedBox(height: 4),
//                       RichText(
//                         softWrap: false,
//                         text: TextSpan(
//                           style: theme.textTheme.titleSmall,
//                           children: [
//                             TextSpan(
//                               text: '18 ',
//                               style: theme.textTheme.titleSmall?.copyWith(
//                                 fontSize: 12,
//                               ),
//                             ),
//                             TextSpan(
//                               text: '\u00B0C',
//                               style: theme.textTheme.titleSmall?.copyWith(
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         '09:00',
//                         style: theme.textTheme.titleSmall?.copyWith(
//                           fontSize: 12,
//                         ),
//                         maxLines: 1,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
