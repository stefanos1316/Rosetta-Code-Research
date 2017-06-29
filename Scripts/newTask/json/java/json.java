import com.google.gson.Gson;
//import gson/gson/src/main/java/com.google.gson.Gson;

public class json {

	public static void main(String[] args) {
		Gson gson = new Gson();
		String json = "{ \"foo\": 1, \"bar\": [ \"10\", \"apples\"] }";
	
		for (int i = 0; i < 10000000; ++i) {	
		
		json = "{ \"foo\": 1, \"bar\": [ \"10\", \"apples\"] }";
		
		MyJsonObject obj = gson.fromJson(json, MyJsonObject.class);
		
		obj = new MyJsonObject(2, new String[] { "{ \"blue\":[\"1\", \"2\"], \"ocean\": \"water\"}" });
		json = gson.toJson(obj);
		}
	}
	
}

class MyJsonObject {
	
	private int foo;
	private String[] bar;
	
	public MyJsonObject(int foo, String[] bar) {
		this.foo = foo;
		this.bar = bar;
	}
	
	public int getFoo() {
		return foo;
	}
	
	public String[] getBar() {
		return bar;
	}
	
}
