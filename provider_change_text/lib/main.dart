import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyHomePage());



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context)=>Data(),
      child: MaterialApp(
          home:Scaffold(
            appBar: AppBar(
              title: Text("SAMPLE PROVIDER TEXT CHANGE"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyHomePage2(),
                  SizedBox(
                    height: 20,
                  ),
                  MyHomePage1(),

               
                ],
              ),
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          ),
      ),
    );


  }
}

class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of<Data>(context).inputData,
      style: TextStyle(fontSize: 24),
    );
  }
}


class MyHomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        Provider.of<Data>(context, listen: false).changeData(value);
        print(value);
      }
    );
  }
}

class Data with ChangeNotifier {
  String inputData = "Default Text";

  void changeData(String txt) {
    inputData = txt;

    notifyListeners();
  }
}
