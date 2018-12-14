/*
 * "Hello World" - Literal Print Test
 */

int main()
{
  list<int> a;
  list<int> b;
  b = a;
  list_push(a, 101);
  list_push(a, 102);
  list_push(a, 103);
  printi(list_get(a, 0));
  printi(list_get(a, 1));
  printi(a[2]);
  printi(b[1]);

  prints("list size:");
  printi(list_size(a));

  /* bug, outputs 0 but should be 3 */
  printi(list_size(b));
  /* todo */
  /* a[2] = 3; 
     list<int> c = [0, 1, 2, 3];
     list_pop(c);
     list_insert(list, idx, val);
     list_remove(list, val);
     list_index(list, val);
  */
  return 0;
}
