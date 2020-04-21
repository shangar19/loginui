import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginui/services/nav_services.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  @override
  bool _tabed = false;

  void initState()
  {
     super.initState();
     _tabed = false;
  }

  void dispose()
  {
     super.dispose();
      _tabed = false;
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: MediaQuery.of(context).size.height / 4 * 0.45,
              ),
              header_image(context)
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 50.0),
              title(),
              SizedBox(
                height: 10.0,
              ),
              subtitle(),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: fbButton(context),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: _signUpbutton(context),
              ),
              SizedBox(
                height: 25.0,
              ),
              socialLoginButtons(),
              SizedBox(
                height: 20.0,
              ),
              _loginAccountLabel(),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        )
      ]),
    ));
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              NavigationService.instance.navigateTo("Login");
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: Color(0xff2f30e8),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget socialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _twitterUpbutton(),
        SizedBox(
          width: 12.0,
        ),
        _googleUpbutton(),
        SizedBox(
          width: 12.0,
        ),
        _linkedInUpbutton()
      ],
    );
  }

  Widget _signUpbutton(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _tabed = true;
        });
        NavigationService.instance.navigateTo("Register");
      },
          child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: _tabed == true ? Color(0xff2f30e8) : Colors.black45, width: 2),
          ),
          child: Text(
            'Sign Up Nox',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          )),
    );
  }

  Widget _googleUpbutton() {
    return Container(
        width: 30,
        height: 30.0,
        padding: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xffde5246)),
        child: Icon(
          FontAwesomeIcons.google,
          color: Colors.white,
          size: 16.0,
        ));
  }

  Widget _twitterUpbutton() {
    return Container(
        width: 30,
        height: 30.0,
        padding: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xff00acee)),
        child: Icon(
          FontAwesomeIcons.twitter,
          color: Colors.white,
          size: 16.0,
        ));
  }

  Widget _linkedInUpbutton() {
    return Container(
        width: 30,
        height: 30.0,
        padding: EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xff0e76a8)),
        child: Icon(
          FontAwesomeIcons.linkedin,
          color: Colors.white,
          size: 16.0,
        ));
  }

  Widget fbButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Color(0xff3b5998), Color(0xff5d75ef)])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.facebookF,
            color: Colors.white,
            size: 20.0,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            'Continue with Facebook',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Sign Up',
          style: TextStyle(
              fontSize: 45.0, fontWeight: FontWeight.w700, color: Colors.black),
        )
      ],
    );
  }

  Widget subtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'It\'s easier to sign up now',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              color: Colors.black45),
        )
      ],
    );
  }

  Widget header_image(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 262.0,
          width: 221.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/header_logo.png'),
                  fit: BoxFit.fill)),
        ),
      ],
    );
  }
}
