// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MaterialApp(home: ProfileCard()));
// }
//
// class ProfileCard extends StatelessWidget {
//   const ProfileCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile Card"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // Main Profile Card
//               Container(
//                 padding: const EdgeInsets.all(24),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.shade50,
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.blue.shade100),
//                 ),
//                 child: Column(
//                   children: [
//                     const CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Colors.blueAccent,
//                       child: Text("D", style: TextStyle(fontSize: 32, color: Colors.white)),
//                     ),
//                     const SizedBox(height: 12),
//                     const Text(
//                       "Dara Kem",
//                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//                     const Text(
//                       "Software Engineering",
//                       style: TextStyle(color: Colors.blueAccent),
//                     ),
//                     const SizedBox(height: 20),
//
//                     // Stats Box
//                     Container(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           _buildStatColumn("8", "COURSES"),
//                           _buildStatColumn("3.5", "GPA"),
//                           _buildStatColumn("64", "CREDITS"),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Buttons Row
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
//                       child: const Text("Follow", style: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: OutlinedButton(
//                       onPressed: () {},
//                       style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.blueAccent)),
//                       child: const Text("Message", style: TextStyle(color: Colors.blueAccent)),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               TextButton(onPressed: () {}, child: const Text("View Full Profile")),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method for the stats
//   Widget _buildStatColumn(String value, String label) {
//     return Column(
//       children: [
//         Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//         Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
//       ],
//     );
//   }
// }
//
//

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class ProductCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String priceMain;
//   final String priceDecimal;
//   final Color bgColor;
//
//   const ProductCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.priceMain,
//     required this.priceDecimal,
//     required this.bgColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Column(
//         children: [
//           // 1. Product Image Section
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//             child: Container(
//               height: 150,
//               width: double.infinity,
//               color: bgColor,
//               child: Image.network(
//                 'https://cdn-icons-png.flaticon.com/512/1250/1250615.png', // Placeholder icon
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//
//           // 2. Info Section
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Title and Subtitle
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             title,
//                             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                           ),
//                           Text(subtitle, style: const TextStyle(color: Colors.grey)),
//                         ],
//                       ),
//                     ),
//                     // Price
//                     RichText(
//                       text: TextSpan(
//                         style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
//                         children: [
//                           const TextSpan(text: '\$', style: TextStyle(fontSize: 14)),
//                           TextSpan(text: priceMain, style: const TextStyle(fontSize: 22)),
//                           TextSpan(text: '.$priceDecimal', style: const TextStyle(fontSize: 12)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//
//                 // 3. Add to Cart Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton.icon(
//                     onPressed: () {},
//                     icon: const Icon(Icons.shopping_cart_outlined, size: 18, color: Colors.white),
//                     label: const Text("Add to Cart", style: TextStyle(color: Colors.white)),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.indigoAccent,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyExerciseScreen(),
//     );
//   }
// }
//
// // 3. This is where you put your Scaffold and call your cards
// class MyExerciseScreen extends StatelessWidget {
//   const MyExerciseScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("My Exercises")),
//       body: ListView(
//         children: const [
//           // Call your ProductCard or ProfileCard here
//           ProductCard(
//             title: "Wireless Speaker",
//             subtitle: "Bluetooth 5.0",
//             priceMain: "49",
//             priceDecimal: "99",
//             bgColor: Color(0xFFFFC1C1),
//           ),
//           ProductCard(
//             title: "Headphones Pro",
//             subtitle: "Noise Cancelling",
//             priceMain: "89",
//             priceDecimal: "99",
//             bgColor: Color(0xFFB3D9FF),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: DashboardScreen()));

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting Text
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Student! 👋",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text("Here's your overview", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          // Row with 2 equally-sized Expanded cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                      "12", "COURSES", "3 in progress",
                      Colors.blue.shade50, Colors.blue, Icons.auto_awesome_motion
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                      "3.8", "GPA", "Top 15%",
                      Colors.pink.shade50, Colors.pink, Icons.emoji_events
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Bottom Section: 3 ListTile items in a Column
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.history)),
                  title: Text("Recent Activity"),
                  subtitle: Text("2 new updates"),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.assignment_outlined)),
                  title: Text("Assignments"),
                  subtitle: Text("3 pending"),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  leading: CircleAvatar(child: Icon(Icons.settings_outlined)),
                  title: Text("Settings"),
                  subtitle: Text("Profile & prefs"),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method using Stack for the icon overlay
  Widget _buildStatCard(String val, String label, String sub, Color bg, Color accent, IconData icon) {
    return Stack(
      children: [
        Card(
          color: bg,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(val, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: accent)),
                Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: accent)),
                const SizedBox(height: 4),
                Text(sub, style: const TextStyle(fontSize: 10, color: Colors.black54)),
              ],
            ),
          ),
        ),
        // The Stack overlay icon
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: accent, size: 18),
          ),
        ),
      ],
    );
  }
}
