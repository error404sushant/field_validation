import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomeBloc{
  //region Common variable
  late BuildContext context;
  var maskFormatter =  MaskTextInputFormatter(mask: '####-####', filter: { "#": RegExp(r'[0-9]') });

  //endregion

  final GlobalKey<FormState> userFormKey = GlobalKey<FormState>();
//region Text Editing Controller
  final userNameTextCtrl = TextEditingController();
  final phoneNumberTextCtrl = TextEditingController();
  final emailTextCtrl = TextEditingController();
  final urlTextCtrl = TextEditingController();
  final referralTextCtrl = TextEditingController();
//endregion

//region Controller
//endregion
  //region Constructor
  HomeBloc({required context});
  //endregion
//region Init
void init(){

}
//endregion
}