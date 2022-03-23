import 'package:flutter/material.dart';
import 'package:informe/widgets/common/gradient_icon.dart';
import 'package:informe/widgets/common/under_construction.dart';
import 'package:informe/widgets/home/logout_button.dart';
import 'package:informe/widgets/home/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle = ;
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 3: Settings',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161D3A),
      body: Column(
        children: const [
          Profile(
              studentId: "63130500237",
              firstname: "Kasemtan",
              lastname: "Tevasirichokchai",
              banchelor: "Computer Science",
              picture:
                  "https://scontent.fbkk22-3.fna.fbcdn.net/v/t39.30808-6/272189473_4868661459916486_3850036912764138839_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeElZlkqRCrMjXY7KJb7Yb1Jzyyi7l8sybHPLKLuXyzJsfdZcIWA3QUMEJ8EbN5XslrmXaXJOtau9zTdbZ5VDr56&_nc_ohc=DLT826L3jUEAX8mKSMV&_nc_ht=scontent.fbkk22-3.fna&oh=00_AT9dO8tWEO-_YL8jdC0ngBCmmCqOeADNjgjN3tVsT57ZuA&oe=62408F18"),
          LogoutButton(),
          SizedBox(
            height: 20,
          ),
          UnderConstruction()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? GradientIcon(
                    Icons.home,
                    35,
                    const LinearGradient(
                      colors: <Color>[
                        Colors.red,
                        Colors.yellow,
                        Colors.blue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  )
                : const Icon(
                    Icons.home,
                    size: 25,
                  ),
            label: 'Home',
            backgroundColor: const Color(0xFF373853),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_comfy),
            label: 'Business',
            backgroundColor: const Color(0xFF373853),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: const Color(0xFF373853),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: const Color(0xFF373853),
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        selectedIconTheme: IconThemeData(),
        onTap: _onItemTapped,
      ),
    );
  }

  // Color getColor(int index) {
  //   switch (index) {
  //     case 0:
  //     return
  //     case 1:
  //       break;
  //     case 2:
  //       break;
  //     case 3:
  //       break;
  //     default:
  //   }
  // }
}
