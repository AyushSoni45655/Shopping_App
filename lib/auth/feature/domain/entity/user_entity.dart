class UserEntity {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String dateOfBirth;
  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.dateOfBirth});
}
