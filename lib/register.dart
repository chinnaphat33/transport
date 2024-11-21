// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  Widget showlogo() {
    return Image.asset(
      'images/Transpot.jpg',
      height: 50,
      width: 50,
    );
  }

  @override
  final formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  Future sign_up() async {
    String url = "http://10.0.2.2/transport_login/register.php";
    final respone = await http.post(Uri.parse(url), body: {
      'name': name.text,
      'email': email.text,
      'password': pass.text,
    });
    var data = json.decode(respone.body);
    if (data == "Error") {
      Navigator.pushNamed(context, 'register');
    } else {
      Navigator.pushNamed(context, 'home');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Transport Application'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: showlogo(),
                ),

                // ส่วนของ Search Bar ชั่วคราว
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: 200,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'ค้นหา...',
                            suffixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ส่วยของปุ่ม Icon
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: PopupMenuButton<String>(
                          icon: const Icon(Icons.person, color: Colors.black),
                          onSelected: (String value) {
                            if (value == 'login') {
                              print("เข้าสู่ระบบ");
                              Navigator.pushNamed(context, 'login');
                            } else if (value == 'register') {
                              print("สมัครสมาชิก");
                              Navigator.pushNamed(context, 'register');
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'login',
                              child: Text('เข้าสู่ระบบ'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'register',
                              child: Text('สมัครสมาชิก'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'หน้าหลัก',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'เกี่ยวกับ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'บริการ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'คำแนะนำ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'ติดต่อเรา',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 25, 50, 0),
            padding: const EdgeInsets.all(25),
            color: const Color.fromARGB(217, 202, 202, 208),
            child: Center(
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          child: Text(
                            "สมัครสมาชิก",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3F60A0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.facebook,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'เข้าสู่ระบบ Facebook',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 350,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 227, 32, 32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'เข้าสู่ระบบ Gmail',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'ชื่อผู้ใช้งาน',
                            ),
                            validator: (val) {
                              if (val !.isEmpty) {
                                return 'โปรดกรอกข้อมูล';
                              }
                              return null;
                            },
                            controller: name,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                     
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'อีเมลล์',
                            ),
                            validator: (val) {
                              if (val !.isEmpty) {
                                return 'โปรดกรอกข้อมูล';
                              }
                              return null;
                            },
                            controller: email,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'ยืนยันอีเมลล์',
                            ),
                            validator: (val) {
                              if (val !.isEmpty) {
                                return 'โปรดกรอกข้อมูล';
                              }
                              else if(val != email.text)
                              {
                                return 'อีเมลล์ไม่ตรงกัน';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 350,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'รหัสผ่าน',
                            ),
                            validator: (val) {
                              if (val !.isEmpty) {
                                return 'โปรดกรอกข้อมูล';
                              }
                              return null;
                            },
                            controller: pass,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3F60A0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              bool pass = formKey.currentState!.validate();
                              if(pass)
                              {
                                sign_up();
                              }
                            },
                            child: const Text(
                              'สมัครสมาชิก',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
