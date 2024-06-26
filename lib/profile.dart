import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Uint8List? _profileImage;
  Uint8List? _coverImage;
  File? selectedProfileImage;
  File? selectedCoverImage;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: _profileImage != null
                              ? MemoryImage(_profileImage!)
                              : AssetImage('assets/Flutter.jpeg') as  ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: h / 3.5,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: _coverImage != null
                          ? MemoryImage(_coverImage!)
                          : AssetImage('assets/3.png') as  ImageProvider,
                    ),
                  ),
                  Positioned(
                    bottom: -12,
                    left: 320,
                    child: IconButton(
                      onPressed: () {
                        _pickProfileImage();
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(62, 12, 0, 0),
                child: IconButton(
                  onPressed: () {
                    _pickCoverImage();
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),

              Column(
                children: [
                  Text(
                    "Koushik Roy",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Junior Software Engineer",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      launch('https://www.facebook.com/profile.php?id=100005382408988');
                    },
                    child: Image(
                      image: AssetImage('assets/facebook.png'),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      launch('https://www.instagram.com/rkoushik755/');
                    },
                    child: Image(
                      image: AssetImage('assets/instagram.png'),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      launch('https://x.com/Koushik__roy');
                    },
                    child: Image(
                      image: AssetImage('assets/twitter.png'),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      launch('https://www.linkedin.com/in/koushikroy755/');
                    },
                    child: Image(
                      image: AssetImage('assets/linkedin.png'),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      launch('https://github.com/koushikroyshimul');
                    },
                    child: Image(
                      image: AssetImage('assets/github.png'),
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "About",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Hello! I am Koushik Roy, a Junior Software Engineer passionate about creating user-friendly software solutions. I enjoy problem-solving and continuously learning new technologies to improve my skills.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('Employee ID'),
                    subtitle: Text('FSD1111022'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.work),
                    title: Text('Current Position'),
                    subtitle: Text('Junior Software Engineer'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Email'),
                    subtitle: Text('rkoushik755@gmail.com'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Phone'),
                    subtitle: Text('+8801706412485'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text('Started Job'),
                    subtitle: Text('01/01/2024'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickProfileImage() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  // child: Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.gallery, isProfileImage: true);
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.camera, isProfileImage: true);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _pickCoverImage() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallery"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.gallery, isProfileImage: false);
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.camera, isProfileImage: false);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source, {required bool isProfileImage}) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;

    setState(() {
      if (isProfileImage) {
        selectedProfileImage = File(pickedFile.path);
        _profileImage = File(pickedFile.path).readAsBytesSync();
      } else {
        selectedCoverImage = File(pickedFile.path);
        _coverImage = File(pickedFile.path).readAsBytesSync();
      }
    });
  }
}
