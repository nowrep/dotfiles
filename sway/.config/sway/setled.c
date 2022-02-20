// gcc setled.c -o setled
// setcap CAP_DAC_OVERRIDE+ep setled

#include <stdio.h>
#include <string.h>

int main(int argc, char** argv)
{
    if (argc != 3) {
        return 1;
    }
    if (strcmp(argv[1], "0") && strcmp(argv[1], "1")) {
        return 2;
    }
    FILE *f = fopen(argv[2], "w");
    if (!f) {
        return 3;
    }
    fprintf(f, "%c", *argv[1]);
    fclose(f);
    return 0;
}
