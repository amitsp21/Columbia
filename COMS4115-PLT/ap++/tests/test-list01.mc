void print_test(list<int> l, int idx) {
    printi(l[idx]);
    printi(list_size(l));
    return;
}

int main()
{
  /*list<int> a;
  list<int> b;
  list<int> c;
  int x;
  int i;
  x = 12;
  b = a;  
  list_push(a, 101);
  list_push(a, 102);
  list_push(a, 103 + 10);
  printi(list_get(a, 0));
  printi(list_get(a, 1));
  printi(a[2]);
  printi(b[1]);
  for (i=0; i<10; i=i+1) {
    list_push(a, i+10);
  }
  printi(#a);
  a[0] = 5;
  printi(a[0]);
  list_set(a, 1, 10);
  printi(a[1]);
  print_test(a, 1);
  a[1] = 42; 
  printi(list_size(a));
  printi(list_size(b));
  print_test(b, 1);
  */
  
  /* test list assignment */
  /* list<int> a;
  list<int> b;
  int i;
  b = a;
  list_push(a, 1);
  list_push(a, 2);
  list_push(a, 3);
  list_push(b, 100);
  printi(#a);
  printi(#b);
  for (i=0; i<#a; ++i) {
    printi(a[i]);
    printi(b[i]);
  }*/
  list<int> a;
  list<int> b;
  list<int> c;
  int i;
  for (i=0; i<5; ++i) { list_push(a, i); }
  b = a[2:5];
  c = a;
  printi(b[0]);
  printi(#b);
  printi(#c);
  return 0;
}
