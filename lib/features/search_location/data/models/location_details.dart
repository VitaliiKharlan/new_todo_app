class LocationDetailsModel {
  LocationDetailsModel({
    required this.description,
    required this.lat,
    required this.lng,
  });

  final String? description;
  final double? lat;
  final double? lng;

  factory LocationDetailsModel.fromJson(Map<String, dynamic> json) {
    return LocationDetailsModel(
      description: json['description'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'description': description, 'lat': lat, 'lng': lng};
  }

  @override
  String toString() {
    String formattedLat = lat != null ? lat!.toStringAsFixed(5) : 'null';
    String formattedLng = lng != null ? lng!.toStringAsFixed(5) : 'null';

    return '$description, \nlat: $formattedLat, lng: $formattedLng';

    //
    // stupid output of data
    //
    // return 'LocationDetailsModel {'
    //     'description: $description, '
    //     'lat: $lat, '
    //     'lng: $lng, '
    //     '}';
    //
  }
}
