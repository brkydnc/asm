#include <stdio.h>

extern void two_fer(char* name, char* buffer);

int main(void) {
    char buffer[256];
    two_fer("Berkay", buffer);
    printf("%s\n", buffer);
    return 0;
}
