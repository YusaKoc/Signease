import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StartCompanents();
  }
}

class StartCompanents extends StatefulWidget {
  const StartCompanents({super.key});

  @override
  State<StartCompanents> createState() => _StartCompanentsState();
}

class _StartCompanentsState extends State<StartCompanents> {

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Text('Main Page'),
    Text('Profile'),
    Text('Share'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(115.0),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Image.asset(
                  "assets/signeaselogo.png",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("assets/hands.jpg"),
                Column(
                  children: [
                    Text("ABOUT US",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Doctor correct motherhood busy tea success pack jealousy row suspicion population end overcome cold bone general metal stock feather shorten want chance slos machine politics objectican defeat ",style: TextStyle(color: Colors.white),),
                    ),

                  ],
                ),


              ],
            ),
            Image.asset("assets/speechtotext.png"),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    color: Color.fromARGB(255, 143, 218, 255),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15,right: 15,top: 10),
                          child: ElevatedButton(
                              child: Text("Daily Sign Languages",style: TextStyle(color: Colors.greenAccent,),),
                              onPressed: (){
                                GoRouter.of(context).replace("/dailyTalk");


                              },
                            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

                          ),
                        ),
                        Image.asset("assets/13.png",width: 100,),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    color: Color.fromARGB(255, 167, 241, 136),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:29,right: 29,top: 10),
                          child: ElevatedButton(
                            child: Text("Sign Albhabet",style: TextStyle(color: Colors.blue,),),
                            onPressed: (){

                            },
                            style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 121, 234, 72),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        Image.asset("assets/14.png",width: 100,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Shares',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}


