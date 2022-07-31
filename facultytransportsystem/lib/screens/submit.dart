import 'package:facultytransportsystem/screens/Methods.dart';
import 'package:facultytransportsystem/screens/dashboardAdmin.dart';
import 'package:facultytransportsystem/screens/dashboardUser.dart';
import 'package:flutter/material.dart';

import 'mainscreen.dart';



class Submit extends StatefulWidget {
  static const routeName = '/submit';
  @override
  _SubmitState createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  final TextEditingController _complain = TextEditingController();
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.lightGreen,
        title: Text(
          "Submit Complain",
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
                "Submit Complain!",
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
                height: 100,
                width: size.width,
                alignment: Alignment.center,
                child:  TextField(
                  controller: _complain,

                  decoration: InputDecoration(

                      labelText: 'Submit Complain Here ',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                 // obscureText: true,
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
          child: Text("SUBMIT COMPLAIN",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),),

          color: Colors.lightGreen,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(
                DashboardUser.routeName);
            if (_complain.text.isNotEmpty
              ) {
              setState(() {
                isLoading = true;
              });

              submit(_complain.text);
              creaAlertDialog(context);
            }
          else{
              createAlertDialog(context);
            }
          }),

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
            );}

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
            content: Text("Please Insert the Field",
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
            content: Text("Thankyou For Registeration Account Has Been Successfully Created",
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
  Future creaAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Icon(Icons.thumb_up),
            content: Text("Your Complain Submit SuccessFully Thank you",
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