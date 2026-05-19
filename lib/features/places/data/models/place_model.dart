class PlaceModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final String address;
  final double rating;
  final double latitude;
  final double longitude;

  const PlaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.address,
    required this.rating,
    required this.latitude,
    required this.longitude,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      address: json['address'],
      rating: (json['rating'] as num).toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
