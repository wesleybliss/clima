class Location {
  final double latitude;
  final double longitude;
  final String? name;              // Derived from timezone (e.g., "New York")

  Location({
    required this.latitude,
    required this.longitude,
    this.name,
  });
}
