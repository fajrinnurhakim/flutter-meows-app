

import 'package:flutter/material.dart';
import 'package:meows/database_services.dart';

class FormPage extends StatefulWidget {
  String Deskripsi = "";
  String NamaKucing = "";
  String judul = "";
  String NomorWa= "";

  FormPage({Key? key, this.NomorWa="", this.Deskripsi = "", this.NamaKucing = "", this.judul = ""});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String Deskripsi = "";
  String NamaKucing = "";
  String judul = "";
  String NomorWa="";
  var txtNomorWa= TextEditingController();
  var txtDeskripsi = TextEditingController();
  var txtNamaKucing = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtNomorWa.text=widget.NomorWa;
    txtDeskripsi.text = widget.Deskripsi;
    txtNamaKucing.text = widget.NamaKucing;
    Deskripsi = widget.Deskripsi;
    NamaKucing = widget.NamaKucing;
    NomorWa = widget.NomorWa;
    judul = widget.judul;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: Text(judul),
        actions: [
          PopupMenuButton(
            onSelected: popupMenuClick,
            itemBuilder: (BuildContext context) {
              return {'Hapus',}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(children: [
                Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtNomorWa,
            decoration: InputDecoration(
              labelText: "Nomor Wa",
              border: OutlineInputBorder(),
              hintText: "Masukkan Nomor Wa",
            ),
            onChanged: (value) {
              setState(() {
                NomorWa = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtNamaKucing,
            decoration: InputDecoration(
              labelText: "Nama Kucing",
              border: OutlineInputBorder(),
              hintText: "Masukkan Nama Kucing",
            ),
            onChanged: (value) {
              setState(() {
                NamaKucing = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: txtDeskripsi,
            decoration: InputDecoration(
              labelText: "Deskripsi",
              border: OutlineInputBorder(),
              hintText: "Masukkan Deskripsi",
            ),
            onChanged: (value) {
              setState(() {
                Deskripsi = value;
              });
            },
          ),
        ),
        
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.orange[300]),
            onPressed: () {
              DatabaseServices.CreateUpdatemeows(context, Deskripsi, NamaKucing, NomorWa);
            },
            child: Text("simpan"))
      ]),
    );
  }

  void popupMenuClick(String value) {
    switch (value) {
      case 'Hapus':
        DatabaseServices.deletemeows(widget.NomorWa);
        Navigator.pop(context);
        break;
    }
  }
}
