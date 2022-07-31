import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Methods.dart';
import 'authenticate.dart';
import 'mainscreen.dart';


class Data extends StatefulWidget {
  static const routeName = '/data';
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  final Authenticate _auth = Authenticate();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cmsidController = TextEditingController();
  TextEditingController _pointController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List userProfilesList = [];

  String uid = "";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
    fetchDatabaseList();
  }

  fetchUserInfo() async {
    User? getUser = await FirebaseAuth.instance.currentUser;
    uid = getUser!.uid;
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  updateData(String name, String email, String pointno, String cmsid,String password ,String uid) async {
    await DatabaseManager().updateUserList(name, email, pointno, cmsid,password,uid);
    fetchDatabaseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.lightGreen,
          actions: [
            RaisedButton(
              onPressed: () {
                openDialogueBox(context);
              },
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              color: Colors.lightGreen,
            ),
          /*  RaisedButton(
              onPressed: () async {
                await _auth.signOut().then((result) {
                  Navigator.of(context).pop(true);
                });
              },
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              color: Colors.deepPurple,
            )*/
          ],
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
        body: Container(
            child: ListView.builder(
                itemCount: userProfilesList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(userProfilesList[index]['name']),
                      subtitle: Text(userProfilesList[index]['email']),
                      leading: CircleAvatar(
                        child: Image(
                          image: AssetImage('assets/images/pp.png'),
                        ),
                      ),
                      trailing: Text('${userProfilesList[index]['cmsid']}'),
                    ),
                  );
                })));
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit User Details'),
            content:
            SingleChildScrollView(
            child:
            Container(
              height: 250,
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  TextField(
                    controller: _cmsidController,
                    decoration: InputDecoration(hintText: 'CmsId'),
                  ),
                  TextField(
                    controller: _pointController,
                    decoration: InputDecoration(hintText: 'PointNo'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                ],
              ),
            ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  submitAction(context);
                  Navigator.pop(context);
                  reatAlertDialog(context);
                },
                child: Text('Submit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  submitAction(BuildContext context) {
    updateData(_nameController.text, _emailController.text,
        _pointController.text,_cmsidController.text,_passwordController.text, uid);
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _pointController.clear();
  }
  Future reatAlertDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Icon(Icons.thumb_up),
            content: Text("Update Data Succcessfully",
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