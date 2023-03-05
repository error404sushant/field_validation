import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_bloc.dart';

//region Home Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//endregion

class _HomeScreenState extends State<HomeScreen> {
  //region Build
  late HomeBloc homeBloc;
  //endregion
  //region Init
  @override
  void initState() {
    homeBloc = HomeBloc(context: context);
    super.initState();
  }
  //endregion
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body()),
    );
  }


  //region Body
Widget body(){
    return Form(
      key: homeBloc.userFormKey,
      child:Column(

        children: [
          ///Name
          TextFormField(
            controller: homeBloc.userNameTextCtrl,
            decoration: const InputDecoration(
              hintText: "User name ",
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Can't be empty.";
              }
              return null;
            },
          ),
          ///Phone number
          TextFormField(
            controller: homeBloc.phoneNumberTextCtrl,
            decoration: const InputDecoration(
              hintText: "Phone number ",
            ),
            keyboardType: TextInputType.number,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Can't be empty.";
              }
              return null;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9\.]')),
              LengthLimitingTextInputFormatter(10),
            ],
          ),
          ///Email
          TextFormField(
            controller: homeBloc.emailTextCtrl,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
            onChanged: (value){
              homeBloc.emailTextCtrl.text = homeBloc.emailTextCtrl.text.replaceAll(" ", "");
              homeBloc.emailTextCtrl.selection =
                  TextSelection.collapsed(offset: homeBloc.emailTextCtrl.text.length);
            },

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+"
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;

            },
            inputFormatters:[
              ],
          ),
          ///Website
          TextFormField(
            controller: homeBloc.urlTextCtrl,
            decoration: const InputDecoration(
              hintText: "Website",
            ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Can't be empty.";
                }
                // Add a regex to check if the value is a valid website
                if (!RegExp(r"^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$").hasMatch(value))
                {
                  return 'Please enter a valid website';
                }
                return null;
              },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9./:?#-]")),],
          ),
          ///Referral code
          TextFormField(
            controller: homeBloc.referralTextCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Referral",
            ),
            validator: (String? value) {

            },
            inputFormatters:[
              homeBloc.maskFormatter,
            // FilteringTextInputFormatter.digitsOnly
            ],
          ),

          Container(
            margin: EdgeInsets.only(top: 50),
            child: CupertinoButton(

                color: Colors.green,
                child: Text("Okay"), onPressed: (){
              FocusScope.of(context).unfocus();
              if (!homeBloc.userFormKey.currentState!.validate()) {
                return;
              }
              else{
                print("valide");
              }
            }),
          )
        ],
      )
    );
}
//endregion


//region Common text field
Widget commonTextField({required List<TextInputFormatter> inputFormatters,required dynamic validator }){
    return TextFormField(



    );
}
//endregion




}
