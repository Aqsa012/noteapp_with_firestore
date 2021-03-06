import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp_with_firestore/newNote.dart';

class AddNote extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('notes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'Add New Note',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          FlatButton(
              onPressed: () {
                ref.add({
                  'title': title.text,
                  'content': content.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),

              child: TextField(
                controller: title,
                decoration: InputDecoration(hintText: 'Title'),
              ), // TextField
            ), // Container

            SizedBox(
              height: 10,
            ),

            Expanded(
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextField(
                    controller: content,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(hintText: 'Content'),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
