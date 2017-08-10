public class Exp{
   public static void main(String[] args){
    for (int i = 0; i < 1000000000; ++i ) {
	pow(2017, 12);
      	pow(19.88, 12); 
	}
   }

   public static double pow(double base, int exp){
      if(exp < 0) return 1 / pow(base, -exp);
      double ans = 1.0;
      for(;exp > 0;--exp) ans *= base;
      return ans;
   }
}
