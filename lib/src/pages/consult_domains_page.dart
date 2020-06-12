import 'package:flutter/material.dart';
import 'package:internship_challenge_t_frontend_flutter/src/pages/card_swiper_widget.dart';
import 'package:internship_challenge_t_frontend_flutter/src/provider/Domain_provider.dart';

class ConsultDomainsPage extends StatelessWidget {
  final DomainProvider domainProvider = new DomainProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registries'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _getRegistries(),
          ],
        ),
      ),
    );
  }

  Widget _getRegistries() {
    return FutureBuilder(
        future: domainProvider.getConsult(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return CardSwiper(domains: snapshot.data);
          } else {
            return Container(
              height: 400.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
