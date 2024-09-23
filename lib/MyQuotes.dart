import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myquotes/Models/QuotesModel.dart';

class MyQuotes extends StatefulWidget {
  const MyQuotes({super.key});

  @override
  State<MyQuotes> createState() => _MyQuotesState();
}

class _MyQuotesState extends State<MyQuotes> {
  QuotesModel? quotemDetails;
  List<Quotes>? ofQuotes;
  void GetApiQuotes() async {
    try {
      var quoteApi = await http.get(Uri.parse("https://dummyjson.com/quotes"));
      if (quoteApi.statusCode == 200) {
        quotemDetails = QuotesModel.fromJson(jsonDecode(quoteApi.body));
        ofQuotes = quotemDetails!.quotes;

        print(ofQuotes![0].quote);

        setState(() {});
      } else {
        print("Something went wrong");
      }
    } catch (e) {}
  }

  @override
  void initState() {
    GetApiQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          quotemDetails == null
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                      itemCount: ofQuotes!.length,
                      itemBuilder: (context, i) {
                        Quotes data = ofQuotes![i];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " Author :" + data.author.toString() ?? "N/A",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blueGrey),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(data.id.toString() ?? "N/A"),
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      "Quote: \"${data.quote.toString() ?? 'N/A'}\"",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 10,
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }))
        ],
      ),
    );
  }
}
