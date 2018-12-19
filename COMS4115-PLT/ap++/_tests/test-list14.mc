int main()
{
  list<int> a;
  list<int> b;
  int i;

  a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  b = a[2:6];
  for (i=0; i<#b; ++i) {
    printi(b[i]);
  }

  b = a[:6];
  for (i=0; i<#b; ++i) {
    printi(b[i]);
  }
  
  b = a[6:];
  for (i=0; i<#b; ++i) {
    printi(b[i]);
  }

  b = a[:];
  for (i=0; i<#b; ++i) {
    printi(b[i]);
  }

  return 0;
}