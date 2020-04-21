import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class NavigationService 
{
    GlobalKey<NavigatorState> navKey;

    static NavigationService instance = NavigationService();

    NavigationService(){
      navKey = GlobalKey<NavigatorState>();
    }

    Future<dynamic> navigateToreplacement(String _routeName)
    {
       return navKey.currentState.pushReplacementNamed(_routeName);
    }

    Future<dynamic> navigateTo(String _routeName)
    {
       return navKey.currentState.pushNamed(_routeName);
    }

     Future<dynamic> navigateToPageroute(MaterialPageRoute _pageRoute)
    {
       return navKey.currentState.push(_pageRoute);
    }

    bool goBack()
    {
       return navKey.currentState.pop();
    }
}