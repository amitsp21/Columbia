void print_test(list<int> l, int idx) {
    printi(l[idx]);
    printi(list_size(l));
    return;
}

int main()
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
  return 0;
}
