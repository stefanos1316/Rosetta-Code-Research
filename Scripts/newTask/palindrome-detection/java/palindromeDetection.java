
public class palindromeDetection {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for (int i = 0; i < 1000000000; ++i) {
			boolean results = pali("saippuakivikauppias");
		}
	}

	public static boolean pali(String testMe) {
		StringBuilder sb = new StringBuilder(testMe);
		return testMe.equals(sb.reverse().toString());
	}

}

