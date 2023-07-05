import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(
        //scrollDirection: Axis.horizontal, ********// use horizontal also ***********
        itemCount: 10, // Number of cells
        itemBuilder: (context, index) {
          return index == 4
              ? SizedBox(
                  height: 500,
                  width: 400,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Number of columns
                    itemBuilder: (context, columnIndex) {
                      return columnIndex == 1
                          ? Container(
                              height: 200,
                              width: 200,
                              color: Colors.red,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5, // Number of columns
                                itemBuilder: (context, columnIndex) {
                                  return Container(
                                    width: 50,
                                    height: 50, // Adjust the width as needed
                                    margin: const EdgeInsets.all(10.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: List.generate(
                                          10, // Number of cells in each column
                                          (index) => Container(
                                            height:
                                                100, // Adjust the height as needed
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            color: Colors.grey[300],
                                            child: Center(
                                              child: Text(
                                                'Cell ${index + 1}',
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              width: 150, // Adjust the width as needed
                              margin: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                    10, // Number of cells in each column
                                    (index) => Container(
                                      height:
                                          100, // Adjust the height as needed
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      color: Colors.red[200],
                                      child: Center(
                                        child: Text(
                                          'subCell 5 ${index + 1}',
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                )
              : Container(
                  // Adjust the height as needed
                  margin: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.green[200],
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(10.0),
                      child: Text(
                        'Cell ${index + 1}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
