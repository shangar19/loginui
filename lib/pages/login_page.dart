import 'package:flutter/material.dart';
import 'package:loginui/services/nav_services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  FocusNode myEmailFocusNode = new FocusNode();
  FocusNode myPassFocusNode = new FocusNode();
  bool isSwitched = true;

  void initSate() {
    super.initState();
  }

  void dispose() {
    myEmailFocusNode.dispose();
    myPassFocusNode.dispose();
    super.dispose();
  }

  void requestEmailFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myEmailFocusNode);
    });
  }

  void requestPassFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(myPassFocusNode);
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [header_image(context)],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 10.0,
                    ),
                    loginUI(),
                     SizedBox(
                      height: 4.0,
                    ),
                    _createAccountLabel(),
                     SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _backButton()
  {
     return InkWell(
       onTap: (){
         Navigator.pop(context);
       },
            child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(children: <Widget>[
          Container(
            child: Icon(Icons.arrow_back, color: Colors.white),
            padding: EdgeInsets.only(top: 10.0,left: 2.0, bottom: 10.0 ),
          ),
          Text('Back', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),)
        ],
       )
       ),
     );
  }

  Widget loginUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          //Email Field
          TextFormField(
            focusNode: myEmailFocusNode,
            onTap: requestEmailFocus,
            //autofocus: true,
            autocorrect: false,
            obscureText: false,
            style: TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.email,
                    color: myEmailFocusNode.hasFocus
                        ? Color(0xff2f30e8)
                        : Colors.black54),
                labelText: 'Email address',
                labelStyle: TextStyle(
                    color: myEmailFocusNode.hasFocus
                        ? Color(0xff2f30e8)
                        : Colors.black54),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Colors.black54)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Color(0xff2f30e8))),
                hintText: 'Email address',
                filled: true),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            focusNode: myPassFocusNode,
            onTap: requestPassFocus,
            autocorrect: false,
            obscureText: true,
            style: TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.lock,
                    color: myPassFocusNode.hasFocus
                        ? Color(0xff2f30e8)
                        : Colors.black54),
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: myPassFocusNode.hasFocus
                        ? Color(0xff2f30e8)
                        : Colors.black54),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Colors.black54)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Color(0xff2f30e8))),
                hintText: 'Password',
                filled: true),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Transform.scale(
                scale: 0.6,
                child: Switch(
                    activeTrackColor: Color(0xff5d75ef),
                    activeColor: Color(0xff2f30e8),
                    value: isSwitched,
                    onChanged: (v) {
                      setState(() {
                        isSwitched = v;
                      });
                    }),
              ),
              Text(
                'Remember me',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 70.0,
              ),
              Text('Forgot password ',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          //Login button
          Container(
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
                    colors: [Color(0xff2f30e8), Color(0xff5d75ef)])),
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }



  Widget header_image(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0, left: 0.0, bottom: 180.0),
        child: _backButton(),
      ),
      height: 275.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/header_png.png'),
              fit: BoxFit.fill)),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              NavigationService.instance.navigateTo("Register");
            },
            child: Text(
              'Register',
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
}
