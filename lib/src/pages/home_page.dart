import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Internship T Apis'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Check Domain'),
              leading: Icon(
                Icons.youtube_searched_for,
                color: Colors.blue[900],
              ),
              trailing:
                  Icon(Icons.keyboard_arrow_right, color: Colors.blue[900]),
              //método que sirve para hacer la navegación
              onTap: () {
                Navigator.pushNamed(context, '/checkDomain');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Consulting Domains'),
              leading: Icon(
                Icons.query_builder,
                color: Colors.blue[900],
              ),
              trailing:
                  Icon(Icons.keyboard_arrow_right, color: Colors.blue[900]),
              //método que sirve para hacer la navegación
              onTap: () {
                Navigator.pushNamed(context, "/Consults");
              },
            ),
            Divider(),
          ],
        ));
  }
}
