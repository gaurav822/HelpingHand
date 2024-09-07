class ProgressMapper {
  final String progress;
  late double progressVal;

  ProgressMapper(this.progress) {
    progressVal = _progressStringtoDouble(progress);
  }

  double _progressStringtoDouble(String progress) {
    switch (progress) {
      case 'Pending':
        return 0.0;
      case 'In Progress':
        return 0.1;
      case 'Completed':
        return 1.0;
      default:
        return 0.0; // Default case for unexpected values
    }
  }
}
