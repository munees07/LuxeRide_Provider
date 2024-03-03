import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black, title: const Text('Privacy Policy')),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Text(
                  '''At LuxeRide, we are committed to protecting the privacy and security of our users' personal information. This Privacy Policy outlines how we collect, use, and safeguard the information you provide to us through our luxury vehicle rental application.'''),
              Gap(20),Text('Information We Collect:',
              style: TextStyle(fontWeight: FontWeight.bold)),
              Text('''

 Personal Information: When you create an account or make a reservation with LuxeRide, we may collect personal information such as your name, email address, phone number, and payment details.

 Vehicle Preferences: We may collect information about your vehicle preferences and rental history to enhance your user experience and provide personalized recommendations.

 Usage Data: We may collect information about how you interact with our application, including your browsing activity, rental selections, and device information.'''),
              Gap(20),Text('How We Use Your Information:',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('''

 Provide Services: We use your personal information to facilitate vehicle rentals, process payments, and communicate with you about your reservations.

 Improve User Experience: We may use your information to analyze user preferences and behavior, optimize our services, and enhance the functionality of our application.

 Marketing and Communications: With your consent, we may use your contact information to send you promotional offers, newsletters, and updates about LuxeRide and its affiliated partners.'''),
              Gap(20),Text('Data Security:',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('''

 LuxeRide employs industry-standard security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. We utilize encryption, firewalls, and secure server infrastructure to safeguard your data.'''),
              Gap(20),Text('Third-Party Services:',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('''

 LuxeRide may utilize third-party services and partners to facilitate certain functions of our application, such as payment processing and analytics. These third parties may have access to your personal information only to the extent necessary to perform their services, and they are required to adhere to confidentiality and security obligations.'''),
              Gap(20),Text('Data Retention:',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('''

 We retain your personal information for as long as necessary to fulfill the purposes outlined in this Privacy Policy or as required by law. If you wish to delete your account or request the removal of your personal data, please contact us at muneezshanu5661@gmail.com.'''),
              Gap(20),Text('Updates to Privacy Policy:',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('''

 LuxeRide reserves the right to update or modify this Privacy Policy at any time. We will notify users of any material changes to this policy by posting a revised version on our application or by other means of communication.'''),
              Gap(20),Text('Contact Us:',style: TextStyle(fontWeight: FontWeight.bold)),
              Text('''

 If you have any questions, concerns, or requests regarding this Privacy Policy or the handling of your personal information, please contact us at muneezshanu5661@gmail.com.

 By using the LuxeRide application, you consent to the collection and use of your information as described in this Privacy Policy.'''),
              Gap(30)
            ],
          ),
        ),
      ),
    );
  }
}