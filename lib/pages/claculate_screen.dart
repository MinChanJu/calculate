import 'package:flutter/material.dart';

class ClaculateScreen extends StatefulWidget {
  @override
  _ClaculateScreenState createState() => _ClaculateScreenState();
}

class _ClaculateScreenState extends State<ClaculateScreen> {
  String last = "0";
  String current = "0";
  String opperate = "+";
  String total = "";
  String exp = "";

  void calculate(String op) {
    if (opperate == "=" &&
        op != "+" &&
        op != "-" &&
        op != "X" &&
        op != "/" &&
        op != "." &&
        op != "+/-" &&
        op != "%") {
      last = "0";
      current = "0";
      opperate = "+";
      total = "";
      exp = "";
    } else if (opperate == "=") {
      last = current;
      total = "";
    }
    if (op == "C") {
      last = "0";
      current = "0";
      opperate = "+";
      total = "";
    } else if (op == "0") {
      current += "0";
    } else if (op == "1") {
      current += "1";
    } else if (op == "2") {
      current += "2";
    } else if (op == "3") {
      current += "3";
    } else if (op == "4") {
      current += "4";
    } else if (op == "5") {
      current += "5";
    } else if (op == "6") {
      current += "6";
    } else if (op == "7") {
      current += "7";
    } else if (op == "8") {
      current += "8";
    } else if (op == "9") {
      current += "9";
    } else if (op == "+") {
      total += current + " + ";
      if (opperate == "+") {
        last = (double.parse(last) + double.parse(current)).toString();
      } else if (opperate == "-") {
        last = (double.parse(last) - double.parse(current)).toString();
      } else if (opperate == "X") {
        last = (double.parse(last) * double.parse(current)).toString();
      } else if (opperate == "/") {
        last = (double.parse(last) / double.parse(current)).toString();
      }
      current = "0";
      opperate = "+";
    } else if (op == "-") {
      total += current + " - ";
      if (opperate == "+") {
        last = (double.parse(last) + double.parse(current)).toString();
      } else if (opperate == "-") {
        last = (double.parse(last) - double.parse(current)).toString();
      } else if (opperate == "X") {
        last = (double.parse(last) * double.parse(current)).toString();
      } else if (opperate == "/") {
        last = (double.parse(last) / double.parse(current)).toString();
      }
      current = "0";
      opperate = "-";
    } else if (op == "X") {
      total += current + " X ";
      if (opperate == "+") {
        last = (double.parse(last) + double.parse(current)).toString();
      } else if (opperate == "-") {
        last = (double.parse(last) - double.parse(current)).toString();
      } else if (opperate == "X") {
        last = (double.parse(last) * double.parse(current)).toString();
      } else if (opperate == "/") {
        last = (double.parse(last) / double.parse(current)).toString();
      }
      current = "0";
      opperate = "X";
    } else if (op == "/") {
      total += current + " / ";
      if (opperate == "+") {
        last = (double.parse(last) + double.parse(current)).toString();
      } else if (opperate == "-") {
        last = (double.parse(last) - double.parse(current)).toString();
      } else if (opperate == "X") {
        last = (double.parse(last) * double.parse(current)).toString();
      } else if (opperate == "/") {
        last = (double.parse(last) / double.parse(current)).toString();
      }
      current = "0";
      opperate = "/";
    } else if (op == "=") {
      if (total != "") {
        total += current + " = ";
      }
      if (opperate == "+") {
        current = (double.parse(last) + double.parse(current)).toString();
      } else if (opperate == "-") {
        current = (double.parse(last) - double.parse(current)).toString();
      } else if (opperate == "X") {
        current = (double.parse(last) * double.parse(current)).toString();
      } else if (opperate == "/") {
        current = (double.parse(last) / double.parse(current)).toString();
      }
      if (double.parse(current) != double.infinity &&
          double.parse(current) == double.parse(current).toInt()) {
        current = double.parse(current).toInt().toString();
      }
      last = "0";
      opperate = "=";
    } else if (op == ".") {
      if (!current.contains(".")) {
        current += ".";
      }
    } else if (op == "%") {
      current = (double.parse(current) * 0.01).toString();
    } else if (op == "+/-") {
      if (current != "0") {
        current = (double.parse(current) * -1).toString();
      }
    } else if (op == "<-") {
      current = current.substring(0, current.length - 1);
      if (current == "") {
        current = "0";
      }
    }

    if (opperate == "+") {
      exp = (double.parse(last) + double.parse(current)).toString();
    } else if (opperate == "-") {
      exp = (double.parse(last) - double.parse(current)).toString();
    } else if (opperate == "X") {
      exp = (double.parse(last) * double.parse(current)).toString();
    } else if (opperate == "/") {
      exp = (double.parse(last) / double.parse(current)).toString();
    }
    if (double.parse(exp) != double.infinity &&
        double.parse(exp) == double.parse(exp).toInt()) {
      exp = double.parse(exp).toInt().toString();
    }

    if (!current.contains(".") &&
        double.parse(current) == double.parse(current).toInt()) {
      current = double.parse(current).toInt().toString();
    }
    setState(() {});
  }

  Widget buildButton(String str, double width, double height) {
    return SizedBox(
      width: width * 0.25,
      height: height * 0.12,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90.0), // 모서리 둥글게 설정
            ),
            padding: EdgeInsets.zero,
          ),
          child: Text(
            str,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          onPressed: () => calculate(str),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromARGB(255, 58, 57, 57),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.38,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 40.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 179, 178, 177),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(total,
                            style: TextStyle(
                              fontSize: 30,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 37, 145, 86),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          current + " ",
                          style: TextStyle(
                            fontSize: 40,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          exp,
                          style: TextStyle(
                            fontSize: 30,
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 77, 76, 76),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("C", screenWidth, screenHeight),
                    buildButton("%", screenWidth, screenHeight),
                    buildButton("/", screenWidth, screenHeight),
                    buildButton("<-", screenWidth, screenHeight),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7", screenWidth, screenHeight),
                    buildButton("8", screenWidth, screenHeight),
                    buildButton("9", screenWidth, screenHeight),
                    buildButton("X", screenWidth, screenHeight),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", screenWidth, screenHeight),
                    buildButton("5", screenWidth, screenHeight),
                    buildButton("6", screenWidth, screenHeight),
                    buildButton("-", screenWidth, screenHeight),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", screenWidth, screenHeight),
                    buildButton("2", screenWidth, screenHeight),
                    buildButton("3", screenWidth, screenHeight),
                    buildButton("+", screenWidth, screenHeight),
                  ],
                ),
                Row(
                  children: [
                    buildButton("+/-", screenWidth, screenHeight),
                    buildButton("0", screenWidth, screenHeight),
                    buildButton(".", screenWidth, screenHeight),
                    buildButton("=", screenWidth, screenHeight),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
