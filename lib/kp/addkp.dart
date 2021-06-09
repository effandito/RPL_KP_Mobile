import 'package:flutter/material.dart';
import 'package:flutter_baruu/model.dart';
import "package:http/http.dart" as http;
import 'package:flutter_baruu/apiservices.dart';

class AddData extends StatefulWidget {

  @override
  _AddDataState createState() =>  _AddDataState();
}

class _AddDataState extends State<AddData> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  Kp kp = new Kp();
  TextEditingController controllerIdKp = new TextEditingController();
  TextEditingController controllerIdMhs= new TextEditingController();
  TextEditingController controllerIdDosen= new TextEditingController();
  TextEditingController controllerNim= new TextEditingController();
  TextEditingController controllerNik= new TextEditingController();
  TextEditingController controllerSemester= new TextEditingController();
  TextEditingController controllerTahunKp= new TextEditingController();
  TextEditingController controllerJdlKp= new TextEditingController();
  TextEditingController controllerTool= new TextEditingController();
  TextEditingController controllerSpek= new TextEditingController();
  TextEditingController controllerDokumen= new TextEditingController();
  TextEditingController controllerPenguji= new TextEditingController();
  TextEditingController controllerRuangan= new TextEditingController();
  TextEditingController controllerPimpinan= new TextEditingController();
  TextEditingController controllerLembaga= new TextEditingController();
  TextEditingController controllerAlamat= new TextEditingController();
  TextEditingController controllerTelpLembaga= new TextEditingController();
  TextEditingController controllerWaktuPelKP= new TextEditingController();
  TextEditingController controllerStatusKp= new TextEditingController();
  TextEditingController controllerCreatedat= new TextEditingController();
  TextEditingController controllerUpdatedat= new TextEditingController();

    void addData() {
      var url = "http://192.168.43.131:8080/sambung/adddata.php";

    http.post(url, body: {
      "id_mhs": controllerIdMhs.text,
      "id_dosen": controllerIdDosen.text,
      "nim": controllerNim.text,
      "nik": controllerNik.text,
      "semester": controllerSemester.text,
      "tahun_kp": controllerTahunKp.text,
      "jdl_kp": controllerJdlKp.text,
      "tool": controllerTool.text,
      "spek": controllerSpek.text,
      "dokumen": controllerDokumen.text,
      "penguji": controllerPenguji.text,
      "ruangan": controllerRuangan.text,
      "pimpinan": controllerPimpinan.text,
      "lembaga": controllerLembaga.text,
      "alamat": controllerAlamat.text,
      "telp_lembaga": controllerTelpLembaga.text,
      "wkt_pel_kp": controllerWaktuPelKP.text,
      "status_kp": controllerStatusKp.text,
      "created_at": controllerCreatedat.text,

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Kerja Praktek"),
      ),
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
                /*new TextFormField(
                  controller: controllerNim,
                  decoration: new InputDecoration(
                      hintText: "72180777 ", labelText: "NIM"),
                  onSaved :(String value) {
                    this.kp.nim = value;
                  },
                ),*/
                new TextFormField(
                  controller: controllerSemester,
                  decoration: new InputDecoration(
                      hintText: "7", labelText: "Semester"),
                  onSaved:(String value) {
                    this.kp.semester = value;
                  },
                ),
                new TextFormField(
                  controller: controllerTahunKp,
                  decoration: new InputDecoration(
                      hintText: "2021", labelText: "Tahun KP"),
                  onSaved:(String value) {
                    this.kp.tahun_kp = value;
                  },
                ),

                new TextFormField(
                  controller: controllerJdlKp,
                  decoration: new InputDecoration(
                      hintText: "Spk Metode SAW", labelText: "Judul KP"),
                  onSaved:(String value) {
                    this.kp.jdl_kp = value;
                  },
                ),
                new TextFormField(
                  controller: controllerTool,
                  decoration: new InputDecoration(
                      hintText: "Tools yang digunakan", labelText: "Tools"),
                  onSaved:(String value) {
                    this.kp.tool = value;
                  },
                ),
                new TextFormField(
                  controller: controllerSpek,
                  decoration: new InputDecoration(
                      hintText: "Spesifikasi sistem yang dibuat", labelText: "Spesifikasi"),
                  onSaved:(String value) {
                    this.kp.spek = value;
                  },
                ),
                new TextFormField(
                  controller: controllerDokumen,
                  decoration: new InputDecoration(
                      hintText: "Dokumen ", labelText: "Dokumen"),
                  onSaved:(String value) {
                    this.kp.dokumen = value;
                  },
                ),
                new TextFormField(
                  controller: controllerPenguji,
                  decoration: new InputDecoration(
                      hintText: "Nama PENGUJI ", labelText: "Penguji"),
                  onSaved:(String value) {
                    this.kp.penguji = value;
                  },
                ),
                new TextFormField(
                  controller: controllerRuangan,
                  decoration: new InputDecoration(
                      hintText: "Didaktos", labelText: "ruang"),
                  onSaved:(String value) {
                    this.kp.ruangan = value;
                  },
                ),
                new TextFormField(
                  controller: controllerPimpinan,
                  decoration: new InputDecoration(
                      hintText: "Pimpinan", labelText: "Pimpinan"),
                  onSaved:(String value) {
                    this.kp.pimpinan = value;
                  },
                ),
                new TextFormField(
                  controller: controllerLembaga,
                  decoration: new InputDecoration(
                      hintText: "CV", labelText: "Lembaga"),
                  onSaved:(String value) {
                    this.kp.lembaga = value;
                  },
                ),
                new TextFormField(
                  controller: controllerTelpLembaga,
                  decoration: new InputDecoration(
                      hintText: "0811xxxxxx", labelText: "No Telepon Lembaga"),
                  onSaved:(String value) {
                    this.kp.telp_lembaga = value;
                  },
                ),
               /* new TextFormField(
                  controller: controllerWaktuPelKP,
                  decoration: new InputDecoration(
                      hintText: "waktu", labelText: "Waktu Pelaksanaan"),
                  onSaved:(String value) {
                    this.kp.wkt_pel_kp = value;
                  },
                ),*/
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () async{
                    _formState.currentState.save();
                    addData();
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


