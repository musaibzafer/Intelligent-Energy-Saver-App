import 'package:facultytransportsystem/screens/Methods.dart';
import 'package:facultytransportsystem/screens/dashboardAdmin.dart';
import 'package:facultytransportsystem/screens/welcmeadmin.dart';
import 'package:flutter/material.dart';

import 'mainscreen.dart';



class CreateAccount extends StatefulWidget {
  static const routeName = '/createacoount';
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cmsid = TextEditingController();
  final TextEditingController _pointno = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.lightGreen,
        title: Text(
          "Registeration",
          style: TextStyle(fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial Black',
            color: Colors.white,
          ),

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightGreen,
        iconSize: 30,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white,),
            title:Text('Home',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),

        ],
        onTap: (_){
          Navigator.of(context).pushNamed(
            MainScreen.routeName,
          );},
      ),
      body: isLoading
          ? Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: size.height / 50,
            ),
            Container(
              width: size.width / 1.1,
              child: Text(
                "Welcome",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.lightGreen,
                  color: Colors.lightGreen,
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              width: size.width / 1.1,
              child: Text(
                "Create Account to Continue!",
                style: TextStyle(

                  color: Colors.lightGreen,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "Name", Icons.account_box, _name),
              ),
            ),
            Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "email", Icons.email, _email),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "password", Icons.lock, _password),
              ),

            ),
            Container(
              width: size.width,
              alignment: Alignment.center,
              child: field(size, "point no.", Icons.directions_bus, _pointno),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "cms_id", Icons.perm_identity, _cmsid,

                ),
              ),

            ),

            customButton(size),
           /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return
      Container(

        child:FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),

          minWidth: size.width / 1.1,
          height: size.height / 14,
          child: Text("CREATE ACCOUNT",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),),

          color: Colors.lightGreen,
          textColor: Colors.white,
          onPressed: () {
            if (_name.text.isNotEmpty &&
                _email.text.isNotEmpty &&
                _password.text.isNotEmpty &&
                 _pointno.text.isNotEmpty &&
                  _cmsid.text.isNotEmpty)

            {
              setState(() {
                isLoading = true;
              });

              createAccount(_name.text, _email.text, _password.text,_pointno.text,_cmsid.text).then((user) {
                if (user != null) {
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DashboardAdmin()));
                  print("Account Created Sucessfull");
                  reatAlertDialog(context);
                } else {
                  print("Login Failed");
                  creatAlertDialog(context);
                  setState(() {
                    isLoading = false;
                  });
                }
              });
            } else {
              print("Please enter Fields");
              createAlertDialog(context);
            }

          },
        ),


      );

    /*
      GestureDetector(
      onTap: () {
        if (_name.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _password.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          createAccount(_name.text, _email.text, _password.text).then((user) {
            if (user != null) {
              setState(() {
                isLoading = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WelcmeUser()));
              print("Account Created Sucessfull");
            } else {
              print("Login Failed");
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          print("Please enter Fields");
        }
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );*/
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
  Future createAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Icon(Icons.error),
            content: Text("Please Insert All the Fields In The Form",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                onPressed: Navigator.of(context).pop,
                child:Text("OK"),
              )
            ],
          );
        }

    );
  }
  Future creatAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Icon(Icons.error),
            content: Text("Account Exist Please Try With Another Details",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                onPressed: Navigator.of(context).pop,
                child:Text("OK"),
              )
            ],
          );
        }

    );
  }
  Future reatAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Icon(Icons.thumb_up),
            content: Text("Thankyou For Registeration Account Has Been Created Successfully",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                onPressed: Navigator.of(context).pop,
                child:Text("OK"),
              )
            ],
          );
        }

    );
  }
}