import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:madproject/model.dart';
import 'package:http/http.dart' as http;

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  // ignore: deprecated_member_use
  List<Model> sayurans = List<Model>();

  Future getsayuranFromSheet() async {
    var raw = await http.get(Uri.parse(
        "https://script.googleusercontent.com/macros/echo?user_content_key=qX-74SobwioQjkBfRUIe7Vi2Qi1Omctu9oSfRcSif59F5kBtiFs5rDhGWMPeQSZBdqTrRc-o7uP59IXqcnzH35TNSvaTuDiEm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJUE1uDdq6XpduCvIwfts-b9kEjw1PdIj40nopfuQfiqp8gpJGqrpyMP2HgZP5km-q808P6Snrn5wst47byGTGu0qdcaGJkLbtz9Jw9Md8uu&lib=MTIJG_DVE9eAKpycN-HGi3rkXNTQELD38"));
    var jsonsayuran = jsonDecode(raw.body);

    jsonsayuran.forEach((element) {
      Model kude = new Model();

      kude.image = element['image'];
      kude.title = element['title'];
      kude.publisher = element['publisher'].toString();
      kude.price = element['price'].toString();
      kude.availability = element['availability'].toString();

      sayurans.add(kude);
    });
  }

  @override
  void initState() {
    getsayuranFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English Books"),
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: sayurans.length,
            itemBuilder: (context, index) {
              return Sayurantile(
                image: sayurans[index].image,
                title: sayurans[index].title,
                publisher: sayurans[index].publisher,
                price: sayurans[index].price,
                availability: sayurans[index].availability,
              );
            }),
      ),
    );
  }
}

@override
class Sayurantile extends StatelessWidget {
  final String image, title, publisher, price, availability;
  Sayurantile(
      {this.image, this.title, this.publisher, this.price, this.availability});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              height: size.height * 0.3,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              )),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 5,
                    )),
                Text(publisher),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text(price),
                    SizedBox(height: 40),
                    Text(availability),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
