import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          
          title: const Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          iconTheme: const IconThemeData(color: Colors.black54), 
          

        systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness:  Brightness.dark  
        ),
        actions: <Widget> [
           IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
        ),
        body: _buildBody(),
        
      ),
    );
  }
} 

Widget _buildBody() {
        return SingleChildScrollView( 
          child: Column(
              children: <Widget> [ 
                  _headerImage(),
                  SafeArea(
                    child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _weatherDescription(),
                        const Divider(),
                        _temperature(),
                        const Divider(),
                        _temperatureForecast(),
                        const Divider(), 
                        _footerRatings()
                      ],
                    ),
                  ))
              ],
          ) ,
          
          );
}

Image _headerImage(){
  return const Image(
    image: NetworkImage('https://images.unsplash.com/photo-1527668752968-14dc70a27c95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3dpc3N8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
    fit: BoxFit.cover,
    );
}

Column _weatherDescription(){
  return const Column (
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text('Thuesday - May 22', style:  TextStyle(
        fontSize: 32, 
        fontWeight: FontWeight.bold
      ),
      ),
      Divider(),
      Text('The weather today is a topic of great interest, as it plays a significant role in our daily lives. Currently, the sun is shining brightly in the clear blue sky, and there is not a cloud in sight.', style: TextStyle(color: Colors.black54),)
    ],
  );
}

Row _temperature(){
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ), 
    ],
      ),
            SizedBox(width: 16.0,),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('15* Clear', 
                  style: TextStyle(color: Colors.deepPurple),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                Text('London, England', 
                   style: TextStyle(color: Colors.black54),
                  ),
                ],
              )
            ],
          )
        ],
      );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: 
      List.generate(8, (int index){
        return Chip(
          label: Text(
            '${index + 20}*C',
            style: const TextStyle(fontSize: 15.0),
            ),
            avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
              side: const BorderSide(color: Colors.grey)
            ),
            backgroundColor: Colors.grey.shade100,
        );
      })
    
  );
}

Row _footerRatings(){
      var stars = Row (
        mainAxisSize: MainAxisSize.min,
        children: <Widget> [
          Icon(Icons.star, size: 15.0, color: Colors.yellow[600],),
          Icon(Icons.star, size: 15.0, color: Colors.yellow[600],),
          Icon(Icons.star, size: 15.0, color: Colors.yellow[600],),
          Icon(Icons.star, size: 15.0, color: Colors.black),
          Icon(Icons.star, size: 15.0, color: Colors.black ),

         ],
        );
      return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
          'info about yu and me about you', 
          style: TextStyle(fontSize: 15.0),
          ), 
        stars,
        ],
      ); 
}