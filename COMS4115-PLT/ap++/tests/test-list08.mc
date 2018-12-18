int main()
{
  list<int> a;
  int i;
  for (i=0; i<5; ++i) { 
    list_push(a, i); 
  }
  printi(#a);
  list_clear(a);
  printi(#a);
  list_push(a, 10);
  list_push(a, 20);
  list_push(a, 30);
  printi(#a);
  for (i=0; i<3; ++i) {
    printi(a[i]);
  }

  return 0;
}