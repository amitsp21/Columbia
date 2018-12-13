#include <stdio.h>
#include <stdlib.h>

struct List {
	int size;
	int src_size;
	int* src;
};

int list_get(struct List* list, int idx) {
	return list->src[idx];
}

void list_push(struct List* list, int val) {
	int size = list->src_size;
        list->src[size+1] = val;
}

int main() {
	struct List l;
        int a[3];
	l.src = a;
        list_push(&l, 42);
	return 0;
}
