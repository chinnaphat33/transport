// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_login/login.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Widget showlogo() {
    return Image.asset(
      'images/Transpot.jpg',
      height: 50,
      width: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transpot Application'),
      ),
      body: Column(children: [
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
              Row(
                children: [
                  // เพิ่ม Search Bar
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      width: 200, // กำหนดความกว้างของ Search Bar
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'ค้นหา...',
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 13.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      child: PopupMenuButton<String>(
                        icon: Icon(Icons.person, color: Colors.black),
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
                          PopupMenuItem<String>(
                            value: 'login',
                            child: Text('เข้าสู่ระบบ'),
                          ),
                          PopupMenuItem<String>(
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
      color: Colors.black, // สีพื้นหลังแทบเป็นสีดำ
      padding: const EdgeInsets.symmetric(vertical: 20), // เพิ่ม Padding
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // จัดตำแหน่งช่องว่างเท่ากัน
        children: const [
          // ไอเท็มในแทบ
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
    )
    
      ]),
    );
    // แทบสีดำข้างบน
    
  }
}
