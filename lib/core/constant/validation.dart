class AValidator{
  static String? validateEmptyText(String? fieldName,String ?value){
    if(value == null || value.isEmpty){
      return '$fieldName is required';
    }
    return null;
  }
  static String? validateEmail(String? value){
    if(value== null ||value.isEmpty){
      return 'Email is empty';
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(!emailRegExp.hasMatch(value)){
      return 'Invalid email address';
    }
    return null;
  }
  static String? validatePassword(String? value){
    if(value == null || value.isEmpty){
      return 'password is required';
    }
    if(value.length < 6){
      return 'password must be greater then 6 digit';
    }
    //  if(value.contains(RegExp(r'[A-Z]'))){
    //   return 'Password must contain one upper case letter';
    // }
    // if(value.contains(RegExp(r'[0-9]'))){
    //   return 'Password must contain atleast one number';
    // }
    return null;
  }
  static String? validatePhoneNumber(String? value){
    if( value == null || value.isEmpty){
      return 'Enter phone number';
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if(!phoneRegExp.hasMatch(value)){
      return 'Invalid phone number format( 10 digit required)';
    }
    return null;
  }
}