import 'package:flutter/material.dart';
import 'package:soundbarz/components.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: IconButton(onPressed: (){
      Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back_ios, color: white,)),
        title: Text("Terms and Conditions", style: Textstyling.titleText(),),
        centerTitle: true,
        backgroundColor: scaffoldColor, // App bar background
      ),
      backgroundColor: scaffoldColor, // Page background
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Terms and Conditions for Moodz",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 2,
                color: Colors.white, // White text
              ),
            ),
            Text(
              "Last Updated: 17/12/2024",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey, // Lighter text for minor details
              ),
            ),
            SizedBox(height: 16),
            Text(
              "1. Acceptance of Terms",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "By using the Moodz app, you agree to comply with these Terms and Conditions. If you do not agree, please refrain from using the app.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "2. User Account",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "To access certain features, you must create an account. You agree to provide accurate information and keep your credentials secure.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "3. Use of the App",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Moodz is intended for personal, non-commercial use. You may not distribute, copy, or modify the app without permission.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "4. Intellectual Property",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "All content, including music, images, and code, is the property of Moodz or its licensors. Unauthorized use is prohibited.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "5. Termination",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "We may terminate or suspend your account if you violate these terms. Upon termination, access to Moodz will be revoked.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "6. Limitation of Liability",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Moodz is provided 'as is'. We are not liable for any damages, losses, or interruptions caused by using the app.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "7. Privacy Policy",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Your use of Moodz is also governed by our Privacy Policy. Please review it for details on data collection and usage.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "8. Changes to Terms",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "We may update these Terms and Conditions. Continued use of Moodz after changes implies acceptance of the new terms.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "9. Governing Law",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "These terms are governed by the laws of your jurisdiction, without regard to conflicts of laws.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "10. Contact Us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "For questions or concerns, email us at support@moodzapp.com or visit our website.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                "Thank you for using Moodz!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryAssetColor, // A small highlight
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
