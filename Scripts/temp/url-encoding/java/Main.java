import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Main
{
    public static void main(String[] args) throws UnsupportedEncodingException
    {
     for (int i = 0; i < 1000000; ++i) {
        String normal = "http://foo bar/";
        String encoded = URLEncoder.encode(normal, "utf-8");
        System.out.println(encoded);
     }
    }
}
