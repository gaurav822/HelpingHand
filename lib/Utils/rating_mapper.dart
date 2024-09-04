class RatingMapper {
  final double rating;
  late String assetPath;

  RatingMapper(this.rating) {
    assetPath = _mapRatingToAsset(rating);
  }

  String _mapRatingToAsset(double rating) {
    switch (rating) {
      case 1.0:
        return 'assets/rating_1.png';
      case 1.5:
        return 'assets/rating_1_5.png';
      case 2.0:
        return 'assets/rating_2.png';
      case 2.5:
        return 'assets/rating_2_5.png';
      case 3.0:
        return 'assets/rating_3.png';
      case 3.5:
        return 'assets/rating_3_5.png';
      case 4.0:
        return 'assets/rating_4.png';
      case 4.5:
        return 'assets/rating_4_5.png';
      case 5.0:
        return 'assets/rating_5.png';
      default:
        return 'assets/rating_default.png'; // Default case for unexpected values
    }
  }
}
