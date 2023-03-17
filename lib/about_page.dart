import 'package:flutter/material.dart';

class About_Page extends StatelessWidget {
  const About_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: new AppBar(
        backgroundColor: Colors.orange[300],
        title: new Text("Halaman About"),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(5.0),),
            Text(
              "Meows Apps",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Image.asset(
              'image/logo.png',
              height: 150,
              width: 150,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Card(
              elevation: 5,
              child: Row(children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 160,
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'Meows adalah aplikasi yang dibuat untuk .... , dan dibuat oleh ....',
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
