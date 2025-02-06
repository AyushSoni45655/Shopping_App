abstract class Failuress{
  final String error;
  Failuress({required this.error});
}
class ServerFailure extends Failuress{
  ServerFailure(String servermessge):super(error: servermessge);
}
class AuthFailure extends Failuress{
  AuthFailure(String authmessage):super(error: authmessage);
}