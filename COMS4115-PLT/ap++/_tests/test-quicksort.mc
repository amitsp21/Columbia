/* merges two sorted sublists of arr[] (arr[0..m], arr[m+1..r]) in-place with QuickSort algorithm */

int partition(list<int> a, int low, int high)
{
    int i;
    int j;
    int pivot;
    int temp;

    pivot = a[high];  
    i = (low - 1);
    for (j = low; j <= high - 1; j++)
    {
        if (a[j] <= pivot)
        {
            i++;
            temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }
    }
    temp = a[i+1];
    a[i+1] = a[high];
    a[high] = temp;
    return (i + 1);
}

void quickSortImpl(list<int> a, int low, int high)
{
    int pi;
    if (low < high)
    {
        pi = partition(a, low, high);
        quickSortImpl(a, low, pi - 1);
        quickSortImpl(a, pi + 1, high);
    }
    return;
}

void quickSort(list<int> a) 
{
    quickSortImpl(a, 0, #a - 1);
    return;
}

int main() 
{
    list<int> a;
    int i;
 
    for (i=10; i >= 0; --i) { 
      list_push(a, i);
    }

    quickSort(a);

    for (i=0; i<#a; ++i) { 
      printi(a[i]);
    } 

    return 0;
}
