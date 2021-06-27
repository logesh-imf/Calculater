import 'package:flutter/material.dart';
import 'evaluation.dart';

void main() {
  runApp(MyCal());
}

class MyCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String a = "";
  String finalAns = " ";
  double fsize = 35, tempSize = 25;

  Color col = Colors.black;
  Color tempColor = Colors.grey;

  void addOp(String c) {
    setState(() {
      fsize = 35;
      tempSize = 25;
      col = Colors.black;
      tempColor = Colors.grey;
      if (c != "C") {
        a = a + c;
      } else if (c == "C") {
        a = "";
        finalAns = " ";
        fsize = 35;
        col = Colors.black;
      } else
        a += c;
    });
    tempCalc();
  }

  void tempCalc() {
    setState(() {
      tempSize = 25;
      tempColor = Colors.grey;
      finalAns = evaluate(a);
    });
  }

  void cal() {
    setState(() {
      tempColor = Colors.black;
      tempSize = 50;
      finalAns = evaluate(a);
      fsize = 28;
      col = Colors.grey;
    });
  }

  void erase() {
    setState(() {
      fsize = 35;
      tempSize = 25;
      col = Colors.black;
      tempColor = Colors.grey;
      a = a.substring(0, a.length - 1);
    });
    tempCalc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.indigo,
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    '$a',
                    style: TextStyle(fontSize: fsize, color: col),
                    textAlign: TextAlign.right,
                  ),
                  color: Colors.white24,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  child: Text(
                    '$finalAns',
                    style: TextStyle(fontSize: tempSize, color: tempColor),
                    textAlign: TextAlign.right,
                  ),
                  color: Colors.white24,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlineButton(
                                onPressed: () => addOp("1"),
                                child: Text(
                                  "1",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("2"),
                                child: Text(
                                  "2",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("3"),
                                child: Text(
                                  "3",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                              onPressed: erase,
                              child: Icon(
                                Icons.backspace,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlineButton(
                                onPressed: () => addOp("4"),
                                child: Text(
                                  "4",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("5"),
                                child: Text(
                                  "5",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("6"),
                                child: Text(
                                  "6",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("/"),
                                child: Text(
                                  "/",
                                  style: TextStyle(fontSize: 30),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlineButton(
                                onPressed: () => addOp("7"),
                                child: Text(
                                  "7",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("8"),
                                child: Text(
                                  "8",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("9"),
                                child: Text(
                                  "9",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("*"),
                                child: Text(
                                  "*",
                                  style: TextStyle(fontSize: 30),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlineButton(
                                onPressed: () => addOp("."),
                                child: Text(
                                  ".",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("0"),
                                child: Text(
                                  "0",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("+"),
                                child: Text(
                                  "+",
                                  style: TextStyle(fontSize: 30),
                                )),
                            OutlineButton(
                                onPressed: () => addOp("-"),
                                child: Text(
                                  "-",
                                  style: TextStyle(fontSize: 30),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width - 95,
                              child: Container(
                                color: Colors.indigo.shade300,
                                child: OutlineButton(
                                  onPressed: cal,
                                  child: Text(
                                    "=",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey.shade300,
                              width: 92,
                              child: OutlineButton(
                                  onPressed: () => addOp("C"),
                                  child: Text(
                                    "C",
                                    style: TextStyle(fontSize: 30),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
