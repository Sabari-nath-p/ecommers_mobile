import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h,),
           Padding(
                   padding: EdgeInsets.fromLTRB(3.w, 5.h, 0, 0),
                   child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5.h,
                     child: Row(
                                  children: [
                                   
                                    
                      CircleAvatar(
                        child: Icon(Icons.arrow_back,color:Color(0xff1f2029,) ,),
                        backgroundColor: Color(0xffEDEDED),
                      ),
                                  SizedBox(width: 25.w,),
                                    Align(alignment: Alignment.center,
                                     child: Text("Search",style: TextStyle(fontSize: 5.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),))
                                   
        ],
      ),
      ),),
      SizedBox(height: 2.h,),
      Padding(padding: EdgeInsets.only(left:6.w),
              child: SizedBox(
                width: 88.w,
                height: 6.h,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: ("Search"),
                          border: 
                          OutlineInputBorder(borderRadius: BorderRadius.circular(9.w),)
                        ),
                           ),
              ),
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 7.w),
                    child: Text("Result for jackets",style: TextStyle(fontSize: 5.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),),
                  ),
                  Expanded(child: Container()),
                  Text("6542 founds",style: TextStyle(fontSize: 5.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),),
                  SizedBox(width: 3.w,)
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20.h,
                        width: 40.w,
                        margin: EdgeInsets.only(top: 5.h),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w),color: Color(0xffEDEDED)),
                      ),
                      SizedBox(height: 1.h,),
                      Row(
                        children: [
                          Text("Brown Jacket",style: TextStyle(fontSize: 3.5.w,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),textAlign: TextAlign.start),
                          SizedBox(width: 6.w,),
                          Icon(Icons.star,size: 4.w,color: Color(0xff797979),),
                          Text("4.3",style: TextStyle(fontSize: 3.5.w,fontWeight: FontWeight.w500,color:Color(0xff797979) ))
                        ],
                      ),
                              SizedBox(height: 1.h,),
                            Text("Price",style: TextStyle(fontSize: 4.w,fontWeight: FontWeight.w700,color:Color(0xff1f2029) ),textAlign: TextAlign.start,)
                           
                    ],
                  ),
                  
                ),
              ),
               
      ],)
    );
  }
}