// This feature will be used in the next versions.
// the feature: user profile.
// user datas which is like total consumed time in app will be added. postgresql user-data table!
class User {
  late final int? userId;
  late final String? userName;
  late final String? userPassword;
  late final int? userCountryId;
  late final int? userCityId;
  late final int? userAvatarId;

  User(this.userId, this.userName, this.userPassword, this.userCountryId,
      this.userCityId, this.userAvatarId);
}
