import java.io.*;
public class FileInputOutput {
  public static void main (String[] args) throws IOException {

    for ( int i = 0; i < 1000000; ++i) {

    BufferedReader br = new BufferedReader(new FileReader("../input.txt"));
    BufferedWriter bw = new BufferedWriter(new FileWriter("output.txt"));
    String line;
    while ((line = br.readLine()) != null) {
      bw.write(line);
      bw.newLine();
    }
    br.close();
    bw.close();
 }
  }
}
