import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderSucess extends StatefulWidget {
  const OrderSucess({super.key});

  @override
  State<OrderSucess> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<OrderSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height ,
             
               child: Padding(
                 padding: EdgeInsets.only(top: 25.h),
                 child: SizedBox(
                   child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        CircleAvatar(radius: 15.w,backgroundColor: Color(0xff704f38),
                          child: Icon(Icons.check,size: 12.h,color: Color(0xffEDEDED),),
                         
                        ),
                        SizedBox(height: 2.h,),
                          Text("Your Order got sucessfully!",style: TextStyle(fontSize: 6.8.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),),
                   SizedBox(height: 1.h,),
                    Text("Thank you for your purchase",style: TextStyle(fontSize: 4.w,color:Color(0xff797979), ),textAlign: TextAlign.center,),
                  
                      ],
                    ),
                   ),
                 ),
               ),
              
             ),
           Align(
            alignment: Alignment.center,
             child: Container(
              
                height: 10.h,
                width: 55.w,
                alignment: Alignment.center,
                child: Column(
                  children: [
                   ],
                ),
              ),
           ),
          Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
             width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color :Color(0xffEDEDED), 
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),) ,
              child: Padding(
               padding:EdgeInsets.only(left: 2.5.w),
               child: Column(
                 children: [
                  SizedBox(height: 3.h,),
                  
                     Column(
                       children: [
                         Container(
                                            width: 88.w,
                                           height: 5.8.h,
                                                  
                                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.w),color:Color(0xff704f38) ),
                                           alignment: Alignment.center,
                                           child: Text("View Order",style: TextStyle(fontSize: 4.w,fontWeight: FontWeight.w500,color: Color(0xffEDEDED)),),
                                          ),
                                          SizedBox(height: 3.h,),
                                            Text("View E-reciept",style: TextStyle(fontSize: 3.5.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),),
                       ],
                     ),
                   
                 ],
               ),
             ),
            
            )
             
                )
          )
        ],
      ),
    );
  }
}