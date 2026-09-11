#ifndef __HEAP_H__
#define __HEAP_H__

void  heap_init(void);
void* malloc(unsigned int n);
void  free(void *p);
void* calloc(unsigned int count, unsigned int size);
void  heap_stats(unsigned int *free_bytes, unsigned int *used_bytes, unsigned int *n_blocks);

#endif // __HEAP_H__
