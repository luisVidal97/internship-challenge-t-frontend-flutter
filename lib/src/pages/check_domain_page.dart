import 'package:flutter/material.dart';
import 'package:internship_challenge_t_frontend_flutter/src/provider/Domain_provider.dart';

class CheckDomainPage extends StatefulWidget {
  @override
  _CheckDomainPageState createState() => _CheckDomainPageState();
}

class _CheckDomainPageState extends State<CheckDomainPage> {
  String _domain = '';
  DomainProvider domainProvider = new DomainProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check domain!"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _domainInput(),
          Divider(),
          _buttonCheck(),
          Divider(),
        ],
      ),
    );
  }

  Widget _domainInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      //relacionar la prioridad con un controlador para tener acceso a él
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('letters ${_domain.length}'),
        hintText: 'google.com',
        labelText: 'Domain',
        helperText: 'Ex: google.com',
        suffixIcon: Icon(Icons.dns),
        icon: Icon(Icons.account_circle),
      ),
      // onChange recibe el valor que esta escribiendo en el input
      // y luego se intercambia en la función
      onChanged: (valor) {
        // siempre que se haga un cambio para redibujar algo
        // se tiene que colocar el setState
        setState(() {
          _domain = valor;
        });
      },
    );
  }

  Widget _buttonCheck() {
    return RaisedButton(
      child: Text('Check domain'),
      color: Colors.blue[900],
      textColor: Colors.white,
      shape: StadiumBorder(),
      onPressed: () => {_futureDomain()},
    );
  }

  void _futureDomain() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return FutureBuilder(
              future: domainProvider.getDomain(_domain),
              builder: (BuildContext context, AsyncSnapshot snapShot) {
                if (snapShot.hasData) {
                  print(snapShot.data);
                  Map<String, dynamic> response = snapShot.data;
                  if (response.containsKey("Error")) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text('Error'),
                      content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(response["Error"]),
                            FlutterLogo(size: 100)
                          ]),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  } else {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text(_domain),
                      content: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Title: " + response["Title"],
                              style: TextStyle(fontSize: 10),
                            ),
                            Divider(),
                            Text("Logo: " + response["Logo"],
                                style: TextStyle(fontSize: 10)),
                            Text(
                                "Server changes: " +
                                    response["ServersChange"].toString(),
                                style: TextStyle(fontSize: 10)),
                            Divider(),
                            Text("SSLGrade: " + response["SSLGrade"],
                                style: TextStyle(fontSize: 10)),
                            Divider(),
                            Text(
                                "Previous SSLGrade: " +
                                    response["PreviousSSLGrade"],
                                style: TextStyle(fontSize: 10)),
                          ]),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  }
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Wait a moment, please.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  );
                }
              });
        });
  }
}
