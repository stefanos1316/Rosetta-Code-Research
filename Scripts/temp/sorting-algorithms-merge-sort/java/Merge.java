import java.util.Arrays;

public class Merge {

 public static void main(String[] args) {

	for (int i = 0; i < 1000000; ++i) {
	int[] array = {16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85};
	benchmarkMergeSort(array);
	}
 }	



  public static int[] mergeSort(int[] array)
    {
        if (array.length == 1)
        {
            return array;
        }

        int[] array1 = new int[(array.length/2)];
        int[] array2 = new int[(array.length-array1.length)];

        System.arraycopy(array, 0, array1, 0, array1.length);
        System.arraycopy(array, array1.length, array2, 0, array2.length);

        mergeSort(array1);
        mergeSort(array2);

        merge(array1, array2, array);
        return array;
    }

    /**
     * Merges 2 sorted arrays of ints
     * @param array1
     * @param array2
     * @param mergedArray
     * @return
     */
    static void merge(int[] array1, int[] array2, int[] mergedArray)
    {
        int array1Index = 0;
        int array2Index = 0;
        int pos = 0;
        while ((array1Index < array1.length) && (array2Index < array2.length))
        {
            if (array1[array1Index] < array2[array2Index])
            {
                mergedArray[pos] = array1[array1Index];
                array1Index++;
                pos++;
            } else
            {
                mergedArray[pos] = array2[array2Index];
                array2Index++;
                pos++;
            }
        }

        if (array1Index < array2Index)
        {
            System.arraycopy(array1, array1Index, mergedArray, pos, array1.length - array1Index);
        }
        else if (array2Index < array1Index) ;
        {
            System.arraycopy(array2, array2Index, mergedArray, pos, array2.length - array2Index);
        }
    }

    /**
     * Helping method to benchmark merge sort's execution time
     * @param array
     */
    static void benchmarkMergeSort(int[] array)
    {

        mergeSort(array);
	}
}
