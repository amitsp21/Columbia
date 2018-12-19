int main()
{
  list<int> a;
  list<float> b;
  list<bool> c;
  int i;

  a = [0, 1, 2, 3];
  for (i=0; i<#a; ++i) {
    printi(a[i]);
  }

  b = [0.2, 1.1, 2.4, 3.14];
  for (i=0; i<#b; ++i) {
    printf(b[i]);
  }

  c = [true, true, false, true];
  for (i=0; i<#c; ++i) {
    printb(c[i]);
  }

  return 0;
}