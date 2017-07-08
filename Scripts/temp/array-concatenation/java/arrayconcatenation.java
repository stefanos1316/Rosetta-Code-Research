public class arrayconcatenation {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		for (int j = 0; j < 10000000; ++j) {
		
		Object[] o1 = {1,2,3,4,5}, o2 = {6,7,8,9,10}, concatArray = objArrayConcat(o1, o2);
		}
	}
	
	public static Object[] objArrayConcat(Object[] o1, Object[] o2)
	{
	  Object[] ret = new Object[o1.length + o2.length];

	  System.arraycopy(o1, 0, ret, 0, o1.length);
	  System.arraycopy(o2, 0, ret, o1.length, o2.length);

	  return ret;
	}

}

