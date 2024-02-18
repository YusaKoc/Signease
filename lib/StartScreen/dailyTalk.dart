import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DailyTalk extends StatelessWidget {
  const DailyTalk({Key? key});

  @override
  Widget build(BuildContext context) {
    return GunlukYasam();
  }
}

class GunlukYasam extends StatefulWidget {
  GunlukYasam({Key? key});

  @override
  State<GunlukYasam> createState() => _GunlukYasamState();
}

class _GunlukYasamState extends State<GunlukYasam> {
  bool _isSearching = false;
  String _searchText = '';

  final List<Map<String, String>> cards = [
    {"title": "Hello", "route": "/videoHello","image":"hello.png"},
    {"title": "I'm hearing impaired", "route": "/videoHearMe","image":"sunny.jpg"},
    {"title": "How are you ?", "route": "/videoHrY","image":"moon.png"},
    // Buraya istediğiniz kadar kart ekleyebilirsiniz
  ];

  @override
  Widget build(BuildContext context) {

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

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 203, 233, 255),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: _isSearching
              ? TextField(
            onChanged: (searchResult) {
              setState(() {
                _searchText = searchResult;
              });
            },
            decoration: InputDecoration(
              hintText: "Type or speak to search",
            ),
          )
              : Padding(
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
          actions: [
            _isSearching
                ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: IconButton(
              icon: Icon(Icons.cancel),
              color: Colors.grey,
              onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _searchText = '';
                  });
              },
            ),
                )
                : Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey,
              onPressed: () {
                  setState(() {
                    _isSearching = true;
                  });
              },
            ),
                ),
          ],
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 55, 170, 253),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                onPressed: (){},
                child: Padding(
                  padding: const EdgeInsets.only(right: 45.0,left: 45.0,top: 5.0,bottom: 5.0),
                  child: Text("Daily Conversation\n       Sentences",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white, // Metin rengi
                  ),
              ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
                height: 2, // Çizgi kalınlığı
                width: 5000, // Çizgi uzunluğu
                color: Color.fromARGB(255, 22, 84, 183), // Çizgi rengi
              ),
            ),

            SizedBox(
              width: 500,
              height: 350,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildCards(),
              ),
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

  List<Widget> _buildCards() {
    List<Widget> cardWidgets = [];

    for (var cardInfo in cards) {
      if (_searchText.isEmpty ||
          cardInfo["title"]!.toLowerCase().contains(_searchText.toLowerCase())) {
        cardWidgets.add(
          GestureDetector(
            onTap: () {
              GoRouter.of(context).replace(cardInfo["route"]!);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0,),
              child: Container(
                width: 300,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                      color: Color.fromARGB(255, 150, 203, 255),
                      width: 12,
                    )
                  ),
                  shadowColor: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            cardInfo["title"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color.fromARGB(255, 22, 84, 183),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Container(
                              height: 2,
                              width: 250,
                              color: Color.fromARGB(255, 22, 84, 183),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(child: Image.asset("assets/${cardInfo["image"]}"!),width: 150,height: 150,),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return cardWidgets;
  }
}
