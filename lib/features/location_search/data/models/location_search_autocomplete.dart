class LocationSearchAutocompleteModel {
  LocationSearchAutocompleteModel({
    required this.description,
    required this.placeId,
  });

  final String description;
  final String placeId;

  factory LocationSearchAutocompleteModel.fromJson(Map<String, dynamic> json) {
    return LocationSearchAutocompleteModel(
      description: json['description'] as String? ?? '',
      placeId: json['place_id'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'description': description, 'place_id': placeId};
  }

  @override
  String toString() {
    return 'LocationSearchAutocompleteModel{'
        'name: $description, '
        'lat: $placeId, '
        '}';
  }
}
