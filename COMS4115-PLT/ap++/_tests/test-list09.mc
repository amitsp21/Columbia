int main()
{
  list<int> a;
  int i;
  for (i=0; i<5; ++i) { 
    list_push(a, i); 
  }
  printi(list_find(a, 2));
  printi(list_find(a, 6));
  return 0;
}