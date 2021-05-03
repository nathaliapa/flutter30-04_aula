import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart'; //importação

void main()  async {
  /**
   * Todas as versões do Firebase foram atualizadas e agora você deve chamar Firebase.initializeApp()antes de usar qualquer produto Firebase
   */

   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  runApp(MyApp());

  FirebaseFirestore db = FirebaseFirestore.instance;

  db.collection('pessoa').doc('002').set({
    'nome':'joao',
    'idade': 25
  });

  QuerySnapshot resultado = await db.collection('pessoa').get();

  resultado.docs.forEach((element) {
    print(element.id);
  });

}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }

  // ignore: non_constant_identifier_names
  MyHomePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text('hellow'),
      ),
    );
  }
}


/**
*
* db.collection('pessoa').doc('002').set({
    'nome':'joao',
    'idade': 25
  });


  db.collection('pessoa').add({
    'campo A' :'name',
    'campo B' :'idade',

  });

  db.collection('pessoa').doc('002').update({
    'nome' : 'pedro',
  });

  db.collection('pessoa').doc('002').delete();

*
*
*
*
* */