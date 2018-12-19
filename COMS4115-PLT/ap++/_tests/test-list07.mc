void list_push2(list<int> l, int val) {
  list_push(l, val);
  return;  
}

int list_size2(list<int> l) {
  return #l;
}

int main()
{
  list<int> a;
  int i;
  for (i=0; i<5; ++i) { 
    list_push(a, i); 
  }
  list_push2(a, 100);
  list_push2(a, 101);
  for (i=0; i<#a; ++i) {
    printi(a[i]);
  }
  printi(list_size2(a));

  return 0;
}