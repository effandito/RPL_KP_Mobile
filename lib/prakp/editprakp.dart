import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/main.dart';

class EditPkp extends StatefulWidget {
  final List list;
  final int index;

  EditPkp({this.list, this.index});
  String dropdownValue = 'Genap';
  @override
  _EditPkpState createState() => new _EditPkpState();
}

class _EditPkpState extends State<EditPkp> {

  TextEditingController controllerIdPkp ;
  TextEditingController controllerIdMhs;
  TextEditingController controllerNim;
  TextEditingController controllerNik;
  TextEditingController controllerSemester;
  TextEditingController controllerTahunKp;
  TextEditingController controllerTool;
  TextEditingController controllerSpek;
  TextEditingController controllerDokumen;
  TextEditingController controllerPenguji;
  TextEditingController controllerRuangan;
  TextEditingController controllerPimpinan;
  TextEditingController controllerLembaga;
  TextEditingController controllerAlamat;
  TextEditingController controllerTelp;
  TextEditingController controllerWaktuPelPkp;
  TextEditingController controllerStatusPraKp;



  void editPkp() {
    var url="http://192.168.43.131:8080/rpl1/editpkp.php";
    http.post(url,body: {
      "id_pkp": widget.list[widget.index]['id_pkp'],
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
      "wkt_pel_kp": controllerWaktuPelPkp.text,
      "status_pra_kp": controllerStatusPraKp.text,

    });
  }


  @override
  void initState() {
    controllerIdPkp= new TextEditingController(text: widget.list[widget.index]['id_pkp'] );
    controllerNim= new TextEditingController(text: widget.list[widget.index]['nim'] );
    controllerNik= new TextEditingController(text: widget.list[widget.index]['nik'] );
    controllerSemester= new TextEditingController(text: widget.list[widget.index]['semester'] );
    controllerTahunKp= new TextEditingController(text: widget.list[widget.index]['tahun_kp'] );
    controllerTool= new TextEditingController(text: widget.list[widget.index]['tool'] );
    controllerSpek= new TextEditingController(text: widget.list[widget.index]['spek'] );
    controllerDokumen= new TextEditingController(text: widget.list[widget.index]['dokumen'] );
    controllerPenguji= new TextEditingController(text: widget.list[widget.index]['penguji'] );
    controllerRuangan= new TextEditingController(text: widget.list[widget.index]['ruangan'] );
    controllerPimpinan= new TextEditingController(text: widget.list[widget.index]['pimpinan'] );
    controllerLembaga= new TextEditingController(text: widget.list[widget.index]['lembaga'] );
    controllerAlamat= new TextEditingController(text: widget.list[widget.index]['alamat'] );
    controllerTelp= new TextEditingController(text: widget.list[widget.index]['telp'] );
    controllerWaktuPelPkp= new TextEditingController(text: widget.list[widget.index]['wkt_pel_Pkp'] );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNim,
                  decoration: new InputDecoration(
                      hintText: "72180777 ", labelText: "NIM"),
                ),
                new TextField(
                  controller: controllerTahunKp,
                  decoration: new InputDecoration(
                      hintText: "2021", labelText: "Tahun Pra KP"),
                ),
                new TextField(
                  controller: controllerTool,
                  decoration: new InputDecoration(
                      hintText: "Tools yang digunakan", labelText: "Tools"),
                ),
                new TextField(
                  controller: controllerSpek,
                  decoration: new InputDecoration(
                      hintText: "Spesifikasi sistem yang dibuat", labelText: "Spesifikasi"),
                ),
                new TextField(
                  controller: controllerDokumen,
                  decoration: new InputDecoration(
                      hintText: "Dokumen ", labelText: "Dokumen"),
                ),
                new TextField(
                  controller: controllerPenguji,
                  decoration: new InputDecoration(
                      hintText: "Nama PENGUJI ", labelText: "Penguji"),
                ),
                new TextField(
                  controller: controllerRuangan,
                  decoration: new InputDecoration(
                      hintText: "Didaktos", labelText: "Ruang"),
                ),
                new TextField(
                  controller: controllerPimpinan,
                  decoration: new InputDecoration(
                      hintText: "Pimpinan", labelText: "Pimpinan"),
                ),
                new TextField(
                  controller: controllerLembaga,
                  decoration: new InputDecoration(
                      hintText: "CV", labelText: "Lembaga"),
                ),
                new TextField(
                  controller: controllerAlamat,
                  decoration: new InputDecoration(
                      hintText: "Alamat", labelText: "Alamat"),
                ),
                new TextField(
                  controller: controllerTelp,
                  decoration: new InputDecoration(
                      hintText: "0811xxxxxx", labelText: "No Telepon Lembaga"),
                ),
                new TextField(
                  controller: controllerWaktuPelPkp,
                  decoration: new InputDecoration(
                      hintText: "DD/MM/YYYY", labelText: "Waktu Pelaksanaan"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editPkp();
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                            builder: (BuildContext context)=>Home()
                        )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}