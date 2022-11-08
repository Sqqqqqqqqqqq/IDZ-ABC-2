#include <stdio.h>
#include <stdbool.h>

bool compare(char a, char b) {
    return (a == b) ? true : false;
}

int main(void) {
    char a[50];
    fgets(a, 50, stdin);
    for (int i = 0; a[i] != '\0'; ++i) {
        if (compare(a[i], 'e') || compare(a[i], 'y') || compare(a[i], 'u') || compare(a[i], 'i') || compare(a[i], 'o') || compare(a[i], 'a')) {
            printf("0x%x", a[i]);
        } else {
            printf("%c", a[i]);
        }
    }
    return 0;
}

