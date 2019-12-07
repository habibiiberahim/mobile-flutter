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
        new HomePage(),
        new TransportationPage(),
        new DestinationPage(),
        new InformationPage(),

    ];

    @override
    Widget build(BuildContext context){
        return new Scaffold(
            body: _container [ _bottomNavCurrentIndex],
            bottomNavigationBar: _buildBottomNavigation(),
        );
    }

    Widget _buildBottomNavigation(){
    return new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index){
            setState(() {
                _bottomNavCurrentIndex = index;
            });
        },
        
        currentIndex: _bottomNavCurrentIndex,
        
        items: [
            BottomNavigationBarItem(
                activeIcon: new Icon(
                    Icons.home,
                    color: TrainPallete.blue    ,

                ),
                icon: new Icon (
                    Icons.home,
                    color: Colors.grey,
                ),
                title: new Text(
                    'Beranda'
                )
            ),

            BottomNavigationBarItem(
                activeIcon: new Icon(
                    Icons.airport_shuttle,
                    color: TrainPallete.blue,
                ),
                icon: new Icon (
                    Icons.airport_shuttle,
                    color: Colors.grey,
                ),
                title: new Text(
                    'Transportasi'
                )
            ),

            BottomNavigationBarItem(
                activeIcon: new Icon(
                    Icons.place,
                    color: TrainPallete.blue,
                ),
                icon: new Icon (
                    Icons.place,
                    color: Colors.grey,
                ),
                title: new Text(
                    'Destinasi'
                )
            ),

            BottomNavigationBarItem(
                activeIcon: new Icon(
                    Icons.message,
                    color: TrainPallete.blue,
                ),
                icon: new Icon (
                    Icons.message,
                    color: Colors.grey,
                ),
                title: new Text(
                    'Informasi'
                )
            ),


        ],
    );
  }
}
