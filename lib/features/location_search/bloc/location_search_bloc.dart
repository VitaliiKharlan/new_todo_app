import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/location_details.dart';
import '../data/repositories/place_details_repository.dart';



part 'location_search_event.dart';

part 'location_search_state.dart';

class LocationSearchBloc
    extends Bloc<LocationSearchEvent, LocationSearchState> {
  final PlaceDetailsRepository _placeDetailsRepository;

  LocationSearchBloc(
      this._placeDetailsRepository,
      ) : super(LocationSearchInitialState()) {
    on<LocationSearchTextChangeEvent>(_onTextChange);
    on<LocationSelectEvent>(_onLocationSelect);
  }

  Future<void> _onTextChange(LocationSearchTextChangeEvent event,
      Emitter<LocationSearchState> emit) async {
    debugPrint('Location Search Text Change Event');
    if (event.query.isEmpty) {
      emit(LocationSearchInitialState());
      return;
    }

    emit(LocationSearchLoadingState());

    try {
      final suggestions =
      await _placeDetailsRepository.getPlaceDetails(event.query);

      emit(LocationSearchLoadedState(suggestions));
    } catch (e, s) {
      debugPrint('Error: $e');
      debugPrintStack(stackTrace: s);

      emit(LocationSearchFailureState(e.toString()));
    }
  }
}

Future<void> _onLocationSelect(
    LocationSelectEvent event, Emitter<LocationSearchState> emit) async {
  // debugPrint('Location Select Event');
  // emit(LocationSearchLoadingState());
  //
  // // try {
  // //   final localizedNameForWeatherData =
  // //       await geoPositionSearchForWeatherRepository.fetchLocalizedName(
  // //     lat: event.locationDetailsModel.lat ?? 0.0,
  // //     lng: event.locationDetailsModel.lng ?? 0.0,
  // //   );
  // //
  // //   debugPrint(
  // //       'This Is Success: ${localizedNameForWeatherData.localizedName}');
  //   emit(LocationSelectedState(localizedNameForWeatherData.localizedName));
  // } catch (e, s) {
  //   debugPrint('Error: $e');
  //   debugPrintStack(stackTrace: s);
  //   emit(LocationSearchFailureState(e.toString()));
  // }
  debugPrint('Location Select Event');
}

