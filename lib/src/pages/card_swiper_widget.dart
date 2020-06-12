import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> domains;

  //constructor en el cual la lista de pelis es obligatoria
  CardSwiper({@required this.domains});

  @override
  Widget build(BuildContext context) {
    //da informacion del tamano del dispositivo
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      height: _screenSize.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        //esto quiere decir que usa todo el ancho posible,el 70% del screen
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: _screenSize.height * 0.1,
                    ),
                    Text(
                      "Domain ID: \n" + domains[index]["ID"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    Text(
                      "Domain: \n" + domains[index]["Domain"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    Text(
                      "Date: \n" + domains[index]["CheckedAt"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ));
        },
        itemCount: domains.length,
        //pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
