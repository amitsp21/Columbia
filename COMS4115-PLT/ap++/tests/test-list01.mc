/*
 * "Hello World" - Literal Print Test
 */

int main()
{
  list<int> a;
  list<int> b;
  list<int> c;
  b = a;
  list_push(a, 101);
  list_push(a, 102);
  list_push(a, 103);
  printi(list_get(a, 0));
  printi(list_get(a, 1));
  printi(a[2]);
  printi(b[1]);
  printi(list_size(a));
  printi(list_pop(a));
  printi(list_size(a));
  return 0;
}
