import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Model/UpdateModel.dart';

class MessageUpdate extends StatelessWidget {

  final UpdateModel data;

  MessageUpdate({super.key,required this.data});

  List<String> msges = [
    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ',
    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است',
    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است',
    // 'لورم ایپسوم متن ساختگی با',
    // 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده',
    // 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ',
    // 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز'
  ];

  Pop(bool didPop) async {

    print('didPop =========>>>>>>> $didPop');

    if(!didPop){

    }

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: Pop,
      canPop: !(data.force),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)
        ),
        constraints: BoxConstraints(
            maxWidth: 0.8.sw,
            maxHeight: 0.8.sh
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(

            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Container(
                  width: 80.w,height: 80.w,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.7)
                  ),
                  child: Image.asset(
                      'assets/png/update.png',
                      alignment: Alignment.center,fit: BoxFit.contain).animate(
                    effects: [
                      ScaleEffect(begin: Offset(0.0, 0.0),end: Offset(1.0, 1.0),delay: 700.ms,duration: 500.ms,alignment: Alignment.center)
                    ] ,
                  )
              ),

              Flexible(
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      SizedBox(height: 10.h),

                      Center(
                        child: Container(
                          child: Text( data.force ? 'به روز رسانی اجباری' : 'به روز رسانی اختیاری',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: data.force ? Colors.red : Colors.indigo
                              )),
                          padding: EdgeInsets.all(7),
                          color: Colors.white54,
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: Divider(color: Colors.white,thickness: 1)),
                          SizedBox(width: 5.w),
                          Text('لیست تغییرات نسخه ${data.version}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white
                            )),
                          SizedBox(width: 5.w),
                          Expanded(child: Divider(color: Colors.white,thickness: 1)),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      Flexible(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                           mainAxisSize: MainAxisSize.min,
                            children: [

                             for(int index=0;index < msges.length;index++)
                               CartInfo(index: index+1, msg: msges.elementAt(index))

                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            ElevatedButton(
                              onPressed: (){

                                // Navigator.of(context).pop('return');

                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('تایید',style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )),
                                  SizedBox(width: 5),
                                  Image.asset('assets/emoji/ok.png',width: 30,height: 30)
                                ],
                              ),
                              style: ButtonStyle(
                                fixedSize: WidgetStateProperty.all(Size.fromWidth(100.w)),
                                backgroundColor: WidgetStateProperty.all(Colors.green),
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                              ),
                            ),

                            SizedBox(width: 20.w),

                            ElevatedButton(
                              onPressed: (){

                                if(data.force)
                                  SystemNavigator.pop();

                                else
                                  Navigator.of(context).pop('cancel');

                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('انصراف',style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  )),
                                  SizedBox(width: 5),
                                  Image.asset('assets/emoji/cancel.png',width: 30,height: 30)
                                ],
                              ),
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Colors.blue),
                                fixedSize: WidgetStateProperty.all(Size.fromWidth(100.w)),
                                padding: WidgetStateProperty.all(EdgeInsets.zero),
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 10.h),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ).animate(
        effects: [
          ScaleEffect(begin: Offset(0.0, 0.0),end: Offset(1.0, 1.0),duration: 500.ms,alignment: Alignment.center)
        ] ,
      ),
    );
  }
}



class CartInfo extends StatelessWidget {

  final int index;

  final String msg;

  const CartInfo({super.key,required this.index,required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      padding: EdgeInsets.symmetric(
          horizontal: 7
      ),
      margin: EdgeInsets.symmetric(
          vertical: 10.h
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        mainAxisSize: MainAxisSize.max,
        children: [

          Container(
            child: Text('$index',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.black,
                      )
                    ]
                )),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: 0,
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer
                  )
                ]
            ),
          ),

          SizedBox(width: 5.w),

          Flexible(child: Text(msg,textAlign: TextAlign.right))

        ],
      ),
    );
  }
}
