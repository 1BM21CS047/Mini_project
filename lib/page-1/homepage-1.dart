// ignore: file_names
// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:add_expense/models/login.dart';
import 'package:add_expense/models/signup.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/gestures.dart';
//import 'dart:ui';
//import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SingleChildScrollView(
      child: Material(
        child: Form(
          //key: _formKey,
          child: SizedBox(
            width: double.infinity,
            child: Container(
              // homepage1g8t (87:78)
              padding: EdgeInsets.fromLTRB(0 * fem, 43 * fem, 0 * fem, 44 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff020202),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x3f000000),
                    offset: Offset(0 * fem, 4 * fem),
                    blurRadius: 2 * fem,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // groupW7v (87:79)
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
                    width: 200 * fem,
                    height: 52 * fem,
                    child: Image.asset(
                      'assets/page-1/images/group-A8k.png',
                      width: 200 * fem,
                      height: 52 * fem,
                    ),
                  ),
                  Container(
                    // autogroupj6snNR2 (3cmCdigpTDFRrZriatj6sn)
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 28 * fem),
                    width: double.infinity,
                    height: 472 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // knowwhereallyoumoneygoesTSU (87:84)
                          left: 74 * fem,
                          top: 381 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 202 * fem,
                              height: 91 * fem,
                              child: Text(
                                '\nKnow where all \nyour money goes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  
                                  fontSize: 23 * ffem,
                                  fontWeight: FontWeight.w800,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xffbb8cfc),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // bg1XSL (87:110)
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 360 * fem,
                              height: 398 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(58 * fem),
                                child: Image.asset(
                                  'assets/page-1/images/bg-1-1Sc.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // lsD4G (87:103)
                    margin: EdgeInsets.fromLTRB(94 * fem, 0 * fem, 107 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupvnqjL8t (3cmCqTrFTuzgWn9DkcVNqJ)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 9 * fem),
                          width: double.infinity,
                          height: 50 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle37Rw2 (87:104)
                                left: 0 * fem,
                                top: 7 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 159 * fem,
                                    height: 35 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11 * fem),
                                        color: const Color(0xffb0aaf4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // frame3VR6 (87:118)
                                left: 33 * fem,
                                top: 0 * fem,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const login(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24 * fem),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          
                                          fontSize: 25 * ffem,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2125 * ffem / fem,
                                          color: const Color(0xff656669),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // newuser5PJ (87:107)
                          margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 0 * fem, 11 * fem),
                          child: Text(
                            'New User ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupyjqxLq2 (3cmCuiEAwKNVmqMMqMyjQx)
                          width: double.infinity,
                          height: 50 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle38VC8 (87:106)
                                left: 0 * fem,
                                top: 7 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 159 * fem,
                                    height: 35 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11 * fem),
                                        color: const Color(0xffb0aaf4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // frame4zua (92:58)
                                left: 22 * fem,
                                top: 0 * fem,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const signup(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24 * fem),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SIGN UP',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          
                                          fontSize: 25 * ffem,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2125 * ffem / fem,
                                          color: const Color(0xff65666a),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
