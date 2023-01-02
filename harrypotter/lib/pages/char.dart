import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:harrypotter/color_constants.dart';
import 'package:harrypotter/introduce_row.dart';
import 'package:harrypotter/model/load_data.dart';
import 'package:http/http.dart' as http;
import 'introduce_myself.dart';

class Char extends StatefulWidget {
  const Char({super.key});

  @override
  State<Char> createState() => _CharState();
}

class _CharState extends State<Char> {
  List<loadData> allData = [];
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: ColorConstants.mavi1,
      appBar: AppBar(
        backgroundColor: ColorConstants.mavi1,
        title: Center(
            child: Text(
          allData[0].name.toString(),
          style: TextStyle(color: ColorConstants.mavi2),
        )),
      ),
      body: Center(
        child: Column(
          children: [
            Divider(
              height: 25,
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorConstants.mavi2,
                ),
              ),
              child: Image.network(allData[0].image.toString()),
            ),
            Divider(
              height: 25,
            ),
            Card(
              color: ColorConstants.mavi1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 105),
                child: Column(
                  children: [
                    createListTile('İsim', allData[0].name.toString()),
                    createListTile(
                        'Cinsi', allData[0].species.toString().toUpperCase()),
                    createListTile(
                        'Doğum Yılı', allData[0].yearOfBirth.toString()),
                    createListTile('Aktör', allData[0].actor.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.mavi2,
        child: Icon(
          Icons.arrow_forward_ios,
          color: ColorConstants.mavi1,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Ahmet()),
          );
        },
      ),
    );
  }

  var url = Uri.https('hp-api.onrender.com', '/api/characters');

  Future<List<loadData>> getData() async {
    final response = await http.get(url);
    var data = jsonDecode(response.body.toString());
    var statusCode = response.statusCode;
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        allData.add(loadData.fromJson(index));
      }
      return allData;
    } else {
      return allData;
    }
  }

  ListTile createListTile(String soru, String cevap) {
    return ListTile(
      title: Text(
        soru,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorConstants.beyaz,
            fontSize: 20),
      ),
      subtitle: Text(
        cevap,
        style: TextStyle(
            color: ColorConstants.mavi2,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700),
      ),
      leading: Icon(Icons.donut_large),
      iconColor: ColorConstants.mavi2,
    );
  }
}
