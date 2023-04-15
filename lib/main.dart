// Haralds Upītis ChiliLabs Flutter assignment

import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Haralds Upītis ChiliLabs Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GiphyGif? _gif;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 56,
                color: Colors.red,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      floating: true,
                      pinned: true,
                      snap: false,
                      centerTitle: true,
                      title: Container(
                        alignment: Alignment.center,
                        height: 40,
                        color: Colors.white,
                        child: Center(
                          child: TextField(
                            onTap: () async {
                              // request your Giphy API key at https://developers.giphy.com/
                              final gif = await GiphyPicker.pickGif(
                                context: context,
                                // YOUR GIPHY APIKEY HERE
                                apiKey: '9LfPqT6u76zSlPCBZbThLpVdj480ZcG3',
                              );

                              if (gif != null) {
                                setState(() => _gif = gif);
                              }
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 5, 14.0),
                              hintText: 'Click here to search for a GIF',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Center(
            child: Text(
              'Gifs will appear here :)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
