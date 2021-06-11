import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:flutter_baruu/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  final String baseUrl = "http://192.168.43.131:8080/sambung";

  Client client = Client();

// ------------------------------surat keterangan kp------------------------------

Future<List<Skkp>> getSkkp() async {
  final response = await client.get("$baseUrl/getskp.php");
  if (response.statusCode == 200) {
    return SkkpFromJson(response.body);
  } else {
    return null;
  }
}
  Future<List<Skkp>> readSkkp() async {
    final response = await client.get("$baseUrl/readskkp.php");
    if (response.statusCode == 200) {
      return SkkpFromJson(response.body);
    } else {
      return null;
    }
  }

// Future<bool> createJadwal(Jadwal data) async {
//   var request = http.MultipartRequest(
//       'POST',
//       Uri.parse("$baseUrl/api/progmob/jadwal/create")
//   );
//
//   request.fields.addAll({
//     "id_dosen": data.id_dosen,
//     "id_matkul": data.id_matkul,
//     "nim_progmob": data.nim_progmob
//   });
//
//   var response = await request.send();
//   if (response.statusCode == 200) {
//     return true;
//   } else {
//     return false;
//   }
// }
Future<bool> createSkkp(Skkp data) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/addskp.php")
  );

  request.fields.addAll({
    "id_mhs": data.id_mhs,
    "id_skp": data.id_skp,
    "id_dosen": data.id_dosen,
    "semester": data.semester,
    "tahun_kp":data.tahun_kp,
    "status_skp":data.status_skp,
    "nim":data.nim,
    //"telp_lembaga":data.telp_lembaga,
    "alamat":data.alamat,
    "dokumen":data.dokumen,
    "lembaga":data.lembaga,
    "pimpinan":data.pimpinan,
    "fax":data.fax,
  });

  /*var response = await request.send();
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }*/
}

Future<bool> updateSkkp(Skkp data) async {
  var request = http.MultipartRequest(
      'POST',
      Uri.parse("$baseUrl/editskp.php")
  );
  Map<String,String> headers={
    "content-type": "application/json"
  };
  request.headers.addAll(headers);

  request.fields.addAll({
    "id_skp":data.id_skp,
    "nim":data.nim,
    "semester":data.semester,
    "tahun_kp":data.tahun_kp,
    "telp_lembaga":data.telp_lembaga,
    "alamat":data.alamat,
    "dokumen":data.dokumen,
    "lembaga":data.lembaga,
    "pimpinan":data.pimpinan,
    "status_skp":data.status_skp,
    "fax":data.fax,
  });
  var response = await request.send();
  // print(response.contentLength);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }

}

Future<bool> deleteSkkp(String id_skp) async {
  final response = await client.post(
      "$baseUrl/deleteskp.php",
      headers: {"content-type": "application/json"},
      body: json.encode(<String, String>{
        "id_skp": id_skp,
      })
  );
}
  Future<bool> verifSkkp(String id_skp,String status) async {
    final response = await client.post(
        "$baseUrl/verifskp.php",
        headers: {"content-type": "application/json"},
        body: json.encode(<String, String>{
          "id_skp": id_skp,
          "status_skp": status
        })
    );
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
// ------------------------------Pra Kerja Praktek------------------------------
  Future<List<Pkp>> getPkp() async {
    final response = await client.get("$baseUrl/getpkp.php");
    if (response.statusCode == 200) {
      return PkpFromJson(response.body);
    } else {
      return null;
    }
  }


  Future<bool> createPkp(Pkp data) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/addpkp.php")
    );

    request.fields.addAll({
      "id_pkp": data.id_pkp,
      "semester": data.semester,
      "tahun_kp":data.tahun_kp,
      "status_prakp":data.status_prakp,
      "nim":data.nim,
      "tool":data.tool,
      "spek":data.spek,
      "dokumen":data.dokumen,
      "penguji":data.penguji,
      "ruangan":data.ruangan,
      "lembaga":data.lembaga,
      "pimpinan":data.pimpinan,
      "alamat":data.alamat,
      "telp_lembaga":data.telp_lembaga,
      "fax":data.fax,
      "wkt_pel_pkp":data.wkt_pel_pkp,
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePkp(Pkp data) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse("$baseUrl/editdpkp.php")
    );
    Map<String,String> headers={
      "content-type": "application/json"
    };
    request.headers.addAll(headers);

    request.fields.addAll({
      "id_pkp": data.id_pkp,
      "semester": data.semester,
      "tahun_kp":data.tahun_kp,
      "status_prakp":data.status_prakp,
      "nim":data.nim,
      "nik": data.nik,
      "tool":data.tool,
      "spek":data.spek,
      "dokumen":data.dokumen,
      "penguji":data.penguji,
      "ruangan":data.ruangan,
      "lembaga":data.lembaga,
      "pimpinan":data.pimpinan,
      "alamat":data.alamat,
      "fax":data.fax,
      "telp_lembaga":data.telp_lembaga,
      "wkt_pel_pkp":data.wkt_pel_pkp,
    });


    var response = await request.send();
    // print(response.contentLength);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }

  Future<bool> deletePkp(String id_pkp) async {
    final response = await client.post(
        "$baseUrl/deletepkp.php",
        headers: {"content-type": "application/json"},
        body: json.encode(<String, String>{
          "id_pkp": id_pkp,
        })
    );
  }
    Future<bool> verifPkp(String id_pkp, String status) async {
      final response = await client.post(
          "$baseUrl/verifpkp.php",
          headers: {"content-type": "application/json"},
          body: json.encode(<String, String>{
            "id_skp": id_pkp,
            "status_prakp": status
          })
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }

// ------------------------------Kerja Praktek------------------------------
    Future<List<Kp>> getKp() async {
      final response = await client.get("$baseUrl/getdata.php");
      if (response.statusCode == 200) {
        return KpFromJson(response.body);
      } else {
        return null;
      }
    }

// Future<bool> createJadwal(Jadwal data) async {
//   var request = http.MultipartRequest(
//       'POST',
//       Uri.parse("$baseUrl/api/progmob/jadwal/create")
//   );
//
//   request.fields.addAll({
//     "id_dosen": data.id_dosen,
//     "id_matkul": data.id_matkul,
//     "nim_progmob": data.nim_progmob
//   });
//
//   var response = await request.send();
//   if (response.statusCode == 200) {
//     return true;
//   } else {
//     return false;
//   }
// }
    Future<bool> createKp(Kp data, String id_kp, String id_mhs) async {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse("$baseUrl/adddata.php")
      );

      request.fields.addAll({
        "semester": data.semester,
        "tahun_kp": data.tahun_kp,
        "jdl_kp": data.jdl_kp,
        "status": data.status,
        "nim": data.nim,
        "tool": data.tool,
        "spek": data.spek,
        "dokumen": data.dokumen,
        "penguji": data.penguji,
        "ruangan": data.ruangan,
        "lembaga": data.lembaga,
        "pimpinan": data.pimpinan,
        "alamat": data.alamat,
        "telp_lembaga": data.telp_lembaga,
        "wkt_pel_kp": data.wkt_pel_kp,
      });

      var response = await request.send();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }

    Future<bool> updateKp(Kp data, String id_kp) async {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse("$baseUrl/editdata.php")
      );


      request.fields.addAll({
        "id_kp": id_kp,
        "semester": data.semester,
        "tahun_kp": data.tahun_kp,
        "jdl_kp": data.jdl_kp,
        "status": data.status,
        "nim": data.nim,
        "nik": data.nik,
        "tool": data.tool,
        "spek": data.spek,
        "dokumen": data.dokumen,
        "penguji": data.penguji,
        "ruangan": data.ruangan,
        "lembaga": data.lembaga,
        "pimpinan": data.pimpinan,
        "alamat": data.alamat,
        "telp_lembaga": data.telp_lembaga,
        "wkt_pel_kp": data.wkt_pel_kp,
      });


      var response = await request.send();
      // print(response.contentLength);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
      // if (response.statusCode == 200) {
      // if (data.id_matkul != null && data.id_dosen != null) {
      //   print("masuk true");
      //   print(data);
      //   return true;
      // } else {
      //   print("masuk else");
      //   return false;
      // }
    }

    Future<bool> deleteKp(String id_kp) async {
      final response = await client.post(
          "$baseUrl/delete.php",
          headers: {"content-type": "application/json"},
          body: json.encode(<String, String>{
            "id_kp": id_kp,
          })
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    // ------------------------------Jadwal------------------------------
    Future<List<Ukp>> getJadwal() async {
      final response = await client.get("$baseUrl/getjad.php");
      if (response.statusCode == 200) {
        return UkpFromJson(response.body);
      } else {
        return null;
      }
    }

    Future<bool> createUkp(Ukp data, String id_kp, String id_mhs) async {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse("$baseUrl/addjad.php")
      );

      request.fields.addAll({
        "tahun_ukp": data.tahun_ukp,
        "ruangan": data.ruangan,
        "penguji": data.penguji,
        "jdwl_ujian": data.jdwl_ujian,
        "status_ujian": data.status_ujian,
      });

      var response = await request.send();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }

    Future<bool> updateUkp(Ukp data, String id_) async {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse("$baseUrl/editdata.php")
      );


      request.fields.addAll({
        "tahun_ukp": data.tahun_ukp,
        "ruangan": data.ruangan,
        "penguji": data.penguji,
        "jdwl_ujian": data.jdwl_ujian,
        "status_ujian": data.status_ujian,
      });


      var response = await request.send();
      // print(response.contentLength);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
      // if (response.statusCode == 200) {
      // if (data.id_matkul != null && data.id_dosen != null) {
      //   print("masuk true");
      //   print(data);
      //   return true;
      // } else {
      //   print("masuk else");
      //   return false;
      // }
    }

    Future<bool> deleteUkp(String id_kp) async {
      final response = await client.post(
          "$baseUrl/delete.php",
          headers: {"content-type": "application/json"},
          body: json.encode(<String, String>{
          })
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
  }

