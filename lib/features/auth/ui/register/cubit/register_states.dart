import 'package:new_e_commerce_app/features/common/utils/resource.dart';

class RegisterStates {
  late Resource<void>registerState;
  RegisterStates({required this.registerState});
  RegisterStates.initial(){
    registerState=Resource.initial();
  }
}
