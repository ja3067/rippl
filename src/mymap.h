#ifndef MAP
#define MAP

struct List *map(struct List *list, struct Thunk *func);

struct List *filter(structList *list, struct Thunk *filter);

#endif