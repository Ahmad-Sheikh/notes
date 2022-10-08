import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  List<Map> myList = [];

  addNotes() {
    setState(() {
      myList.add({
        'Title': titleController.text.toString(),
        'Description': descController.text.toString(),
      });
    });
    return myList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            bottomDetailSheet(context);
          }),
      appBar: AppBar(
        title: const Text('Add Your Notes'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseControllers.logout(context);
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: SizedBox(
          width: size.width,
          height: size.height * 0.6,
          child: FutureBuilder<QuerySnapshot>(
              // <2> Pass `Future<QuerySnapshot>` to future
              future: FirebaseFirestore.instance.collection('mylist').get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView(
                      children: documents
                          .map((doc) => Card(
                                // color: Colors.pink,
                                child: ListTile(
                                  trailing: const Icon(Icons.delete),
                                  title: Text(
                                    doc['title'],
                                  ),
                                  subtitle: Text(
                                    doc['description'],
                                  ),
                                ),
                              ))
                          .toList());
                } else if (snapshot.hasError) {
                  return const Text('It\'s Error!');
                }
                return const Text('Everything ok');
              }),
        ),
      ),
    );
  }

  void bottomDetailSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.50,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Enter your title',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: descController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.3),
                      hintText: 'Enter description',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            FirebaseControllers.addDatainFirestore(
                              titleController.text.toString(),
                              descController.text.toString(),
                            );
                            FirebaseControllers.getDataFromFirebase();
                          });
                          titleController.clear();
                          descController.clear();
                          Navigator.of(context).pop();
                          //addNotes();
                        },
                        child: const Text('Add Notes'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
