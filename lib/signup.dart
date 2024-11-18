import 'package:bibimysalon_klmpk6/database_service.dart';
import 'package:bibimysalon_klmpk6/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homelog.dart'; // Pastikan mengimpor halaman HomeLogPage

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _dbService = DatabaseService();

//bagian control firebass
final _username = TextEditingController();
final _email = TextEditingController();
final _telephone = TextEditingController();
final _password = TextEditingController();

@override
  void dispose() {
    super.dispose();

    _username.dispose();
    _email.dispose();
    _telephone.dispose();
    _password.dispose();

}

//   String email = "", telephone = "", username = "", password = "";
//   TextEditingController emailcontroller = new TextEditingController();
//   TextEditingController telephonecontroller = new TextEditingController();
//   TextEditingController usernamecontroller = new TextEditingController();
//   TextEditingController passwordcontroller = new TextEditingController();
//
// //membantu dalam memvalidasi setiap field
//   final _formkey = GlobalKey<FormState>();
//
//   //bagian kalo pengisian dengan syarat
//   registration() async {
//     if (password != null && usernamecontroller.text!=""&& emailcontroller.text!=""&& telephonecontroller.text!="") {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(
//           "Registered Successfully",
//           style: TextStyle(fontSize: 20),
//         )));
//         // akan memindahkan ke halaman home
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Home()));
//       } on FirebaseAuthException catch (e) {
//         //kalo password terlalu lemah
//         if (e.code == 'weak-password') {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Password Provided is too weak",
//                 style: TextStyle(fontSize: 18),
//               )));
//         }else if(e.code=="email-already-in-use"){
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Account already exists",
//                 style: TextStyle(fontSize: 18),
//               )));
//         }
//       }
//     }
//   }

  // // Controller untuk form input
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController usernameController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEAE3), // Background color
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container untuk memberikan jeda di atas logo
            Container(
              height: 80, // Atur tinggi sesuai kebutuhan
              color: Color(0xFF121481), // Warna jeda
            ),

            // Logo Container with Bottom Color
            Container(
              color: Color(0xFF121481), // Warna di bawah logo
              child: Column(
                children: [
                  Image.asset(
                    "img/logo.jpg", // Pastikan logo Anda sudah ada di folder assets
                    height: 120,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),

            // Garis
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              padding: EdgeInsets.only(top: 30),
              child: Divider(
                color: Color(0xFFFFB1B1), // Menggunakan warna dari palet
                thickness: 5,
              ),
            ),
            SizedBox(height: 20),

            // Judul Sign Up
            Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF121481), // Menggunakan warna dari palet
              ),
            ),
            SizedBox(height: 20),

            // Input Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                //bagian control firebass
                controller: _email,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFFFB1B1)), // Border color when focused
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Input Nomor HP
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              // child: Form(
              //   key: _formkey,
                child: TextField(
                  //bagian control firebass
                  controller: _telephone,
                  decoration: InputDecoration(
                    labelText: "Nomor HP",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Color(0xFFFFB1B1)), // Border color when focused
                    ),
                  ),
                ),
              ),
            // ),
            SizedBox(height: 20),

            // Input Username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                //bagian control firebass
                controller: _username,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFFFB1B1)), // Border color when focused
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Input Password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                //bagian control firebass
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xFFFFB1B1)), // Border color when focused
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),

            // GestureDetector(
            //   onTap: () {
            //     if (_formkey.currentState!.validate()) {
            //       setState(() {
            //         email = emailcontroller.text;
            //         username = usernamecontroller.text;
            //         telephone = telephonecontroller.text;
            //         password = passwordcontroller.text;
            //       });
            //     }
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xFFFFB1B1), // Menggunakan warna dari palet
            //       borderRadius: BorderRadius.circular(10), // Tambahkan border radius jika diperlukan
            //     ),
            //     padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            //     child: Center( // Tambahkan Center untuk memastikan teks berada di tengah
            //       child: Text(
            //         "Sign Up",
            //         style: TextStyle(
            //           color: Colors.white, // Warna teks
            //           fontSize: 18, // Ukuran font
            //         ),
            //       ),
            //     ),
            //   ),
            // ),


            // Button Sign Up
            ElevatedButton(
              onPressed: () {
                _dbService.create();
                // Aksi ketika tombol Sign Up ditekan
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeLog()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color(0xFFFFB1B1), // Menggunakan warna dari palet
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white), // Text color for button
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
