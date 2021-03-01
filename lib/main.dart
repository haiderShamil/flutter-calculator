import 'package:flutter/material.dart';

void main() => runApp(MyCalculator());

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'haider',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text="0";
  double numOne = 0;
  double numTwo = 0;

  String result = '0';
  String finalResult = '0';

  String opr = '';
  String preOpr = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("C",  Colors.blue),
                button("+/-",  Colors.blue),
                button("%",  Colors.blue),
                button("/",  Colors.blue),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("7", Color.fromRGBO(181,181,181,1)),
                button("8", Color.fromRGBO(181,181,181,1)),
                button("9", Color.fromRGBO(181,181,181,1)),
                button("x",  Colors.blue),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("4", Color.fromRGBO(181,181,181,1)),
                button("5", Color.fromRGBO(181,181,181,1)),
                button("6", Color.fromRGBO(181,181,181,1)),
                button("-",  Colors.blue),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("1", Color.fromRGBO(181,181,181,1)),
                button("2", Color.fromRGBO(181,181,181,1)),
                button("3", Color.fromRGBO(181,181,181,1)),
                button("+", Colors.blue),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("0", Color.fromRGBO(181,181,181,1)),
                button(".", Color.fromRGBO(181,181,181,1)),
                button("00", Color.fromRGBO(181,181,181,1)),
                button("=", Colors.amber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  Text('design by haider',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 12
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget button(String btnTxt, Color color)
  {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        onPressed: (){
          calculate(btnTxt);
        },
        child: Text(btnTxt,
          style: TextStyle(
              fontSize: 30
          ),
        ),
        color: color,
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
      ),
    );
  }
  void calculate (txtBtn)
  {
    if (txtBtn=='C')
      {
         text="0";
         numOne = 0;
         numTwo = 0;

         result = '0';
         finalResult = '0';

         opr = '';
         preOpr = '';
      }
    else if (opr == '=' && txtBtn =='=')
      {
        switch (preOpr)
        {
          case '+':
            finalResult = add();
            break;
          case '-':
            finalResult = sub();
            break;
          case 'x':
            finalResult = mul();
            break;
          case '/':
            finalResult = div();
            break;

        }
      }
    else if (txtBtn == '+' || txtBtn == '-'|| txtBtn == 'x'|| txtBtn == '/' || txtBtn=='=')
      {
        if (numOne==0)
          {
            numOne = double.parse(result);
          }
        else
          {
            numTwo = double.parse(result);
          }
        switch (opr)
        {
          case  '+':
            finalResult = add();
            break;
          case  '-':
            finalResult = sub();
            break;
          case  'x':
            finalResult = mul();
            break;
          case  '/':
            finalResult = div();
            break;
        }
        preOpr = opr;
        opr = txtBtn;
        result = '';
      }
    else if (txtBtn == '%')
      {
        result = (numOne / 100).toString();
        finalResult = result;
      }
    else if (txtBtn == '.')
      {
        if (!result.contains('.'))
          result += '.';
        finalResult = result;
      }
    else if (txtBtn == '+/-')
      {
        result.startsWith('-') ? result = result.substring(1) : result = '-' +result;
        finalResult = result;
      }
    else {
      if (result == '0')
        result = txtBtn;
      else
      result = result+txtBtn;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }
  String add()
  {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return decRem(result);
  }
  String sub()
  {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return decRem(result);
  }
  String mul()
  {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return decRem(result);
  }
  String div()
  {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return decRem(result);
  }
  String decRem (String _result)
  {
    if (_result.contains('.'))
      {
        List<String> split = _result.split('.');
        if (!(int.parse(split[1]) > 0 ))
          return split[0];
      }
    return result;
  }
}







