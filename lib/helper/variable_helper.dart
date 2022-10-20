mixin VariableHelper {
  String? _cityName = "izmir";
  String? _picture;
  String? _weatherstate;
  String? _lastUpdate;
  double? _maxTemp;
  double? _minTemp;

  String? get cityName => _cityName;
  String? get picture => _picture;
  String? get weatherstate => _weatherstate;
  String? get lastUpdate => _lastUpdate;
  double? get maxTemp => _maxTemp;
  double? get minTemp => _minTemp;

  set cityNameSet(String cityName) {
    _cityName = cityName;
  }

  set pictureSet(String picture) {
    _picture = picture;
  }

  set weatherstateSet(String weatherstate) {
    _weatherstate = weatherstate;
  }

  set lastUpdateSet(String lastUpdate) {
    _lastUpdate = lastUpdate;
  }

  set maxTempSet(double maxTemp) {
    _maxTemp = maxTemp;
  }

  set minTempSet(double minTemp) {
    _minTemp = minTemp;
  }
}
