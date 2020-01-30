import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/destination/home_view.dart';
import 'package:flutter_app/destination/information_view.dart';
import 'package:flutter_app/destination/transportation_view.dart';
import 'package:flutter_app/destination/destination_view.dart';

class LandingPage extends StatefulWidget{

    @override
    _LandingPageState createState() => new _LandingPageState();

}

class _LandingPageState extends State<LandingPage>{
    int _bottomNavCurrentIndex = 0 ;
    List<Widget> _container = [
         HomePage(),
         TransportationPage(),
         DestinationPage(),
         InformationPage(),

    ];

    @override
    Widget build(BuildContext context){
        

        return  Scaffold(
            body: _container [ _bottomNavCurrentIndex],
            bottomNavigationBar: _buildBottomNavigation(),
        );
    }

    Widget _buildBottomNavigation(){
    return  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index){
            setState(() {
                _bottomNavCurrentIndex = index;
            });
        },
        
        currentIndex: _bottomNavCurrentIndex,
        
        items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.home,
                    color: TrainPallete.blue    ,

                ),
                icon:  Icon (
                    Icons.home,
                    color: Colors.grey,
                ),
                title:  Text(
                    'Beranda'
                )
            ),

            BottomNavigationBarItem(
                activeIcon:  Icon(
                    Icons.airport_shuttle,
                    color: TrainPallete.blue,
                ),
                icon:  Icon (
                    Icons.airport_shuttle,
                    color: Colors.grey,
                ),
                title:  Text(
                    'Transportasi'
                )
            ),

            BottomNavigationBarItem(
                activeIcon:  Icon(
                    Icons.place,
                    color: TrainPallete.blue,
                ),
                icon:  Icon (
                    Icons.place,
                    color: Colors.grey,
                ),
                title:  Text(
                    'Destinasi'
                )
            ),

            BottomNavigationBarItem(
                activeIcon:  Icon(
                    Icons.message,
                    color: TrainPallete.blue,
                ),
                icon:  Icon (
                    Icons.message,
                    color: Colors.grey,
                ),
                title:  Text(
                    'Informasi'
                )
            ),


        ],
    );
  }
}
