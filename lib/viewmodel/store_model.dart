import 'package:flutter/foundation.dart';
import 'package:mask/model/store.dart';
import 'package:mask/repository/location_repository.dart';
import 'package:mask/repository/store_repository.dart';

class StoreModel with ChangeNotifier {
  var isLoading = false;
  List<Store> stores = [];

  final _storeRepository = StoreRepository();
  final _locationRepository = LocationRepository();

  StoreModel() {
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners();

    // var position = await _locationRepository.getCurrentLocation();
    var latitude = 37.572806;
    var longitude = 126.976496;

    //

    stores = await _storeRepository.fetch(
      latitude,
      longitude,
    );
    isLoading = false;
    notifyListeners();
  }
}
