import 'package:e_commarce_rest_api/auth/feature/domain/entity/user_entity.dart';

class UserModal extends UserEntity {
  UserModal(
      {required String id,
      required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required String dateOfBirth})
      : super(
            name: name,
            id: id,
            phoneNumber: phoneNumber,
            email: email,
            password: password,
            dateOfBirth: dateOfBirth);
  Map<String,dynamic>toMap(){
    return{
      "Id":id,
      "Name":name,
      "Email":email,
      "Password":password,
      "PhoneNumber":phoneNumber,
      "DateOfBirth":dateOfBirth
    };
  }
  factory UserModal.fromJson(Map<String,dynamic>tojson,String id){
    return UserModal(
        id: id,
        name: tojson['Name']??'No Name',
        email: tojson['Email']??'No Email',
        password: tojson['Password']??'No Password',
        phoneNumber: tojson['PhoneNumber']??'PhoneNumber',
        dateOfBirth: tojson['DateOfBirth']??'DateOfBirth'
    );
  }
}
