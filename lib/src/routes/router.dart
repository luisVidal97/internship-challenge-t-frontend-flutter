import 'package:flutter/material.dart';
import 'package:internship_challenge_t_frontend_flutter/src/pages/check_domain_page.dart';
import 'package:internship_challenge_t_frontend_flutter/src/pages/consult_domains_page.dart';
import 'package:internship_challenge_t_frontend_flutter/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    '/checkDomain': (BuildContext context) => CheckDomainPage(),
    '/Consults': (BuildContext context) => ConsultDomainsPage(),
  };
}
