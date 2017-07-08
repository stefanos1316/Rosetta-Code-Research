import java.util.Arrays;

public class Insertion {

public static void main(String[] args)
{

	for (int j = 0; j < 1000000; ++j) {	
	int[] array = {16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85};
	insertionSort(array);

	}
    }


 static int[] insertionSort(int[] array)
    {
        long start = System.currentTimeMillis();
        int j;
        for (int i = 1; i < array.length; i++)
        {
            int key = array[i];

            for (j = i - 1; (j >= 0) && (key < array[j]); j--)
            {
                array[j + 1] = array[j];
            }
            array[j + 1] = key;
        }
        return array;
 }
}
