class PlaceModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final String address;
  final double rating;

  const PlaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.address,
    required this.rating,
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
    );
  }
}