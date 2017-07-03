public class Factorial {

public static void main(String[] args) {
	
	for (int i = 0; i < 1000000; ++i)
		fact(1000);
}

public static long fact(final int n) {
    if (n < 0){
        System.err.println("No negative numbers");
        return 0;
    }
    return (n < 2) ? 1 : n * fact(n - 1);
}

}
