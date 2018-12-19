int main()
{
  list<int> a;
  int i;
  for (i=0; i<5; ++i) { 
    list_push(a, i); 
  }
  list_remove(a, 3);
  for (i=0; i<#a; ++i) { 
    printi(a[i]); 
  }
  list_remove(a, 9);
  printi(#a);
  list_remove(a, 4);
  for (i=0; i<#a; ++i) {
    printi(a[i]);
  }
  return 0;
}