import 'package:flutter/material.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';

import 'model/TravelModel.dart';
import 'package:expandable_text/expandable_text.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi, no country code
      ],
      theme: ThemeData(
        fontFamily: 'IranSans',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'IranSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          headline2: TextStyle(
            fontFamily: 'IranSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color.fromRGBO(190, 21, 9, 1),
          ),
          headline3: TextStyle(
            fontFamily: 'IranSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.green,
          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _mainIndex = 0;
  double imageSize = 60;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: size.height / 1.8,
              child: Stack(
                children: [
                  // bg image ///////////////////
                  Container(
                    width: double.infinity,
                    height: size.height / 2.1,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(65),
                          bottomRight: Radius.circular(65)),
                      image: DecorationImage(
                        image: AssetImage(travelList[_mainIndex].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //Head icon///////////////////
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(124, 255, 255, 255),
                          ),
                          child: const Icon(
                            CupertinoIcons.heart,
                            size: 30,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(124, 255, 255, 255),
                          ),
                          child: const Icon(
                            CupertinoIcons.right_chevron,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //list Image Select Right///////////////////
                  Positioned(
                    right: 0,
                    top: 80,
                    child: SizedBox(
                      width: 90,
                      height: double.maxFinite,
                      child: ListView.builder(
                        itemCount: travelList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _mainIndex = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3, color: Colors.white),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(travelList[index].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    width: _mainIndex == index
                                        ? imageSize + 15
                                        : imageSize,
                                    height: _mainIndex == index
                                        ? imageSize + 15
                                        : imageSize,
                                    duration: Duration(milliseconds: 500),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  //   Name  &&&& Location ///////////////////
                  Positioned(
                    bottom: 100,
                    left: size.width / 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          travelList[_mainIndex].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IranSans',
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.placemark_fill,
                              color: Colors.white,
                            ),
                            Text(
                              travelList[_mainIndex].location,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'IranSans',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            )),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  "فاصله",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'IranSans',
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Text(
                                    travelList[_mainIndex].distance + "KM",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'IranSans',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            )),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  "آب و هوا",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'IranSans',
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Text(
                                    travelList[_mainIndex].temp + "C",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'IranSans',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Color.fromARGB(60, 0, 0, 0),
                              width: 1,
                            )),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  "امتیاز",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'IranSans',
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  child: Text(
                                    travelList[_mainIndex].rating,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'IranSans',
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Discription//////////////////////////////

                  Column(

                    children: const [

                      Padding(


                        padding: EdgeInsets.all(8.0),
                        child: Text(
                         "توضیحات : ",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IranSans',
                            fontSize: 15,

                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ExpandableText(
                          'بخش «مسیر یادگیری» در تلاش است تا از پیچیدگی فرایند آموزشی کاسته و مسیر روشنی را برای طی کردن دوره‌های آموزشی در اختیار شما قرار دهد. هر کدام از مسیرهای یادگیری، از نقطه صفر شروع شده و شما را تا پیشرفته شدن همراهی می‌کند. پیش رفتن با هر قدم از این مسیر می‌تواند دید بسیار خوبی به شما از فرایند آموزشی و میزان پیشرفت خودتان را ارائه دهد. بخش «مسیر یادگیری» در تلاش است تا از پیچیدگی فرایند آموزشی کاسته و مسیر روشنی را برای طی کردن دوره‌های آموزشی در اختیار شما قرار دهد. هر کدام از مسیرهای یادگیری، از نقطه صفر شروع شده و شما را تا پیشرفته شدن همراهی می‌کند. پیش رفتن با هر قدم از این مسیر می‌تواند دید بسیار خوبی به شما از فرایند آموزشی و میزان پیشرفت خودتان را ارائه دهد. ',
                          expandText: 'مشاهده بیشتر',
                          collapseText: 'مشاهده کمتر',
                          maxLines: 1,
                          linkColor: Colors.blue,
                        ),
                      ),

                    ],
                  ),


                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Padding(
                         padding: const EdgeInsets.fromLTRB(20,0,0,0),
                         child: Container(
                           width: 85,
                           height: 85,
                           decoration: const BoxDecoration(
                             shape: BoxShape.circle,
                             color: Color.fromARGB(500, 0, 0, 0),
                           ),
                           child: const Icon(
                             CupertinoIcons.left_chevron,
                             color: Colors.white,
                             size: 50,
                           ),
                         ),
                       ),
                       Container(
                         child: Column(
                           children: [
                             const Text(
                               "قیمت :",
                               style: TextStyle(
                                 color: Colors.black54,
                                 fontWeight: FontWeight.bold,
                                 fontFamily: 'IranSans',
                                 fontSize: 15,
                               ),
                             ),
                             Padding(
                               padding:
                               const EdgeInsets.fromLTRB(0, 5, 0, 0),
                               child: Text(
                                 travelList[_mainIndex].price+ "تومان",
                                 style: const TextStyle(
                                   color: Colors.blue,
                                   fontWeight: FontWeight.bold,
                                   fontFamily: 'IranSans',
                                   fontSize: 20,
                                 ),
                               ),
                             ),
                           ],
                         ),

                       ),

                     ],

                      ),
                    ],
                  )

                ],
              ),

            ),
          ],
        ),
      ),
    ));
    throw UnimplementedError();
  }
}
