import 'package:flutter/material.dart';
import 'package:soundbarz/components.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy", style: Textstyling.titleText(),),
        centerTitle: true,
        backgroundColor: scaffoldColor, // App bar background color
   leading: IconButton(onPressed: (){
  Navigator.pop(context);
   }, icon: Icon(Icons.arrow_back_ios, color: white,))    ),
      backgroundColor: scaffoldColor, // Page background color
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Privacy Policy for Moodz",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 2,
                color: Colors.white, // White text color
              ),
            ),
            Text(
              "Last Updated: 17/12/2024",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Welcome to Moodz! Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your data when you use our music streaming app.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "1. Information We Collect",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "We collect the following types of data to improve your experience:\n- Account Information\n- Usage Data\n- Device Information\n- Location Data (optional)",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "2. How We Use Your Information",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "We use your data to:\n- Provide music streaming and personalized recommendations.\n- Improve app performance and user experience.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "3. Data Security",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "We take security seriously and use encryption and secure servers to protect your data.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "4. Your Choices",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "You can access and update your data or disable notifications at any time in the app settings.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "5. Third-Party Services",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "We may use third-party services such as analytics tools or payment processors.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "6. Children’s Privacy",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Moodz is not intended for users under 13 years old. We do not knowingly collect data from children.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "7. Changes to This Policy",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "We may update this Privacy Policy. Significant changes will be communicated.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              "8. Contact Us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "For any questions, email us at support@moodzapp.com or visit our website.",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 32),
            Center(
              child: Text(
                "Thank you for choosing Moodz!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryAssetColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
