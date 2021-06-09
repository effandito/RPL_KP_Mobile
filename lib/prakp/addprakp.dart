import 'package:flutter/material.dart';
import 'package:flutter_baruu/model.dart';
import "package:http/http.dart" as http;

class AddPkp extends StatefulWidget {

  @override
  _AddPkpState createState() => _AddPkpState();
}

class _AddPkpState extends State<AddPkp> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Pkp p= new Pkp();
  TextEditingController controllerIdPkp = new TextEditingController();
  TextEditingController controllerIdMhs= new TextEditingController();
  TextEditingController controllerNim= new TextEditingController();
  TextEditingController controllerNik= new TextEditingController();
  TextEditingController controllerSemester= new TextEditingController();
  TextEditingController controllerTahunKp= new TextEditingController();
  TextEditingController controllerTool= new TextEditingController();
  TextEditingController controllerSpek= new TextEditingController();
  TextEditingController controllerDokumen= new TextEditingController();
  TextEditingController controllerPenguji= new TextEditingController();
  TextEditingController controllerRuangan= new TextEditingController();
  TextEditingController controllerPimpinan= new TextEditingController();
  TextEditingController controllerLembaga= new TextEditingController();
  TextEditingController controllerAlamat= new TextEditingController();
  TextEditingController controllerTelp= new TextEditingController();
  TextEditingController controllerWaktuPelPkp= new TextEditingController();
  TextEditingController controllerStatusPraKp= new TextEditingController();
  TextEditingController controllerFax= new TextEditingController();
  TextEditingController controllerCreatedat= new TextEditingController();
  TextEditingController controllerUpdatedat= new TextEditingController();

  void addPkp() {
    var url = "http://192.168.43.131:8080/sambung/addpkp.php";

    http.post(url, body: {
      "id_mhs": controllerIdMhs.text,
      "nim": controllerNim.text,
      "nik": controllerNik.text,
      "semester": controllerSemester.text,
      "tahun_kp": controllerTahunKp.text,
      "tool": controllerTool.text,
      "spek": controllerSpek.text,
      "dokumen": controllerDokumen.text,
      "penguji": controllerPenguji.text,
      "ruangan": controllerRuangan.text,
      "pimpinan": controllerPimpinan.text,
      "lembaga": controllerLembaga.text,
      "alamat": controllerAlamat.text,
      "telp_lembaga": controllerTelp.text,
      "fax": controllerFax.text,
      "wkt_pel_kp": controllerWaktuPelPkp.text,
      "status_prakp": controllerStatusPraKp.text,
      "created_at": controllerCreatedat.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("PRA KP"),),
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
                  controller: controllerNim,
                  decoration: new InputDecoration(
                      hintText: "72180777 ", labelText: "NIM"),
                  onSaved:(String value) {
                    this.p.nim = value;
                  },
                ),
                new TextFormField(
                  controller: controllerSemester,
                  decoration: new InputDecoration(
                      hintText: "7", labelText: "Semester"),
                  onSaved:(String value) {
                    this.p.semester = value;
                  },
                ),
                new TextFormField(
                  controller: controllerTahunKp,
                  decoration: new InputDecoration(
                      hintText: "2021", labelText: "Tahun  KP"),
                  onSaved:(String value) {
                    this.p.tahun_kp = value;
                  },
                ),
                new TextFormField(
                  controller: controllerTool,
                  decoration: new InputDecoration(
                      hintText: "VS Code", labelText: "Tool"),
                  onSaved:(String value) {
                    this.p.tool = value;
                  },
                ),
                new TextFormField(
                  controller: controllerSpek,
                  decoration: new InputDecoration(
                      hintText: "Program ini...", labelText: "Spesifikasi"),
                  onSaved:(String value) {
                    this.p.spek = value;
                  },
                ),
                new TextFormField(
                  controller: controllerDokumen,
                  decoration: new InputDecoration(
                      hintText: "", labelText: "Dokumen"),
                  onSaved:(String value) {
                    this.p.dokumen = value;
                  },
                ),
                new TextFormField(
                  controller: controllerPenguji,
                  decoration: new InputDecoration(
                      hintText: "Penguji ", labelText: "Penguji"),
                  onSaved:(String value) {
                    this.p.penguji = value;
                  },
                ),
                new TextFormField(
                  controller: controllerRuangan,
                  decoration: new InputDecoration(
                      hintText: "Nama Ruangan", labelText: "Ruangan"),
                  onSaved:(String value) {
                    this.p.ruangan = value;
                  },
                ),
                new TextFormField(
                  controller: controllerPimpinan,
                  decoration: new InputDecoration(
                      hintText: "Pimpinan", labelText: "Pimpinan"),
                  onSaved:(String value) {
                    this.p.pimpinan = value;
                  },
                ),
                new TextFormField(
                  controller: controllerLembaga,
                  decoration: new InputDecoration(
                      hintText: "CV", labelText: "Lembaga"),
                  onSaved:(String value) {
                    this.p.lembaga = value;
                  },
                ),
                new TextFormField(
                  controller: controllerTelp,
                  decoration: new InputDecoration(
                      hintText: "0811xxxxxx", labelText: "No Telepon "),
                  onSaved:(String value) {
                    this.p.telp_lembaga = value;
                  },
                ),
                new TextFormField(
                  controller: controllerFax,
                  decoration: new InputDecoration(
                      hintText: "0274xxxxxx", labelText: "FAX"),
                  onSaved:(String value) {
                    this.p.fax = value;
                  },
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("TAMBAH"),
                  color: Colors.blueAccent,
                  onPressed: () async {
                    _formState.currentState.save();
                    addPkp();
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


