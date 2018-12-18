int main()
{
  list<int> a;
  list<int> b;
  list<int> c;
  int i;
  c = a;
  for (i=0; i<5; ++i) { list_push(a, i); }
  b = a;
  printi(b[0]);
  printi(#b);
  list_push(b, 100);
  printi(#b);
  printi(b[#b-1]);
  list_push(c, 101);
  printi(#c);
  printi(c[#c-1]);
  list_push(a, 102);
  printi(#a);
  printi(a[#a-1]);

  return 0;
}