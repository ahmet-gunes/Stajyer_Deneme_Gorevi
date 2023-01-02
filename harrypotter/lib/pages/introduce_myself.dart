import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:harrypotter/color_constants.dart';
import 'package:harrypotter/introduce_row.dart';

class Ahmet extends StatefulWidget {
  const Ahmet({super.key});

  @override
  State<Ahmet> createState() => _AhmetState();
}

class _AhmetState extends State<Ahmet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 500,
            pinned: true,
            centerTitle: true,
            backgroundColor: ColorConstants.mavi1,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Ahmet Güneş',
                style: TextStyle(color: ColorConstants.beyaz),
              ),
              background: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.mavi1, width: 3),
                ),
                child: Image.asset(
                  'assets/images/3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.beyaz,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorConstants.mavi1, width: 3)),
                    child: Column(
                      children: [
                        introduceRow('Doğum Tarihi', '11 Ocak 2000', 100),
                        introduceRow('Doğum Yeri', 'Manisa', 100),
                        introduceRow('Hobiler', 'Futbol, Yüzme', 100),
                        introduceRow('En Sevdiğim Kitap', 'Silmarillion', 100),
                        introduceRow('En Sevdiğim Film', 'Scarface', 100),
                        introduceRow('En Sevdiğim Dizi', 'The Sopranos', 100),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    width: 444,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.mavi1, width: 3),
                    ),
                    child: Image.asset(
                      'assets/images/4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Divider(
                    height: 50,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorConstants.beyaz,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: ColorConstants.mavi1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Geri Dön'),
                  ),
                  Divider(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
