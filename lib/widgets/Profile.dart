import 'package:add_expense/widgets/dashboard.dart';
import 'package:add_expense/widgets/my_app.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class profilePageScreen extends StatefulWidget {
  const profilePageScreen({super.key});

  @override
  State<profilePageScreen> createState() => _profilePageScreenState();
}

class _profilePageScreenState extends State<profilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpenseCategoryPage(),
                    ));
              },
              child: Container(
                child: Image.asset('images/home_btn.png'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddExpense(),
                    ));
              },
              child: Container(
                child: Image.asset('images/transfer.png'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profilePageScreen(),
                    ));
              },
              child: Container(
                child: Image.asset('images/profile_btn.png'),
              ),
            ),
            GestureDetector(
              onTap: () {
                //logout logic
              },
              child: Container(
                child: Image.asset('images/logout_btn.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 110),
            child: buildCoverImage()),
        Positioned(top: 288 - 72, child: buildProfileImage()),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://img.freepik.com/free-photo/vibrant-colors-flow-abstract-wave-pattern-generated-by-ai_188544-9781.jpg?w=1060&t=st=1707068253~exp=1707068853~hmac=a24279226bd3fb0f2c95366a4dfa33925462dd4213bff562fc1e7e68e8c3b39f',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => Container(
        padding:
            EdgeInsets.all(8.0), // Padding to control the width of the border
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white, // Border color
            width: 4.0, // Border width
          ),
        ),
        child: CircleAvatar(
          radius: 72,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: const NetworkImage(
            'https://t4.ftcdn.net/jpg/04/61/47/03/360_F_461470323_6TMQSkCCs9XQoTtyer8VCsFypxwRiDGU.jpg',
          ),
        ),
      );

  Widget buildContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            const Text(
              'revanth@gamil.com', // Replace with the actual email address
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Implement change password functionality
                // This could navigate to a new screen or show a dialog for password change
              },
              child: Container(
                constraints: const BoxConstraints(
                    maxWidth: 200), // Adjust the maximum width as needed
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock),
                      const SizedBox(
                          width: 8), // Add some space between the icon and text
                      Text(
                        'Change Password',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
                child: Icon(
              icon,
              size: 32,
            )),
          ),
        ),
      );
}
