import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyWidgetCalculApp extends StatefulWidget {
  const MyWidgetCalculApp({super.key});

  @override
  State<MyWidgetCalculApp> createState() => _MyWidgetCalculAppState();
}

class _MyWidgetCalculAppState extends State<MyWidgetCalculApp> {
  List sym = [
    "AC",
    "C",
    "<",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "+/-",
    "0",
    ".",
    "=",
  ];

  var input = "";
  var output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Flutter Calculator",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.blue.shade800,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              input,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              output, 
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 150),
          GridView.builder(
            itemCount: sym.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  if (sym[i] == "AC") {
                    setState(() {
                      input = "";
                      output = "";
                    });
                    
                  } else if (sym[i] == "C") {
                    setState(() {
                      input = input.substring(0, input.length - 1);
                    });
                  } else if (sym[i] == "/" ||
                      sym[i] == "*" ||
                      sym[i] == "-" ||
                      sym[i] == "+") {
                    if (input.endsWith('/') ||
                        input.endsWith('*') ||
                        input.endsWith('-') ||
                        input.endsWith('+')) {
                      null;
                    } else {
                      setState(() {
                        input += sym[i];
                      });
                    }

                    
                  } else if (sym[i]=="=" ){
                    try {
                      Expression  exp=Parser().parse(input);
                    double result=exp.evaluate(EvaluationType.REAL, ContextModel());
                  if (result.isInfinite || result.isNaN) {
                    setState(() {
                      output = "Error..... Try agin  ";
                    });
              
                    
                  }else{
                    setState(() {
                      output=result.toString();
                      
                      
                    });
                  }
                  
                  
                    
                    } catch (e) {
                      setState(() {
                        output= "jddjjd";
                      });
                    }
                    
                 
                 
                  }

                  
                   else {
                    setState(() {
                      input += sym[i];
                    });
                  }
                  ;
                },
                child: Container(
                  decoration: BoxDecoration(color: myBackColors(sym[i])),
                  margin: EdgeInsets.all(5),

                  alignment: Alignment.center,
                  child: Text(
                    sym[i],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Color myBackColors(String x) {
    if (x == "<") {
      return Colors.yellow.shade200;
    } else if (x == "/") {
      return Colors.yellow.shade200;
    } else if (x == "*") {
      return Colors.yellow.shade200;
    } else if (x == "-") {
      return Colors.yellow.shade200;
    } else if (x == "+") {
      return Colors.yellow.shade200;
    } else if (x == "=") {
      return Colors.yellow.shade200;
    } else {
      return Colors.blue;
    }
  }
 
}
