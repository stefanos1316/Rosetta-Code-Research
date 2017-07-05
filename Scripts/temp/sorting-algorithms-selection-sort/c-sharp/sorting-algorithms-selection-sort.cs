//Code obtained from http://cforbeginners.com/CSharp/SelectionSort.html

using System;

class Program {

static void Main(string[] args) {
for (int i  = 0; i < 1000000; ++i) {
	int[] arr = {16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85 };
	selectSort(arr);
}
}

static void selectSort(int [] arr)
{
        //pos_min is short for position of min
	int pos_min,temp;
         
	for (int i=0; i < arr.Length-1; i++)
	{
            pos_min = i;//set pos_min to the current index of array
		
                for (int j=i+1; j < arr.Length; j++)
		{
		    if (arr[j] < arr[pos_min])
                    {
                        //pos_min will keep track of the index that min is in, this is needed when a swap happens
                        pos_min = j;
                    }                                          
		}
		
        //if pos_min no longer equals i than a smaller value must have been found, so a swap must occur
        if (pos_min != i)
        {
            temp = arr[i];
            arr[i] = arr[pos_min];
            arr[pos_min] = temp;
        }
    }
}

}
