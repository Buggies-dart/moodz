
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:soundbarz/components.dart';

class PremiumModel extends StatefulWidget {
  const PremiumModel({super.key});

  @override
  State<PremiumModel> createState() => _PremiumModelState();
}

class _PremiumModelState extends State<PremiumModel> {
  @override
  Widget build(BuildContext context) {
    final sizeQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView( scrollDirection: Axis.vertical,
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [ Container( foregroundDecoration: BoxDecoration( color: Colors.black.withOpacity(0.3),
                  backgroundBlendMode: BlendMode.darken,
              ),
              
                height: sizeQuery.height/2.5, width: double.infinity,
                decoration: const BoxDecoration( gradient: RadialGradient(colors: [
              Color.fromARGB(249, 78, 75, 75), Color.fromARGB(249, 59, 40, 51) 
              ]),
              image: DecorationImage(image: AssetImage('assets/images/premiumbg.png'),
              fit: BoxFit.cover), 
              ),
              ),
          Padding(
            padding:  EdgeInsets.only(top: sizeQuery.height/12),
            child: Column( 
                  children: [
                Padding(
                  padding:  EdgeInsets.only(left: sizeQuery.height/40),
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: sizeQuery.height/20, ),
                    child: Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logos/applogo.png', width: sizeQuery.height/10, color: white,),
                      SizedBox( width: sizeQuery.height/60),
                      const Text('Premium', style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 35),
                      )
                      ],
                    ),
                  ),
                ),  
                SizedBox( height: sizeQuery.height/30,),
                      Padding( padding: EdgeInsets.only(right: sizeQuery.width/5),
                        child:  Text('Improve Your\nListening Experience', style: TextStyle(color: white,
                        fontSize: sizeQuery.height/26, fontWeight: FontWeight.bold),),
                      )  ]
                ),
          ),]
          ),
          SizedBox( height: sizeQuery.height/30,),
         SizedBox( height: sizeQuery.height/15, width: double.infinity,
          child: Padding( padding:  EdgeInsets.only( left: sizeQuery.width/25, right: sizeQuery.width/25, ),
            child: ElevatedButton(onPressed: (){}, child:  Text('Get Started', style: Textstyling.subtitleTextblack(),),))),
          SizedBox( height: sizeQuery.height/40,),  
         Padding(
           padding: EdgeInsets.only( left: sizeQuery.width/25, right: sizeQuery.width/25,),
           child: const Text('Be in your feelings without ads interrruption. This amazing offer is available for as low as \$3.99 monthly. Terms and Conditions may apply.', maxLines: 4,
            style: TextStyle( color: Colors.grey),),
         ),
        Padding(
          padding: EdgeInsets.all(sizeQuery.width/35),
          child: Container( height: sizeQuery.height/3,
             decoration: BoxDecoration(
            color:  Colors.black, borderRadius: BorderRadius.circular(20)
          ),
            child: Column( 
          children: [
             SizedBox( height: sizeQuery.height/60,),
            Text('Premium Features', style: Textstyling.titleText(),),
          const Divider(thickness: 0.5,),
           premiumBenefits(MdiIcons.advertisementsOff, 'Ad-free music listening', (){}),
           premiumBenefits(MdiIcons.robot, 'Playlist Suggestions by Moodz AI', (){}),
           premiumBenefits(Icons.headphones, 'High-audio quality', (){}),
           premiumBenefits(Icons.playlist_add, 'Save unlimited playlists', (){}),
          ],
          ),
          ),
        ),
         Padding(
           padding: EdgeInsets.only( left :sizeQuery.width/35),
           child: Text('See All Available Plans', style: Textstyling.titleText()),
         ),
         SizedBox( height: sizeQuery.height/60,),
         Padding(
           padding: EdgeInsets.only( left: sizeQuery.width/35, right: sizeQuery.width/35),
           child: Container( height: sizeQuery.height/2.85,
             decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)
           ),
            child: Column( 
              children: [
            Padding(
              padding:  EdgeInsets.all(sizeQuery.height/50),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(  children: [
                  Image.asset('assets/logos/applogo.png', width: sizeQuery.height/25, color: white,),
                              SizedBox( width: sizeQuery.height/100),
                               Text('Premium', style: Textstyling.subtitleText()
                              )
                              ],
                            ),
              const Text('3 MONTHS SUBSCRIPTION', style: TextStyle( color: primaryAssetColor, fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Text('\$3.50 / month', style: TextStyle( color: Colors.white70),)    ],
              ),
            ),  
              Divider(thickness: 0.5, indent: sizeQuery.width/20, endIndent: sizeQuery.width/20), 
            featuresList(sizeQuery, '30% Off the initial monthly payment'),
            featuresList(sizeQuery, 'Plus 1 month free premium listening'),
            featuresList(sizeQuery, 'Cancel anytime'),
              Padding(
                padding:  EdgeInsets.all(sizeQuery.height/40),
                child: SizedBox( width: double.infinity, height: sizeQuery.height/17,
                  child: ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: primaryAssetColor),
                    onPressed: (){}, child: Text('SUBSCRIBE', style: Textstyling.titleText(),)),
                ),
              ) ],
            ),
           ),
         ),
          SizedBox( height: sizeQuery.height/60,),
      Padding(
           padding: EdgeInsets.only( left: sizeQuery.width/35, right: sizeQuery.width/35),
           child: Container( height: sizeQuery.height/3.25,
             decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)
           ),
            child: Column( 
              children: [
            Padding(
              padding:  EdgeInsets.all(sizeQuery.height/50),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(  children: [
                  Image.asset('assets/logos/applogo.png', width: sizeQuery.height/25, color: white,),
                              SizedBox( width: sizeQuery.height/100),
                               Text('Premium', style: Textstyling.subtitleText()
                              )
                              ],
                            ),
              const Text('1 MONTH SUBSCRIPTION', style: TextStyle( color: primaryAssetColor, fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Text('\$5 / month', style: TextStyle( color: Colors.white70),)    ],
              ),
            ),  
              Divider(thickness: 0.5, indent: sizeQuery.width/20, endIndent: sizeQuery.width/20), 
            featuresList(sizeQuery, 'Cancel anytime'),
              Padding(
                padding:  EdgeInsets.all(sizeQuery.height/40),
                child: SizedBox( width: double.infinity, height: sizeQuery.height/17,
                  child: ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: primaryAssetColor),
                    onPressed: (){}, child: Text('SUBSCRIBE', style: Textstyling.titleText(),)),
                ),
              ) ],
            ),
           ),
         ),
       SizedBox( height: sizeQuery.height/60,),
         Padding(
           padding: EdgeInsets.only( left: sizeQuery.width/35, right: sizeQuery.width/35),
           child: Container( height: sizeQuery.height/2.85,
             decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)
           ),
            child: Column( 
              children: [
            Padding(
              padding:  EdgeInsets.all(sizeQuery.height/50),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(  children: [
                  Image.asset('assets/logos/applogo.png', width: sizeQuery.height/25, color: white,),
                              SizedBox( width: sizeQuery.height/100),
                               Text('Premium', style: Textstyling.subtitleText()
                              )
                              ],
                            ),
              const Text('1 YEAR SUBSCRIPTION', style: TextStyle( color: primaryAssetColor, fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const Text('\$2.50 / month', style: TextStyle( color: Colors.white70),)    ],
              ),
            ),  
              Divider(thickness: 0.5, indent: sizeQuery.width/20, endIndent: sizeQuery.width/20), 
            featuresList(sizeQuery, '50% Off the initial monthly payment'),
            featuresList(sizeQuery, 'Plus 3 months free premium listening'),
            featuresList(sizeQuery, 'Cancel anytime'),
              Padding(
                padding:  EdgeInsets.all(sizeQuery.height/40),
                child: SizedBox( width: double.infinity, height: sizeQuery.height/17,
                  child: ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: primaryAssetColor),
                    onPressed: (){}, child: Text('SUBSCRIBE', style: Textstyling.titleText(),)),
                ),
              ) ],
            ),
           ),
         )
         ],
        
        ),
      ),
    );
  }

  Widget featuresList(Size sizeQuery, String text) {
    return SizedBox( height: sizeQuery.height/35,
      child: ListTile( leading:  Text('•', style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: sizeQuery.height/40),), title: Text( text, style: const TextStyle(color: white)),
      contentPadding: EdgeInsets.only(left: sizeQuery.width/25), ),
    );
  }

  ListTile premiumBenefits(IconData icon, String text, VoidCallback onTap) {
    return ListTile(leading:  Icon(icon, color: white,), title:  Text(text, style: const TextStyle(
      color: white
    ),),
  onTap: onTap );
  }
}