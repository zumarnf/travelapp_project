// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecommendedPlaceModel {
  final String image;
  final double rating;
  final String location;
  RecommendedPlaceModel({
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    image: "assets/img/place5.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
    RecommendedPlaceModel(
    image: "assets/img/place4.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/img/place3.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/img/place2.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/img/place1.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
];