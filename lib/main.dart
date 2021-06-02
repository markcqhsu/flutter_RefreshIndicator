import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _controller = ScrollController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Scrollbar(
      body: RefreshIndicator(
        // onRefresh: (){
        //   return Future.delayed(Duration(seconds: 2));
        // },
        onRefresh: ()async{
          await Future.delayed(Duration(seconds: 5));
        },
        strokeWidth: 4.0,
        color: Colors.red,
        backgroundColor: Colors.black,
        // isAlwaysShown: true,//永遠顯示滾動條
        // controller: _controller,
        child: Scrollbar(

          child: NotificationListener(
            onNotification: (ScrollNotification _event){
              print(_event);
              return false;
            },
            child: ListView.builder(
                itemCount: 200,
                controller: _controller,
                itemBuilder: (_, index){
              return Container(
                color: Colors.blue[index %9 *100],
                height: 50,
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
