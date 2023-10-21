import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
         SizedBox(height: 9.h,),
           Align(
            alignment: Alignment.center,
             child: Container(
              
                height: 10.h,
                width: 50.w,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Create Account",style: TextStyle(fontSize: 25,color:Color(0xff1f2029) ),),
                    Text("Fill your information below",style: TextStyle(fontSize: 15,color:Color(0xff797979), ),textAlign: TextAlign.center,),
                  ],
                ),
              ),
           ),
          SizedBox(height:0.5.h),
          
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: 
            Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                 SizedBox(height: 1.h,),
                Text("Name",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff1f2029)),textAlign: TextAlign.start,),
                SizedBox(height: 1.h,),
              Container(
               margin: EdgeInsets.only(left: 0.5.w),
                height: 5.h,
                width: 88.w,
                child: TextFormField(
                  
                  keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: ("John Doe"),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color:Color(0xff797979)),
                            ),
                          ),
                  
                ),
              ),
              SizedBox(height: 2.5.h,),
              Text("Email",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff1f2029)),textAlign: TextAlign.start,),
                SizedBox(height: 1.h,),
              Container(
                 margin: EdgeInsets.only(left: 0.5.w),
                height: 5.h,
                width: 88.w,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                        
                            labelText: ("example@gmail.com"),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color:Color(0xff797979)),
                            ),
                          ),
                  
                ),
              ),
               SizedBox(height: 2.5.h,),
              Text("Password",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Color(0xff1f2029)),textAlign: TextAlign.start,),
                SizedBox(height: 1.h,),
              Container(
                 margin: EdgeInsets.only(left: 0.5.w),
                height: 5.h,
                width: 88.w,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: ("*********"),
                            suffixIcon:Icon(Icons.remove_red_eye_rounded),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color:Color(0xff797979))
                            ),
                          ),
                  
                ),
              ),
              SizedBox(height: 3.5.h,),
               Container( 
                        alignment: Alignment.center,
                        child:
                            Row(
                              children: [
                                
                                Icon(Icons.check_box,size: 5.w,color: Color(0xff704f38) ,),
                                Text(" Agree with Terms and Conditions",style: TextStyle(fontSize: 13,color:Color(0xff1f2029)),),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h,),
                          Container(
                                width: 88.w,
                               height: 5.h,
                                    margin: EdgeInsets.only(left: 0.5.w),               
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),color:Color(0xff704f38) ),
                               alignment: Alignment.center,
                               child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xffEDEDED)),),
                              ),
                            
                          
                          SizedBox(height: 2.h,),
                          
              ],
              
            ),
            
          ),
          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("already have an account?",style: TextStyle(fontSize: 15,color: Color(0xff1f2029)),),
                           Text("Sign in",style: TextStyle(fontSize: 15,color: Color(0xff704f38)),)
                            ],
                          ),
                          SizedBox(height: 12.h,)
        ],
      ),
    );
  }
}
