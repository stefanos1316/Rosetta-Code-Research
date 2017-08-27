public class RegularExpressions {

 public static void main(String[] args) {

  for (int i = 0; i < 10000000; ++i) {
  String str = "this is a matching string";
    if (str.matches(".*string")) { // note: matches() tests if the entire string is a match

    }
    String result = str.replaceAll("string", "istyfied");
  }
 }

}
