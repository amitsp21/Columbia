int main()
{
  list<int> a;
  list<float> b;
  list<bool> c;
  list_push(a, 1);
  list_push(b, 3.14);
  list_push(c, false);
  printi(a[0]);
  printf(b[0]);
  printb(c[0]);

  return 0;
}
