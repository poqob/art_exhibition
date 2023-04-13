class Country {
  late final int countryId;
  late final String countryName;
  Country(this.countryId, this.countryName);

  Country.fromList(List country) {
    countryId = country[0];
    countryName = country[1];
  }
}
