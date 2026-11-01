
#include <stdio.h>

int longestSubarray(int arr[], int n, int k)
{
    int start = 0, sum = 0, max = 0;
    int i, len;

    for(i = 0; i < n; i++)
    {
        sum = sum + arr[i];

        while(sum > k)
        {
            sum = sum - arr[start];
            start++;
        }

        len = i - start + 1;

        if(len > max)
        {
            max = len;
        }
    }

    return max;
}

int main()
{
    int arr[100], n, k, i, result;

    printf("Enter number of elements: ");
    scanf("%d", &n);

    printf("Enter array elements:\n");
    for(i = 0; i < n; i++)
    {
        scanf("%d", &arr[i]);
    }

    printf("Enter value of K: ");
    scanf("%d", &k);

    result = longestSubarray(arr, n, k);

    printf("Longest subarray length = %d", result);

    return 0;
}
