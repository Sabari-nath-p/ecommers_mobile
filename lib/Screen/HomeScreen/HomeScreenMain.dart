import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({super.key});

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.only(left: 3.5.w),
            child: Column(
              children: [
                     Align(
                      alignment: Alignment.topLeft,
                      child: Text("Location",style: TextStyle(fontSize: 2.h,color:Color(0xff797979)),textAlign: TextAlign.left,)),
                      Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text("New York,USA",style: TextStyle(fontSize: 2.h,fontWeight: FontWeight.w500,color:Color(0xff1f2029) ),),
              Icon(Icons.arrow_drop_down),
              Expanded(child: Container()),
              CircleAvatar(
                radius: 4.w,
                backgroundColor: Colors.white,
                child: Icon(Icons.notifications,color:Color(0xff704f38) ,),
              )
                        ],
                      ),
                      SizedBox(height: 2.h,),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Container(
                             
                       
                      height: 5.h,
                      width: 85.w,
                      child: 
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                   prefixIcon: Icon(Icons.search),
                                      labelText: ("Search"),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.w),borderSide: BorderSide(color:Color(0xff797979)),
                                      ),
                                    ),
                            
                          ),
                         ),
                    SizedBox(width: 2.w,),
                     Container(
                            height: 3.h,
                            width: 7.w,
                          
                            child: Icon(Icons.sort_sharp,color: Color(0xff704f38) ,),
                            
                          )
              ],
            ),
          ),
          SizedBox(height: 2.h,),
           Align(
            alignment: Alignment.topLeft,
             child: Column(
               children: [
                 Container(
                  width: 90.w,
                  height: 20.h,
                  color:Color(0xff797979) ,
                 ),
               SizedBox(height: 2.h,),
                   Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Category",style: TextStyle(fontSize:2.5.h,fontWeight: FontWeight.w600,color:Color(0xff1f2029)),textAlign: TextAlign.left,),
                          Expanded(child: Container()),
                           Text("See All",style: TextStyle(fontSize:2.h,fontWeight: FontWeight.w500,color:Color(0xff1f2029)),textAlign: TextAlign.right,),
                           SizedBox(width: 2.w,)
                        ],
                      )),
                      SizedBox(height: 2.h,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 14.w,
                          height: 10.h,
                          
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 6.w,
                                backgroundColor:Color(0xff797979) ,
                                child: SizedBox(height: 5.h,
                                width: 10.w,
                                  child: Image.network("https://i.pinimg.com/originals/cd/94/98/cd9498941f55b6426730934b63644d90.png",)),
                              ),
                              SizedBox(height: 0.5.h,),
                              Text("Tshirt",style: TextStyle(fontSize: 2.h,fontWeight: FontWeight.w600,color: Color(0xff1f2029)),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Flash Sale",style: TextStyle(fontSize: 2.5.h,fontWeight: FontWeight.w600,color: Color(0xff1f2029)),),
                      ),
                    SizedBox(height: 1.h,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 9.h,
                        height: 4.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.all(color: Color(0xff1f2029))),
                        child: Text("All",style: TextStyle(fontSize: 2.h,fontWeight: FontWeight.w600,color: Color(0xff1f2029))),
                      ),
                    )
               ],
             ),
           )   
           
              ],
            ),
       ),
          
             
        ],
      ),
    );
  }
}