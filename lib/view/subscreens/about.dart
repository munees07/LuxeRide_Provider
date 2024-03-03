import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('About')),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30),
            Text(
              'Welcome to LuxeRide: Your Premier Luxury Vehicle Rental Experience',
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            Text('''
              
               At LuxeRide, we redefine luxury transportation, offering an unparalleled experience in renting premium vehicles. Whether you're seeking the thrill of the open road in a sleek sports car or cruising through the city streets atop a powerful motorcycle, LuxeRide has the perfect vehicle to elevate your journey.'''),
            Gap(20),Text('Our Fleet:',style: TextStyle(fontWeight: FontWeight.bold)),
            Text('''
              
               Our meticulously curated fleet boasts a diverse selection of luxury cars and bikes, each meticulously maintained to ensure optimal performance and style. From iconic sports cars to elegant sedans, from high-performance motorcycles to sophisticated cruisers, we have something to suit every taste and occasion.'''),
            Gap(20),Text('Seamless Experience:',style: TextStyle(fontWeight: FontWeight.bold)),
            Text('''
              
               With our intuitive user interface, browsing and booking your dream vehicle is effortless. Simply browse through our categories of cars and bikes, explore detailed descriptions and images, and select the perfect ride for your adventure. With just a few clicks, you can reserve your vehicle and be on your way to experiencing the epitome of luxury travel.'''),
            Gap(20),Text('User-Centric Approach:',style: TextStyle(fontWeight: FontWeight.bold)),
            Text('''
              
               At LuxeRide, customer satisfaction is our top priority. We understand that each journey is unique, which is why we offer flexible rental options and competitive pricing, making luxury travel accessible to all. Whether you're planning a weekend getaway, a special event, or simply indulging in a day of exploration, LuxeRide is here to exceed your expectations.'''),
            Gap(20),Text('Advanced Features:',style: TextStyle(fontWeight: FontWeight.bold)),
            Text('''
              
               Our state-of-the-art platform allows for seamless management of our vehicle inventory. We regularly update our database with the latest additions, ensuring that you always have access to the most prestigious and sought-after vehicles on the market. Additionally, our booking system streamlines the reservation process, allowing you to secure your desired vehicle with ease.'''),
            Gap(20),Text('Experience Luxury, Affordably:',style: TextStyle(fontWeight: FontWeight.bold)),
            Text('''
              
               At LuxeRide, we believe that luxury should be accessible to everyone. That's why we offer our premium vehicles at affordable prices, without compromising on quality or service. Whether you're a seasoned enthusiast or a first-time renter, LuxeRide invites you to experience the thrill of luxury travel without breaking the bank.'''),
            Gap(20),Text('Contact Us:',style: TextStyle(fontWeight: FontWeight.bold)),
            Text('''
              
               Ready to embark on your next adventure? Get in touch with our dedicated team today to discover the ultimate luxury vehicle rental experience. With LuxeRide, every journey is a celebration of style, performance, and sophistication.'''),
            Gap(30)
          ],
        ),
      )),
    );
  }
}
