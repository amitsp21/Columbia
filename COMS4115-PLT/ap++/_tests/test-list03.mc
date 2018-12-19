int main()
{
  list<int> a;
  int i;
  int x;
  for (i=0; i<10; ++i) {
    list_push(a, i);
  }
  x = list_pop(a);
  printi(x);
  x = list_pop(a);
  printi(x);
  x = list_size(a);
  printi(x);
  return 0;
}
