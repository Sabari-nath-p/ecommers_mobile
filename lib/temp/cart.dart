import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                   padding: EdgeInsets.fromLTRB(3.w, 5.h, 0, 0),
                   child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5.h,
                     child: Row(
                                  children: [
                                   
                                    
                      CircleAvatar(
                        child: Icon(Icons.arrow_back,color:Color(0xff1f2029) ,),
                        backgroundColor: Color(0xffEDEDED),
                      ),
                                  SizedBox(width: 25.w,),
                                    Align(alignment: Alignment.center,
                                     child: Text("My Cart",style: TextStyle(fontSize: 5.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),))
                                    
                                  ],
                                ),
                   ),),
                   SizedBox(height: 2.h,),
                   Container(
                    width: MediaQuery.of(context).size.width,
                    height: 13.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffEDEDED))
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 2.w),
                          height: 11.h,
                          width: 25.w,
                         decoration: BoxDecoration(
                     color: Color(0xffEDEDED),borderRadius: BorderRadius.circular(3.w)
                    ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(1.w, 3.h, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Brown Jacket",style: TextStyle(fontSize: 4.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),textAlign: TextAlign.start),
                              SizedBox(height: 1.5.h,),
                            
                             
                               
                                  
                                
                            
                           
                             Text("Price",style: TextStyle(fontSize: 4.w,fontWeight: FontWeight.w400,color:Color(0xff1f2029) ),textAlign: TextAlign.start,)
                           
                           
                            ],
                          ),
                        ),
                       Expanded(child: Container()),
                      Align(
                        alignment: Alignment.bottomRight,
                         child: Row(
                           children: [
                             Container(
                              decoration: BoxDecoration(color: Color(0xff704f38),borderRadius: BorderRadius.circular(2.w)),
                              child: Icon(Icons.remove,color:Color(0xffEDEDED) ,size: 6.w,)),
                             SizedBox(width:2.w),
                        Text("1",style: TextStyle(fontSize: 5.w,fontWeight: FontWeight.w400,color:Color(0xff1f2029)),),
                        SizedBox(width:2.w),
                       Container(
                        decoration: BoxDecoration(color: Color(0xff704f38),borderRadius: BorderRadius.circular(2.w)),
                        child: Icon(Icons.add,color:Color(0xffEDEDED),size: 6.w,),),
                          SizedBox(width: 4.w,),
                           SizedBox(height: 6.h)
                           ],
                         ),
                       ),
                      
                      
                      ],
                    ),
                   )
          ],
        ),
      
    );
  }
}