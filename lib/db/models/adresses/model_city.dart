class City {
  late final int cityId;
  late final int countryId;
  late final String cityName;
  City(this.cityId, this.cityName, this.countryId);

  City.fromList(List city) {
    cityId = city[0];
    countryId = city[1];
    cityName = city[2];
  }
}
