import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baruu/apiservices.dart';
import 'package:flutter_baruu/model.dart';
import 'package:http/http.dart' as http;

class AddSkp extends StatefulWidget {
  @override
  _AddSkpState createState() => _AddSkpState();
}

class _AddSkpState extends State<AddSkp> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Skkp sk= new Skkp();
  TextEditingController controlleridmhs = new TextEditingController();
  TextEditingController controlleriddos = new TextEditingController();
  TextEditingController controlleridskp = new TextEditingController();
  TextEditingController controllersemester = new TextEditingController();
  TextEditingController controllertahunkp = new TextEditingController();
  TextEditingController controllernim = new TextEditingController();
  TextEditingController controllertelp_lembaga = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllerlembaga = new TextEditingController();
  TextEditingController controllerdokumen = new TextEditingController();
  TextEditingController controllerpimpinan = new TextEditingController();
  TextEditingController controllerfax = new TextEditingController();
  TextEditingController controllerstatus = new TextEditingController();


  void addSkp() {
    var url = "http://192.168.43.131:8080/sambung/addskp.php";

    http.post(url, body: {
      "id_skp": controlleridskp.text,
      "id_dos": controlleriddos.text,
      "id_mhs": controlleridmhs.text,
      "semester": controllersemester.text,
      "tahun_kp": controllertahunkp.text,
      "nim": controllernim.text,
      "telp_lembaga": controllertelp_lembaga.text,
      "dokumen": controllerdokumen.text,
      "lembaga": controllerlembaga.text,
      "pimpinan": controllerpimpinan.text,
      "alamat": controlleralamat.text,
      "fax": controllerfax.text,
      "status": controllerstatus.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Surat KP"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            new Column(
              children: <Widget>[
              Form(
              key: _formState,
              child: Column(
                children: <Widget>[
                  new TextFormField(
                    controller: controlleridmhs,
                    decoration: new InputDecoration(
                      hintText: "id mhs",
                      labelText: "id_mhs",
                    ),
                    onSaved:(String value) {
                      this.sk.id_mhs = value;
                    },
                  ),
                  new TextFormField(
                    controller: controlleriddos,
                    decoration: new InputDecoration(
                      hintText: "id_dosen",
                      labelText: "No id dosen",
                    ),
                    onSaved:(String value) {
                      this.sk.id_dosen = value;
                    },
                  ),
                  new TextFormField(
                  controller: controllersemester,
                  decoration: new InputDecoration(
                    hintText: "Semester",
                    labelText: "Semester",
                  ),
                  onSaved:(String value) {
                  this.sk.semester = value;
                  },
                ),

                new TextFormField(
                  controller: controllertahunkp,
                  decoration: new InputDecoration(
                    hintText: "Tahun",
                    labelText: "Tahun",
                  ),
                  onSaved:(String value) {
                    this.sk.tahun_kp = value;
                  },
                ),
                new TextFormField(
                  controller: controllernim,
                  decoration: new InputDecoration(
                    hintText: "Nim",
                    labelText: "Nim",
                  ),
                  onSaved:(String value) {
                    this.sk.nim = value;
                  },
                ),
                  new TextFormField(
                    controller: controllertelp_lembaga,
                    decoration: new InputDecoration(
                      hintText: "0877xxxxx",
                      labelText: "Nomor Telepon",
                    ),
                    onSaved:(String value) {
                      this.sk.telp_lembaga= value;
                    },
                  ),
                new TextFormField(
                  controller: controlleralamat,
                  decoration: new InputDecoration(
                    hintText: "JL. .....",
                    labelText: "Alamat",
                  ),
                  onSaved:(String value) {
                    this.sk.alamat = value;
                  },
                ),
                new TextFormField(
                  controller: controllerlembaga,
                  decoration: new InputDecoration(
                    hintText: "Lembaga",
                    labelText: "Lembaga",
                  ),
                  onSaved:(String value) {
                    this.sk.lembaga = value;
                  },
                ),
                new TextFormField(
                  controller: controllerpimpinan,
                  decoration: new InputDecoration(
                    hintText: "Pimpinan",
                    labelText: "Pimpinan",
                  ),
                  onSaved:(String value) {
                    this.sk.pimpinan = value;
                  },
                ),
                  new TextFormField(
                    controller: controllerdokumen,
                    decoration: new InputDecoration(
                      hintText: "Dokumen",
                      labelText: "Dokumen",
                    ),
                    onSaved:(String value) {
                      this.sk.dokumen = value;
                    },
                  ),
                new TextFormField(
                  controller: controllerfax,
                  decoration: new InputDecoration(
                    hintText: "Fax",
                    labelText: "Fax",
                  ),
                  onSaved:(String value) {
                    this.sk.fax = value;
                  },
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),

                new RaisedButton(
                  child: new Text("TAMBAH"),
                  color: Colors.blueAccent,
                  onPressed: () async {
                    _formState.currentState.save();
                    //ApiServices().createSkkp(this.sk);
                    addSkp();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
        )],
        ),
       ]),
    )
    );

  }
}
