import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:akhir/widget/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends StatelessWidget {
  final String imageUrl;

  History({super.key, required this.imageUrl});
  User? history = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference history =
        firestore.collection('users/${user!.uid}/History');
    return Container(
      child: SafeArea(
        minimum: const EdgeInsets.only(top: 20.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: history.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('tidak ada data');
            }
            if (snapshot.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];

                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  elevation: 0,
                                  buttonPadding: EdgeInsets.all(12),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Text('tutup'))
                                  ],
                                  scrollable: true,
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Positioned(
                                          child: Text(
                                        'Detail transaksi',
                                        style:
                                            TextStyle(color: softpurpleColor),
                                      )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("nama  : " + data['nama']),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "ID : " + data.id,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("nominal : " + data['cashe_out']),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text("status :"),
                                          Text(" berhasil",
                                              style: TextStyle(
                                                  color: Colors.green))
                                        ],
                                      )
                                    ],
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                      child: Column(
                                        children: <Widget>[
                                          Divider(),
                                          Text(
                                            'E-wallet',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white54),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 30,
                                    backgroundImage: AssetImage(imageUrl),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data['nama'],
                                        style: TextStyle(
                                            fontSize: 15, color: listColor),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data.id,
                                        style: TextStyle(
                                            fontSize: 8, color: listColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("-" + data['cashe_out'],
                                      style: TextStyle(
                                          fontSize: 20, color: listColor)),
                                  Text(data['keterangan'],
                                      style: TextStyle(
                                          fontSize: 10, color: listColor)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Text('-tidak ada data-');
            }
          },
        ),
      ),
    );
  }
}
