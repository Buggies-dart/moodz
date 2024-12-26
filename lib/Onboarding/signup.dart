import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:soundbarz/Onboarding/genreselect.dart';
import 'package:soundbarz/Onboarding/login.dart';
import 'package:soundbarz/components.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isLoading = false;
   final TextEditingController controllerMail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerUserName = TextEditingController();
  void onTap() {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return const MoodSelect();
    }));
  }
  void googleAuth(){
  }
   @override
  void dispose() {
    controllerMail.dispose();
    controllerPassword.dispose();
    controllerUserName.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return  Scaffold(  backgroundColor: scaffoldColor,
    appBar: AppBar( title: Container( color: null, width: sizeQuery.width/5, height: sizeQuery.width/5,
        child: Image.asset('assets/logos/applogo.png', fit: BoxFit.contain,)),
    centerTitle: true,),
      body: isLoading == true? const Center(
     child: CircularProgressIndicator.adaptive(),
      ):
      SafeArea( 
        child: 
      Column( 
       children: [
         SizedBox( height: sizeQuery.height/10,),
       const Text('Welcome To MOODZ', style: TextStyle( fontWeight: FontWeight.bold,
        fontSize: 30, color: white)
       ),
      SizedBox( height:  sizeQuery.height/25),
        signupFields('Email', controllerMail),
        signupFields('Username', controllerUserName),
        signupFields('Password', controllerPassword),
       SizedBox( height:  sizeQuery.height/20,),
         Padding(
           padding:  EdgeInsets.only(left:  sizeQuery.width/15, right: sizeQuery.width/15),
           child:  Container( width: sizeQuery.width/1.1, 
      decoration: const BoxDecoration( gradient: LinearGradient(colors: [
      primaryAssetColor, secondaryAssetColor
     ])),
       child: ElevatedButton(onPressed: onTap, style: ElevatedButton.styleFrom(
       backgroundColor: Colors.transparent, shadowColor: Colors.transparent,
       ),
        child: Text('SIGN UP', style: Textstyling.titleText(),)),
     ),
         ),
         SizedBox( height: sizeQuery.height/20),
   Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Flexible(
      child: Padding(
        padding:  EdgeInsets.only(left: sizeQuery.width/15, right:sizeQuery.width/45), 
        child:const Divider(
          thickness: 1.5,
          color: Colors.black,
        ),
      ),
    ),
  const  Text('or', style: TextStyle(color: white, fontSize: 17),),
    Flexible(
      child: Padding(
        padding:  EdgeInsets.only(left: sizeQuery.width/30, right:sizeQuery.width/15),
        child: const Divider(
          thickness: 1.5,
          color: Colors.black,
        ),
      ),
    ),
  ],
),
 Row( mainAxisAlignment: MainAxisAlignment.center,
  children: [
    smSignupIcon(MdiIcons.google, googleAuth),
    smSignupIcon(MdiIcons.cellphone, (){}),
     smSignupIcon(MdiIcons.spotify, (){}),
       
       ]),
  
     Row( children: [  SizedBox( width: sizeQuery.width/6,),
      const Text('Do you already have an account?', style: TextStyle(fontSize: 15, color: white),),
         TextButton(onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return
        const Login();
      }));
         }, child: const Text('Sign in',)) ],)]
      )
      )
    );
  }

  Widget signupFields(String data, TextEditingController controller) {
    return Padding( padding: const EdgeInsets.only( right: 30, left: 30, bottom: 15),
      child: TextField( controller: controller,
          decoration: InputDecoration( filled: true, fillColor: Colors.white,
           hintText: data, contentPadding: const EdgeInsets.all(12),
           focusedBorder: const OutlineInputBorder( borderSide: BorderSide.none),
           border: const OutlineInputBorder( borderSide: BorderSide.none)
          ),
        ),
    );
  }
  Widget smSignupIcon(IconData icon, VoidCallback onTap){
    return IconButton(onPressed: onTap, icon: Icon(icon, size: 35,));
   }
}
