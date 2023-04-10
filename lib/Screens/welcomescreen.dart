import 'package:flutter/material.dart';
import 'package:ThiruvalluvarGPT/Screens/items.dart';
import 'package:ThiruvalluvarGPT/main/chatgpt/view/chatgpt_page.dart';





class WelcomeScreen extends StatefulWidget {


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> {



  List<Widget> slides = items
      .map((item) => Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Image.asset(
              item['image'],
              fit: BoxFit.fitWidth,
              width: 220.0,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  Text(item['header'],
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.yellowAccent,
                          height: 2.0)),
                  Text(
                    item['description'],
                    style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.2,
                        fontSize: 16.0,
                        height: 1.3),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60.0,),




                ],
              ),
            ),
          )
        ],
      )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
          (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: currentPage.round() == index
                ? Colors.yellow
                : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0)),
      ));

  double currentPage = 0.0;
  final _pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void _navigateToChatGptPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatGptPage.create()),
      );
    }
    return Scaffold(
      body: Container(
       color:Colors.black,
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                return slides[index];
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicator(),

                  ),
                )
              //  ),
            ),
            // )
            Align(
                alignment: Alignment.bottomCenter,

              child:Container(
                  margin: EdgeInsets.only(top: 50.0),
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                child: ElevatedButton(

                  style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(Colors.yellow),
                   ),
                   onPressed: _navigateToChatGptPage,
                   child: Text("Get Started",style: TextStyle(color:Colors.black),),),
              ),
            )

          ],
        ),
      ),
    );
  }
}