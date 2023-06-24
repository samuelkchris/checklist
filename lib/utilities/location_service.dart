import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService extends ChangeNotifier {
  String _userLocation = 'INDIA';

  Future<Position> getCurrentPosition() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print(e);
      return Position(latitude: 19.109906, longitude: 72.867671, accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0, timestamp: DateTime.now(), floor: 0);
    }
  }

  Future<String> getLocation() async {
    try {
      Position position = await getCurrentPosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark first = placemarks.first;

        String locality = first.locality ?? '';
        String subLocality = first.subLocality ?? '';

        _userLocation = '$subLocality, $locality.';
        _userLocation = _userLocation.toString();
      }

      notifyListeners();
      return _userLocation;
    } catch (e) {
      print('$e: occurred in LocationService.dart');
      notifyListeners();
      return _userLocation;
    }
  }

  Future<double> getLat() async {
    try {
      Position position = await getCurrentPosition();
      return position.latitude;
    } catch (e) {
      print(e);
      return 19.109906;
    }
  }
}
