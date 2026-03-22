#include <stdio.h>
#include <string.h>
// Dr Quine
#define STR "#include <stdio.h>%1$c#include <string.h>%1$c// Dr Quine%1$c#define STR %2$c%3$s%2$c%1$c#define WRITE(s) FILE *fp = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c); if(fp != NULL) {fprintf(fp, s, 10, 34, s);} fclose(fp);%1$c#define RUN int main() { WRITE(STR); return 0;};%1$c%1$cRUN"
#define WRITE(s) FILE *fp = fopen("Grace_kid.c", "w"); if(fp != NULL) {fprintf(fp, s, 10, 34, s);} fclose(fp);
#define RUN int main() { WRITE(STR); return 0;};

RUN