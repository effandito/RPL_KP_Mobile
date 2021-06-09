import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});
  String dropdownValue = 'Genap';
  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerIdKp ;
  TextEditingController controllerIdMhs;
  TextEditingController controllerIdDosen;
  TextEditingController controllerNim;
  TextEditingController controllerNik;
  TextEditingController controllerSemester;
  TextEditingController controllerTahunKp;
  TextEditingController controllerJdlKp;
  TextEditingController controllerTool;
  TextEditingController controllerSpek;
  TextEditingController controllerDokumen;
  TextEditingController controllerPenguji;
  TextEditingController controllerRuangan;
  TextEditingController controllerPimpinan;
  TextEditingController controllerLembaga;
  TextEditingController controllerAlamat;
  TextEditingController controllerTelpLembaga;
  TextEditingController controllerWaktuPelKP;
  TextEditingController controllerStatusKp;
  TextEditingController controllerCreatedat;
  TextEditingController controllerUpdatedat;



  void editData() {
    var url="http://192.168.43.131:8080/rpl1/editdata.php";
    http.post(url,body: {
      "id_kp": widget.list[widget.index]['id_kp'],
      "id_mhs": controllerIdMhs.text,
      "id_dosen":controllerIdDosen.text,
      "nim":controllerNim.text,
      "nik":controllerNik.text,
      "tahun_kp":controllerTahunKp.text,
      "semester":controllerSemester.text,
      "jdl_kp":controllerJdlKp.text,
      "tool":controllerTool.text,
      "spek":controllerSpek.text,
      "dokumen":controllerDokumen.text,
      "penguji":controllerPenguji.text,
      "ruangan":controllerRuangan.text,
      "pimpinan":controllerPimpinan.text,
      "lembaga":controllerLembaga.text,
      "alamat":controllerAlamat.text,
      "telp_lembaga":controllerTelpLembaga.text,
      "wkt_pel_kp":controllerWaktuPelKP.text,
      "status_kp":controllerStatusKp.text,
      "created_at":controllerCreatedat.text,
      "update_at":controllerUpdatedat.text

    });
  }


  @override
  void initState() {
    controllerIdKp= new TextEditingController(text: widget.list[widget.index]['id_kp'] );
    controllerIdMhs= new TextEditingController(text: widget.list[widget.index]['id_mhs'] );
    controllerIdDosen= new TextEditingController(text: widget.list[widget.index]['id_dosen'] );
    controllerNim= new TextEditingController(text: widget.list[widget.index]['nim'] );
    controllerNik= new TextEditingController(text: widget.list[widget.index]['nik'] );
    controllerSemester= new TextEditingController(text: widget.list[widget.index]['semester'] );
    controllerTahunKp= new TextEditingController(text: widget.list[widget.index]['tahun_kp'] );
    controllerJdlKp= new TextEditingController(text: widget.list[widget.index]['jdl_kp'] );
    controllerTool= new TextEditingController(text: widget.list[widget.index]['tool'] );
    controllerSpek= new TextEditingController(text: widget.list[widget.index]['spek'] );
    controllerDokumen= new TextEditingController(text: widget.list[widget.index]['dokumen'] );
    controllerPenguji= new TextEditingController(text: widget.list[widget.index]['penguji'] );
    controllerRuangan= new TextEditingController(text: widget.list[widget.index]['ruangan'] );
    controllerPimpinan= new TextEditingController(text: widget.list[widget.index]['pimpinan'] );
    controllerLembaga= new TextEditingController(text: widget.list[widget.index]['lembaga'] );
    controllerAlamat= new TextEditingController(text: widget.list[widget.index]['alamat'] );
    controllerTelpLembaga= new TextEditingController(text: widget.list[widget.index]['telp_lembaga'] );
    controllerWaktuPelKP= new TextEditingController(text: widget.list[widget.index]['wkt_pel_kp'] );
    controllerStatusKp= new TextEditingController(text: widget.list[widget.index]['status_kp'] );
    controllerCreatedat= new TextEditingController(text: widget.list[widget.index]['created_at'] );
    controllerUpdatedat= new TextEditingController(text: widget.list[widget.index]['updated_at'] );
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
                  controller: controllerNik,
                  decoration: new InputDecoration(
                      hintText: "2021", labelText: "NIK"),
                ),

                /*new TextField(
                  controller: controllerStatus,
                  decoration: new InputDecoration(
                      hintText: "S", labelText: "Stock"),
                ),*/
                new TextField(
                  controller: controllerTahunKp,
                  decoration: new InputDecoration(
                      hintText: "2021", labelText: "Tahun KP"),
                ),
                new TextField(
                  controller: controllerJdlKp,
                  decoration: new InputDecoration(
                      hintText: "Spk Metode SAW", labelText: "Judul KP"),
                ),
                /*new TextField(
                  controller: controllerNik,
                  decoration: new InputDecoration(
                      hintText: "SPK metode SAW", labelText: "Judul KP"),
                ),*/
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
                  controller: controllerTelpLembaga,
                  decoration: new InputDecoration(
                      hintText: "0811xxxxxx", labelText: "No Telepon Lembaga"),
                ),
                new TextField(
                  controller: controllerWaktuPelKP,
                  decoration: new InputDecoration(
                      hintText: "waktu", labelText: "Waktu Pelaksanaan"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
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