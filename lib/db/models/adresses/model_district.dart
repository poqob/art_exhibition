class District {
  late final int districtId;
  late final int cityId;
  late final String districtName;
  District(this.districtId, this.cityId, this.districtName);

  District.fromList(List district) {
    districtId = district[0];
    cityId = district[1];
    districtName = district[2];
  }
}
