// Model untuk mapping datanya

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// ------------------------------login----------------------------------
/*class LoginResult {
  String nimnik;
  String password;
  String nama;

  LoginResult({
    this.nimnik, this.password, this.nama
  });

  factory LoginResult.createLoginResult(Map<String, dynamic> map) {
    return LoginResult(
      nimnik: map['nimnik'],
      password: map['password'],
      nama: map['nama'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"nimnik": nimnik, "password": password, "nama": nama};
  }

  @override
  String toString() {
    return 'Login{nimnik: $nimnik, password: $password, nama: $nama}';
  }

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      nimnik: json["nimnik"],
      password: json["password"],
      nama: json["nama"],
    );
  }
}

List<LoginResult> loginFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<LoginResult>.from(data.map((item) => LoginResult.fromJson(item)));
}

String loginToJson(LoginResult data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

// ------------------------------chart----------------------------------
class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha
  );
}*/

// ------------------------------dashboard----------------------------------
class DashboardSI {
  String mahasiswa;
  String dosen;
  String matakuliah;
  String jadwal;
  String nim_progmob;
  String Skkp;

  DashboardSI({this.mahasiswa, this.dosen, this.matakuliah, this.jadwal, this.nim_progmob,this.Skkp});

  factory DashboardSI.fromJson(Map<String, dynamic> json) {
    return DashboardSI(
        mahasiswa: json["mahasiswa"],
        dosen: json["dosen"],
        matakuliah: json["matakuliah"],
        jadwal: json["jadwal"],
        nim_progmob: json["nim_progmob"],
        Skkp: json["skkp"]
    );
  }
}


// ------------------------------surat keterangan kp ------------------------------
class Skkp{
  String id_skp;
  String id_mhs;
  String id_dosen;
  String semester;
  String tahun_kp;
  String nim;
  String telp_lembaga;
  String alamat;
  String lembaga;
  String dokumen;
  String pimpinan;
  String fax;
  String status_skp;


  Skkp({
    this.id_skp,this.id_mhs,this.id_dosen,this.semester,  this.tahun_kp, this.nim, this.telp_lembaga,  this.dokumen, this.lembaga, this.pimpinan, this.alamat, this.fax,this.status_skp,
  });

  factory Skkp.fromJson(Map<String, dynamic> map) {
    return Skkp(
        id_dosen: map[" id_dosen"],
        id_mhs: map[" id_mhs"],
        id_skp: map[" id_skp"],
        semester: map[" semester"],
        tahun_kp: map["tahun_kp"],
        nim: map["nim"],
        telp_lembaga: map["telp_lembaga"],
        alamat : map["alamat"],
        dokumen: map["dokumen"],
        lembaga: map["lembaga"],
        pimpinan: map["pimpinan"],
        fax: map["fax"],
        status_skp: map["status_skp"]

    );

  }

  Map<String, dynamic> toJson() => <String, dynamic> {
    "id_skp": id_skp,"id_dosen": id_dosen,"id_mhs": id_mhs,"semester": semester, "tahun_kp":tahun_kp,
    "nim":nim,"alamat":alamat, "telp_lembaga":telp_lembaga,"dokumen":dokumen,
    "lembaga":lembaga, "pimpinan":pimpinan, "fax": fax, "status_skp":status_skp,
  };

  @override
  String toString() {
    return 'Skkp{id_skp : $id_skp,id_dosen : $id_dosen,semester : $semester,semester : $semester,  tahun_kp :$tahun_kp,  nim :$nim,'
        'alamat :$alamat,  telp_lembaga :$telp_lembaga,  dokumen :$dokumen,  lembaga : $lembaga,'
        'fax :$fax,  status_skp:$status_skp,}';
  }
}

List<Skkp> SkkpFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Skkp>.from(data.map((item) => Skkp.fromJson(item)));
}

String SkkpToJson(Skkp data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
// ------------------------------Pra  kp ------------------------------
class Pkp{
  String semester;
  String id_pkp;
  String id_mhs;
  String id_dosen;
  String tahun_kp;
  String status_prakp;
  String nim;
  String nik;
  String tool;
  String spek;
  String dokumen;
  String penguji;
  String ruangan;
  String lembaga;
  String pimpinan;
  String alamat;
  String telp_lembaga;
  String fax;
  String wkt_pel_pkp;


  Pkp({
    this.id_mhs,this.id_dosen,this.id_pkp,this.semester,  this.tahun_kp, this. status_prakp,this.nim, this.nik, this.tool,this.fax,
    this.spek, this.dokumen, this.penguji, this.ruangan, this.lembaga, this.pimpinan, this.alamat, this.telp_lembaga, this.wkt_pel_pkp,
  });

  factory Pkp.fromJson(Map<String, dynamic> map) {
    return Pkp(
        semester: map[" semester"],
        tahun_kp: map["tahun_kp"],
        id_pkp: map["id_pkp"],
        status_prakp: map["status_prakp"],
        id_dosen: map[" id_dosen"],
        id_mhs: map[" id_mhs"],
        nim: map["nim"],
        nik: map["nik"],
        tool: map["tool"],
        spek: map["spek"],
        dokumen: map["dokumen"],
        penguji: map["penguji"],
        ruangan: map["ruangan"],
        lembaga: map["lembaga"],
        pimpinan: map["pimpinan"],
        alamat: map["alamat"],
        telp_lembaga: map["telp_lembaga"],
        fax: map["fax"],
        wkt_pel_pkp: map["wkt_pel_pkp"]
    );

  }

  Map<String, dynamic> toJson() => <String, dynamic> {
    "id_dosen": id_dosen,"id_mhs": id_mhs,"semester": semester,"tahun_kp":tahun_kp, "status_prakp":status_prakp, "nim":nim, "nik": nik, "tool":tool, "spek":spek, "dokumen":dokumen,
    "penguji":penguji, "ruangan":ruangan, "lembaga":lembaga, "pimpinan":pimpinan, "alamat":alamat, "telp_lembaga":telp_lembaga,"fax":fax, "wkt_pel_pkp":wkt_pel_pkp,
  };

  @override
  String toString() {
    return 'Pkp{semester : $semester,status_prakp :$status_prakp,  nim :$nim,  nik : $nik,  tool :$tool,  spek :$spek,  dokumen :$dokumen,'
        'penguji :$penguji,  tahun_kp :$tahun_kp,ruangan :$ruangan,  lembaga :$lembaga,  pimpinan :$pimpinan,'
        'alamat :$alamat,  telp_lembaga :$telp_lembaga, id_dosen : $id_dosen,id_mhs:$id_mhs ,fax :$fax, wkt_pel_pkp :$wkt_pel_pkp,}';
  }
}

List<Pkp> PkpFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Pkp>.from(data.map((item) => Pkp.fromJson(item)));
}

String PkpToJson(Pkp data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
// ------------------------------Kerja Praktek------------------------------
class Kp{
  String nim;
  String id_kp;
  String nik;
  String semester;
  String tahun_kp;
  String jdl_kp;
  String status;
  String tool;
  String spek;
  String dokumen;
  String penguji;
  String ruangan;
  String lembaga;
  String pimpinan;
  String alamat;
  String telp_lembaga;
  String status_kp;
  String wkt_pel_kp;


  Kp({
    this.semester,  this.id_kp,this.tahun_kp, this.jdl_kp, this.nim, this.nik, this.tool,
    this.spek, this.dokumen, this.penguji, this.ruangan, this.lembaga, this.pimpinan, this.alamat, this.telp_lembaga, this.status_kp,this.wkt_pel_kp,
  });

  factory Kp.fromJson(Map<String, dynamic> map) {
    return Kp(
        semester: map[" semester"],
        id_kp: map["id_kp"],
        tahun_kp: map["tahun_kp"],
        jdl_kp: map["jdl_kp"],
        nim: map["nim"],
        nik: map["nik"],
        tool: map["tool"],
        spek: map["spek"],
        dokumen: map["dokumen"],
        penguji: map["penguji"],
        ruangan: map["ruangan"],
        lembaga: map["lembaga"],
        pimpinan: map["pimpinan"],
        alamat: map["alamat"],
        telp_lembaga: map["telp_lembaga"],
        status_kp: map["status_kp"],
        wkt_pel_kp: map["wkt_pel_kp"]
    );

  }

  Map<String, dynamic> toJson() => <String, dynamic> {
    "semester": semester, "tahun_kp":tahun_kp, "jdl_kp":jdl_kp,
    "nim":nim, "nik": nik, "tool":tool, "spek":spek, "dokumen":dokumen,
    "penguji":penguji, "ruangan":ruangan, "lembaga":lembaga, "pimpinan":pimpinan,
    "alamat":alamat, "telp_lembaga":telp_lembaga,"status_kp":status_kp, "wkt_pel_kp":wkt_pel_kp,
  };

  @override
  String toString() {
    return 'Kp{semester : $semester,  tahun_kp :$tahun_kp,  jdl_kp :$jdl_kp,'
        'nim :$nim,  nik : $nik,  tool :$tool,  spek :$spek,  dokumen :$dokumen,'
        'penguji :$penguji,  ruangan :$ruangan,  lembaga :$lembaga,  pimpinan :$pimpinan,'
        'alamat :$alamat,  telp_lembaga :$telp_lembaga, status_kp :$status_kp, wkt_pel_kp :$wkt_pel_kp,}';
  }
}

List<Kp> KpFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Kp>.from(data.map((item) => Kp.fromJson(item)));
}

String KpToJson(Kp data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
// ------------------------------ujian ------------------------------
class Ukp{
  String id_ujian;
  String tahun_ukp;
  String status_ujian;
  String jdwl_ujian;
  String penguji;
  String ruangan;



  Ukp({
    this.id_ujian,this.tahun_ukp, this.jdwl_ujian, this.status_ujian, this.penguji, this.ruangan,
  });

  factory Ukp.fromJson(Map<String, dynamic> map) {
    return Ukp(
      id_ujian: map["id_ujian"],
        tahun_ukp: map["tahun_ukp"],
        ruangan: map["ruangan"],
      penguji: map["penguji"],
        jdwl_ujian: map["jdwl_ujian"],
        status_ujian: map["status_ujian"],

    );

  }

  Map<String, dynamic> toJson() => <String, dynamic> {
    "id_ujian":  id_ujian,"tahun_ukp":  tahun_ukp, "ruangan":ruangan, "penguji":penguji,
    "jdwl_ujian":jdwl_ujian, "status_ujian":status_ujian,};

  @override
  String toString() {
    return 'Ukp{id_ujian : $id_ujian,tahun_ukp : $tahun_ukp,  ruangan :$ruangan,  penguji :$penguji,'
        'jdwl_ujian :$jdwl_ujian,  status_ujian :$status_ujian, }';
  }
}

List<Ukp> UkpFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Ukp>.from(data.map((item) => Ukp.fromJson(item)));
}

String UkpToJson(Ukp data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}