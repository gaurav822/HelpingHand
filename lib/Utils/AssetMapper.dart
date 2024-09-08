class AssetMapper {
  final String serviceName;
  late String assetPath;

  AssetMapper(this.serviceName) {
    assetPath = _serviceToAsset(serviceName);
  }

  String _serviceToAsset(String service) {
    switch (service) {
      case 'TFN':
        return 'assets/tfn.jpg';
      case 'ABN':
        return 'assets/abn.jpg';
      case 'Bank Setup':
        return 'assets/bank.jpg';
      case 'Police Check':
        return 'assets/police.jpg';
      case 'Jobs':
        return 'assets/job.jpg';
      case 'Accomodation':
        return 'assets/accomodation.jpg';
      default:
        return 'assets/job.jpg'; // Default case for unexpected values
    }
  }
}
