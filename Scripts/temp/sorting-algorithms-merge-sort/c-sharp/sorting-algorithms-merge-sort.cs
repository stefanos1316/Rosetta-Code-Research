using System;
using System.Collections.Generic;
using System.Text;
namespace prog
{
    class Program
    {
        static public void mergemethod(int [] numbers, int left, int mid, int right)
        {
            int [] temp = new int[100];
            int i, left_end, num_elements, tmp_pos;
            left_end = (mid - 1);
            tmp_pos = left;
            num_elements = (right - left + 1);
            while ((left <= left_end) && (mid <= right))
            {
                if (numbers[left] <= numbers[mid])
                    temp[tmp_pos++] = numbers[left++];
                else
                    temp[tmp_pos++] = numbers[mid++];
            }
            while (left <= left_end)
                temp[tmp_pos++] = numbers[left++];
            while (mid <= right)
                temp[tmp_pos++] = numbers[mid++];
            for (i = 0; i < num_elements; i++)
            {
                numbers[right] = temp[right];
                right--;
            }
 
        }
        static public void sortmethod(int [] numbers, int left, int right)
        {
          int mid;
          if (right > left)
          {
            mid = (right + left) / 2;
            sortmethod(numbers, left, mid);
            sortmethod(numbers, (mid + 1), right);
            mergemethod(numbers, left, (mid+1), right);
 
          }
        }
        static void Main(string[] args)
        {
 
	for (int i = 0; i < 1000000; ++i) {
            int[] numbers = { 16,93,-99,95,-96,-24,-53,-71,96,-66,-21,72,-12,-32,-96,62,-42,-50,49,53,-65,52,-25,-69,88,-43,60,66,-94,-69,53,-71,-17,-58,-30,32,-16,-94,-42,-86,59,-53,94,97,-12,15,65,-35,-12,-82,-82,48,-48,66,-42,-63,33,-49,41,-85,94,66,-60,60,-65,-73,-50,-9,-48,-3,15,-77,81,95,-93,83,-21,34,-78,-61,-22,-58,65,78,41,-7,-59,20,88,-38,-15,-69,42,97,-35,61,8,2,-22,-85 };
            int len = numbers.Length;
            sortmethod(numbers, 0, len - 1);
	 }
         }
   }
}

