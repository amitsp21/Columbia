int main()
{
  list<int> a;
  list_push(a, 100);
  list_push(a, 101);
  printi(list_get(a, 0));
  printi(a[0]);
  printi(list_get(a, 1));
  printi(a[1]);
  list_set(a, 0, 102);
  list_set(a, 1, 103);
  printi(a[0]);
  printi(a[1]);
  a[0] = 104;
  a[1] = 105;
  printi(a[0]);
  printi(a[1]);
  return 0;
}