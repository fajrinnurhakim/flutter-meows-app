import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meows/form_page.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({Key? key}) : super(key: key);

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Text("Informasi Kucing"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[300],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormPage(judul: "Tambah Data Kucing");
          }));
        },
        child: Icon(Icons.add,),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('meows')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          print("${documentSnapshot["NamaKucing"]}");
                          return Card(
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                title: Text(documentSnapshot["NamaKucing"]),
                                subtitle: Text(documentSnapshot["Deskripsi"]),
                                trailing: Text(documentSnapshot["NomorWa"]),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return FormPage(judul: "Ubah Data Kucing",NomorWa : documentSnapshot["NomorWa"], NamaKucing: documentSnapshot["NamaKucing"],Deskripsi: documentSnapshot["Deskripsi"],);
                                }));
                              },
                            ),
                          );
                        });
                  } else {
                    return Text("Tidak ada data");
                  }
                })
          ],
        ),
      ),
    );
  }
}
