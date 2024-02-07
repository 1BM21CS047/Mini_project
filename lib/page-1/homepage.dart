import 'package:add_expense/models/signup.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/gestures.dart';
//import 'dart:ui';
//import 'package:google_fonts/google_fonts.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: TextButton(
        // homepagexhJ (18:26)
        onPressed: () {},
        style: TextButton.styleFrom (
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(0*fem, 43*fem, 0*fem, 52*fem),
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xff020202),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0*fem, 4*fem),
                blurRadius: 2*fem,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // groupcWx (23:28)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 24*fem),
                width: 200*fem,
                height: 52*fem,
                child: Image.asset(
                  'assets/page-1/images/group-NWx.png',
                  width: 200*fem,
                  height: 52*fem,
                ),
              ),
              Container(
                // autogroupk1nuVqe (3cmD7TPbx27kS3ds15k1NU)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
                width: double.infinity,
                height: 472*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // bg1p7E (1:20)
                      left: 0*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 360*fem,
                          height: 398*fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(58*fem),
                            child: Image.asset(
                              'assets/page-1/images/bg-1-uGg.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // knowwhereallyoumoneygoes6qS (1:25)
                      left: 74*fem,
                      top: 381*fem,
                      child: Align(
                        child: SizedBox(
                          width: 202*fem,
                          height: 91*fem,
                          child: Text(
                            '\nKnow where all \nyou money goes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25*ffem,
                              fontWeight: FontWeight.w800,
                              height: 1.2125*ffem/fem,
                              color: Color(0xffbb8cfc),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // lsA4c (87:102)
                margin: EdgeInsets.fromLTRB(94*fem, 0*fem, 107*fem, 0*fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupd5deV6t (3cmDKNDRXe6NH5p21td5dE)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                      width: double.infinity,
                      height: 35*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff36344a),
                        borderRadius: BorderRadius.circular(11*fem),
                      ),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25*ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125*ffem/fem,
                            color: Color(0xff65666a),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // newuser9hE (87:99)
                      margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 18*fem),
                      child: Text(
                        'New User ?',
                        textAlign: TextAlign.center,
                        style: TextStyle (
                          
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125*ffem/fem,
                          fontStyle: FontStyle.italic,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupyc7nFVN (3cmDSN1mNBmi7mDRZbYc7N)
                      width: double.infinity,
                      height: 35*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff36344a),
                        borderRadius: BorderRadius.circular(11*fem),
                      ),
                      ),
                      Positioned(
                                left: 22 * fem,
                                top: 0 * fem,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => signup(),
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
                            fontSize: 25*ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125*ffem/fem,
                            color: Color(0xff65666a),
                          ),
                        ),
                      ),
                    ),
                ),],
                ),
              ),
            ],
          ),
        ),
      ),
          );
  }
}