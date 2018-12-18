int main()
{
  list<int> a;
  list<int> b;
  int i;
  for (i=0; i<10; ++i) { 
    list_push(a, i); 
  }
  b = a[2:7];
  printi(#b);
  for (i=0; i<#b; ++i) { 
    printi(b[i]);
  }

  return 0;
}