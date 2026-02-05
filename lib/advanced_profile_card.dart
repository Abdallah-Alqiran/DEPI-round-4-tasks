import 'package:flutter/material.dart';

class AdvancedProfileCard extends StatelessWidget {
  const AdvancedProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Advanced Profile Card"),), backgroundColor: Color.fromARGB(255, 194, 251, 196),),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Color(0xFF0F6DF9), Color(0xFF3A87FB), Color(0xFF4CAF50)],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 32, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image(
                    image: AssetImage('assets/my_image.jpg'),
                    fit: BoxFit.cover,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Abdallah Alqiran",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Mobile Developer | Software Engineer",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "abdallahalqiran765@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _customButton("Message", Icons.message),
                    _customButton("Call", Icons.phone)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customButton(String text, IconData icon, [void Function()? onPressed]) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        elevation: 5,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.green, size: 18,),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
