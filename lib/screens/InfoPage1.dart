import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage1 extends StatefulWidget {
  final String recognizedText;
  const InfoPage1(this.recognizedText, {super.key});

  @override
  State<InfoPage1> createState() => _InfoPage1State();
}

class _InfoPage1State extends State<InfoPage1> {

  Map<String, dynamic> brandnameRecognition(String text){
    List<Map<String, dynamic>> brandlist = [
      {
        'name':'UNIQLO',
        'score': "2"
      },
      {
        'name':'H&M',
        'score': "1"
      },
      {
        'name':'patágonia',
        'score': "3"
      },
      {
        'name':'Levis',
        'score': "3"
      },
      {
        'name':'ZARA',
        'score': "2"
      },
    ];
    Map<String, dynamic> recognizedBrand = {};

    int i = 0;
    for(i; i<brandlist.length; i++){
      if(text.contains(brandlist[i]['name'])){
        recognizedBrand = brandlist[i];
        break;
      }
    }
    return recognizedBrand;
  }

  @override
  Widget build(BuildContext context) {
    final brand = brandnameRecognition(widget.recognizedText);
    return Scaffold(
        appBar: AppBar(
          title: Text('PANDRIP',
            style: GoogleFonts.pacifico(
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFFF2E8CF),
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          /*
          children:<Widget>[
            Container(
              child: brand['name'],
            ),
            Container(
              child: brand['score'],
            ),
          ],
          */
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Text(widget.recognizedText),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Recognized Text",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                  text: widget.recognizedText),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Copied to Clipboard'),
                              ),
                            );},
                          icon: const Icon(Icons.copy),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(widget.recognizedText),
                  ],
                )
            ),
          ],
        ),
    );
  }
}
