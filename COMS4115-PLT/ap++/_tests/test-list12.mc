int main()
{
  list<int> a;
  int i;
  for (i=0; i<5; ++i) { 
    list_push(a, i); 
  }
  list_rev(a);
  for (i=0; i<#a; ++i) { 
    printi(a[i]);
  }
  list_insert(a, 0, 5);
  list_rev(a);
  for (i=0; i<#a; ++i) { 
    printi(a[i]);
  }

  return 0;
}