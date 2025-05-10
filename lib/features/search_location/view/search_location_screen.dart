import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/services/location_service.dart';
import '../../../core/services/logger_service.dart';
import '../bloc/search_location_bloc.dart';
import '../data/models/location_details.dart';
import '../data/repositories/place_details_repository.dart';

@RoutePage()
class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final placeDetailsRepository = PlaceDetailsRepository();
  TextEditingController controllerLocationSearch = TextEditingController();

  @override
  void dispose() {
    controllerLocationSearch.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    PermissionStatus status = await Permission.location.request();

    if (!mounted) return;

    if (status.isGranted) {
      final position = await LocationService.getCurrentLocation(
        context: context,
      );
      if (!mounted) return;

      if (position != null) {
        final model = LocationDetailsModel(
          description: 'My location',
          lat: position.latitude,
          lng: position.longitude,
        );
        context.router.maybePop<LocationDetailsModel>(model);
      }
    } else {
      logger.i("Permission denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider<LocationSearchBloc>(
      create: (context) => LocationSearchBloc(placeDetailsRepository),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
            appBar: AppBar(
              backgroundColor: Color(0xFFFFFFFF),
              iconTheme: IconThemeData(color: Color(0xFF000000)),
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 12),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Color(0x149E9E9E),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: Color(0xFF9E9E9E),
                            ),
                            onPressed: () {
                              context.router.maybePop();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'Search Location',
                          style: theme.appBarTheme.titleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(right: 20, top: 20, left: 20),
              child: Column(
                children: [
                  TextField(
                    controller: controllerLocationSearch,
                    style: theme.textTheme.headlineLarge,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 8,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x509E9E9E),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFF44336),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Search place',
                      hintStyle: theme.textTheme.headlineMedium,
                    ),
                    onTap: () {},
                    onChanged: (value) {
                      context.read<LocationSearchBloc>().add(
                        LocationSearchTextChangeEvent(value),
                      );
                    },
                  ),
                  Expanded(
                    child: BlocBuilder<LocationSearchBloc, LocationSearchState>(
                      builder: (context, state) {
                        if (state is LocationSearchLoadingState) {
                          return Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (state is LocationSearchLoadedState) {
                          final suggestions = state.suggestions;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: suggestions.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  final selectedLocation = suggestions[index];

                                  context.read<LocationSearchBloc>().add(
                                    LocationSelectEvent(selectedLocation),
                                  );
                                  context.router.maybePop<LocationDetailsModel>(
                                    suggestions[index],
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    suggestions[index].description ??
                                        'no description',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state is LocationSearchFailureState) {
                          return Center(
                            child: Text(
                              state.exception.toString(),
                              style: theme.textTheme.displaySmall,
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                  Visibility(
                    visible:
                        controllerLocationSearch.text.isEmpty ? true : false,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: ElevatedButton(
                        onPressed: _getCurrentLocation,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.my_location, color: Color(0xFF4CAF50)),
                            SizedBox(width: 12),
                            Text(
                              'My Location',
                              style: theme.textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
