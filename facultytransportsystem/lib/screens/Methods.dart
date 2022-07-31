
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facultytransportsystem/screens/welcmeadmin.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

Future<User?> createAccount(String name, String email, String password, String cmsid, String pointno) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("Account created Succesfull");

    userCrendetial.user!.updateDisplayName(name);

    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
      "name": name,
      "email": email,
      "status": "Unavalible",
      "uid": _auth.currentUser!.uid,
      "cmsid":cmsid,
      "pointno":pointno,
      "password":password,
    });

    return userCrendetial.user;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    print("Login Sucessfull");
    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) => userCredential.user!.updateDisplayName(value['name']));


    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}







Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => WelcmeUser()));
    });
  } catch (e) {
    print("error");
  }
}




/////by musaib

class DatabaseManager {
  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('users');
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future updateUserList(String name, String email, String cmsid, String pointno,String password,String uid) async {
    return await profileList.doc(uid).update({
      'name': name, 'email': email, 'cmsid': cmsid, 'pointno': pointno , 'password': password,
    });
  }

  Future  getUsersList() async {
    List itemsList = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

Future<User?> submit(String complain) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;



    await _firestore.collection('complains').doc(_auth.currentUser!.uid).set({
      "complain": complain,
    });

}








