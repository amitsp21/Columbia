int main()
{
  list<int> a;
  int i;
  for (i=0; i<5; ++i) { 
    list_push(a, i); 
  }

  list_insert(a, 0, 99);
  printi(#a);
  for (i=0; i<#a; ++i) { 
    printi(a[i]);
  }
  
  list_insert(a, #a-1, 101);
  printi(#a);
  for (i=0; i<#a; ++i) { 
    printi(a[i]);
  }

  list_insert(a, #a, 102);
  printi(#a);
  for (i=0; i<#a; ++i) { 
    printi(a[i]);
  }

  list_insert(a, 2, 103);
  printi(#a);
  for (i=0; i<#a; ++i) { 
    printi(a[i]);
  }

  return 0;
}