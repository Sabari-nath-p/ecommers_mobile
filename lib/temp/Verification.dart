import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(4.w, 5.h, 3.w, 0),
            child: CircleAvatar(
              child: Icon(Icons.arrow_back,color:Color(0xff1f2029) ,),
              backgroundColor: Color(0xffEDEDED),
            ),
          ),
          SizedBox(height: 7.h,),
           Align(
            alignment: Alignment.center,
             child: Container(
              height: 11.h,
                width: 50.h,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("Verify Code",style: TextStyle(fontSize: 7.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),),
                   SizedBox(height: 1.5.h,),
                    Text("Please enter the code we just send to email",style: TextStyle(fontSize: 4.w,color:Color(0xff797979), ),textAlign: TextAlign.center,),
                   
                     Text("example@gmail.com",style: TextStyle(fontSize: 3.w,color: Color(0xff1f2029),),textAlign: TextAlign.center,),
                     
                    
                  ],
                ),
              ),
           ),
           SizedBox(height: 2.7.h,),
            Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.w),
                          child: Container(
                            height: 5.5.h,
                            width: 15.w,
                            margin: EdgeInsets.only(left: 7.w),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),border: Border.all(color: Color(0xff1f2029))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Container(
                            height: 5.5.h,
                            width: 15.w,
                            
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),border: Border.all(color: Color(0xff1f2029))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Container(
                            height: 5.5.h,
                            width: 15.w,
                           
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),border: Border.all(color: Color(0xff1f2029))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Container(
                            height:5.5.h,
                            width: 15.w,
                           
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),border: Border.all(color: Color(0xff1f2029))),
                          ),
                        )
                      ],
                     ),
                     SizedBox(height: 6.h,),
                      Align(
            alignment: Alignment.center,
             child: Container(
              height: 11.h,
                width: 50.h,
                alignment: Alignment.center,
                child: Column(
                  children: [
                   
                    Text("Didn't receive OTP?",style: TextStyle(fontSize: 4.w,color:Color(0xff797979), ),textAlign: TextAlign.center,),
                   
                     Text("Resend Code",style: TextStyle(fontSize: 3.w,color: Color(0xff1f2029),),textAlign: TextAlign.center,),
                     
                    
                  ],
                ),
              ),
           ),
            Padding(
               padding:EdgeInsets.only(left: 5.w),
               child: Container(
                                  width: 88.w,
                                 height: 5.8.h,
                                      margin: EdgeInsets.only(left: 0.5.w),               
                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.w),color:Color(0xff704f38) ),
                                 alignment: Alignment.center,
                                 child: Text("Verify",style: TextStyle(fontSize: 4.w,fontWeight: FontWeight.w500,color: Color(0xffEDEDED)),),
                                ),
             ),

        ],
      ), 
      
    );
  }
}