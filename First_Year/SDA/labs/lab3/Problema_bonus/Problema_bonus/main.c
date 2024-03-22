#include <stdio.h>
#include <stdlib.h>

#define CAPACITY 4

typedef struct {
    int data[CAPACITY];
    int head; 
    int tail; 
} CircularQ;

// Functie pt initializare
void init(CircularQ* Q) {
    Q->head = 0;
    Q->tail = 0;
    for (int i = 0; i < CAPACITY; i++)
        Q->data[i] = 0;
}

// Funcție pt verificarea dacă coada este goală
int isEmpty(CircularQ* Q) {
    return Q->head == Q->tail;
}

// Funcție pt verificarea dacă coada este plină
int isFull(CircularQ* Q) {
    return (Q->tail + 1) % CAPACITY == Q->head;
}

// Funcție pt adăugarea unui element în coada
void enqueue(CircularQ* Q, int val) {
    if (isFull(Q))
        return;

    Q->data[Q->tail] = val;
    Q->tail = (Q->tail + 1) % CAPACITY;
}

// Funcție pt eliminarea unui element din coada 
int dequeue(CircularQ* Q) {
    if (isEmpty(Q)) 
        return -1;

    int value = Q->data[Q->head];
    Q->head = (Q->head + 1) % CAPACITY;
    return value;
}

// Funcție pt afișare
void print_queue(CircularQ* Q) {
    if (isEmpty(Q))
        return;

    for (int i = Q->head; i < Q->tail; i = (i + 1) % CAPACITY) {
        printf("%d ", Q->data[i]);
    }
    printf("\n");
}

int main() {
    CircularQ Q;
    init(&Q);
        
    enqueue(&Q, 10);
    enqueue(&Q, 20);
    enqueue(&Q, 30);

    if (isFull(&Q))
    {
        print_queue(&Q);
        printf("e full\n");
    }
    else printf("nu\n");
    print_queue(&Q);

    enqueue(&Q, 40);
    enqueue(&Q, 50);



    printf("Elementul eliminat: %d\n", dequeue(&Q));
    printf("Elementul eliminat: %d\n", dequeue(&Q));

    print_queue(&Q);

    enqueue(&Q, 40);
    enqueue(&Q, 50);

    print_queue(&Q);

    return 0;
}
