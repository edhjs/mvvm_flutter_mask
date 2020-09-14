import 'dart:async';

import 'package:mask/model/store.dart';
import 'package:mask/repository/location_repository.dart';
import 'package:mask/repository/store_repository.dart';

class StoreModel {
  List<Store> stores = [];
  StreamController<List<Store>> storeModelStream =
      new StreamController<List<Store>>();
  StreamController<bool> isLoadingStream = new StreamController<bool>();
  StoreModel storeModel;
  final _storeRepository = StoreRepository();
  final _locationRepository = LocationRepository();

  StoreModel() {
    fetch();
  }

  Future fetch() async {
    isLoadingStream.add(true);
    // var position = await _locationRepository.getCurrentLocation();
    var latitude = 37.572806;
    var longitude = 126.976496;
    stores = await _storeRepository.fetch(
      latitude,
      longitude,
    );
    storeModelStream.add(stores);
    isLoadingStream.add(false);
    //notifyListeners();
  }
}
