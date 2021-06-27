int precedence(String c) {
  int pre = 0;
  if (c == "+" || c == "-") {
    pre = 1;
  } else if (c == "*" || c == "/") {
    pre = 2;
  }
  return pre;
}

String evaluate(String e) {
  if (e == "")
    return "";
  else {
    List<int> code = e.codeUnits;
    String val = "";
    List<String> exp = new List();
    List<String> postfix = new List();
    List<String> stack = new List();

    //converting string to parseable inorder expression

    exp.add("(");
    for (int i = 0; i < e.length; i++) {
      int x = code[i];
      if (x == 42 || x == 43 || x == 45 || x == 47) {
        if (x == 43) {
          exp.add(val);
          exp.add("+");
          val = "";
        } else if (x == 42) {
          exp.add(val);
          exp.add("*");
          val = "";
        } else if (x == 45) {
          if (code[i] == 45 && code[i + 1] - 48 >= 0 && code[i + 1] - 48 <= 9) {
            if (i > 0 && (code[i - 1] - 48 >= 0 && code[i - 1] - 48 <= 9)) {
              exp.add(val);
              exp.add("-");
              val = "";
            } else
              val = val + "-";
          } else if (i > 0 && code[i - 1] == 42 ||
              code[i - 1] == 43 ||
              code[i - 1] == 45 ||
              code[i - 1] == 47) {
            val = val + "-";
          } else {
            exp.add(val);
            exp.add("-");
            val = "";
          }
        } else if (x == 47) {
          exp.add(val);
          exp.add("/");
          val = "";
        }
      } else {
        if (x == 46)
          val = val + ".";
        else
          val = val + (x - 48).toString();
      }
    }
    exp.add(val);
    exp.add(")");

    // converting inorder to postorder expression

    for (int i = 0; i < exp.length; i++) {
      if (exp[i] == "(")
        stack.add(exp[i]);
      else if (exp[i] == "+" || exp[i] == "-") {
        if (stack.isEmpty || precedence(exp[i]) > precedence(stack.last)) {
          stack.add(exp[i]);
        } else {
          while (precedence(stack.last) >= precedence(exp[i]))
            postfix.add(stack.removeLast());
          stack.add(exp[i]);
        }
      } else if (exp[i] == "*" || exp[i] == "/") {
        stack.add(exp[i]);
      } else if (exp[i] == ")") {
        while (stack.length != 0 && stack.last != "(") {
          postfix.add(stack.removeLast());
        }
        stack.removeLast();
      } else
        postfix.add(exp[i]);
    }

    // evaluate postfix expression

    stack.clear();

    for (int i = 0; i < postfix.length; i++) {
      if (postfix[i] == "+" ||
          postfix[i] == "-" ||
          postfix[i] == "*" ||
          postfix[i] == "/") {
        double a = double.parse(stack.removeLast());
        double b = double.parse(stack.removeLast());
        switch (postfix[i]) {
          case "+":
            b = b + a;
            break;

          case "-":
            b = b - a;
            break;
          case "*":
            b = b * a;
            break;
          case "/":
            b = b / a;
            break;
        }
        stack.add(b.toString());
      } else
        stack.add(postfix[i]);
    }
    e = "";
    return stack.last;
  }
}
