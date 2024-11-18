import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final _fire = FirebaseFirestore.instance;
  create(){
    try{
      _fire.collection("users").add({
        "email":"nat@gmail.com", "telephone":08984928924, "username":"nat", "password":"pa12"
      });
    }catch(e){
      log(e.toString());
    }
  }
}