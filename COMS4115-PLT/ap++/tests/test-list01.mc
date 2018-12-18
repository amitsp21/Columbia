void print_test(list<int> l, int idx) {
    printi(l[idx]);
    printi(list_size(l));
    return;
}

/*int main()
{
  list<int> a;
  list<int> b;
  list<int> c;
  int x;
  int i;
  x = 12;
  b = a;  
  list_push(a, 101);
  list_push(a, 102);
  list_push(a, 103);
  printi(list_get(a, 0));
  printi(list_get(a, 1));
  printi(a[2]);
  printi(b[1]);
  for (i=0; i<10; i=i+1) {
    list_push(a, i);
  }
  printi(#a);
  a[0] = 5;
  printi(a[0]);
  list_set(a, 1, 10);
  printi(a[1]);
  print_test(a, 1);
  a[1] = 42; 
  printi(list_size(a));
  print_test(b, 1);

  list<int> a;
  int i;
  list_push(a, 10);
  list_push(a, 20);
  printi(list_size(a));
  printi(a[1]);
  list_pop(a);
  printi(list_size(a));
  return 0;
}
*/

int main()
{
  list<int> a;
  int i;
  for (i=0; i<10; i=i+1) {
    list_push(a, i);
  }
  return 0;
}
