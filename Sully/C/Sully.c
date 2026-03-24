#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CURRENT_I 5

#ifdef GENERATED
#define I (CURRENT_I - 1)
#else
#define I CURRENT_I
#endif

#define FILE_NAME(buf, i) (sprintf(buf, "Sully_%d.c", i), buf)
#define FILE_EXEC(buf, i) (sprintf(buf, "Sully_%d", i), buf)
#define FIRST_HALF "#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <string.h>%1$c%1$c#define CURRENT_I "
#define SECOND_HALF "%1$c%1$c#ifdef GENERATED%1$c#define I (CURRENT_I - 1)%1$c#else%1$c#define I CURRENT_I%1$c#endif%1$c%1$c#define FILE_NAME(buf, i) (sprintf(buf, %2$cSully_%%d.c%2$c, i), buf)%1$c#define FILE_EXEC(buf, i) (sprintf(buf, %2$cSully_%%d%2$c, i), buf)%1$c#define FIRST_HALF %2$c%3$s%2$c%1$c#define SECOND_HALF %2$c%4$s%2$c%1$c%1$cint main() {%1$c    if (I < 0) {%1$c        return 0;%1$c    }%1$c    char fname[50];%1$c    char exec_file[50];%1$c    FILE *fp = fopen(FILE_NAME(fname, I), %2$cw%2$c);%1$c    if (fp) {%1$c        fprintf(fp, FIRST_HALF, 10);%1$c        fputc('0' + I, fp);%1$c        fprintf(fp, SECOND_HALF, 10, 34, FIRST_HALF, SECOND_HALF);%1$c        fclose(fp);%1$c    }%1$c    char cmd[256];%1$c    strcpy(cmd, %2$cgcc -Wall -Wextra -Werror -D GENERATED %2$c);%1$c    strcat(cmd, FILE_NAME(fname, I));%1$c    strcat(cmd, %2$c -o %2$c);%1$c    strcat(cmd, FILE_EXEC(exec_file, I));%1$c    strcat(cmd, %2$c && ./%2$c);%1$c    strcat(cmd, FILE_EXEC(exec_file, I));%1$c    system(cmd);%1$c    return 0;%1$c}"

int main() {
    if (I < 0) {
        return 0;
    }
    char fname[50];
    char exec_file[50];
    FILE *fp = fopen(FILE_NAME(fname, I), "w"); // ! them phan handle loi cua fopen fprintf, fputc, flcose, system (neu can)
    if (fp) {
        fprintf(fp, FIRST_HALF, 10);
        fputc('0' + I, fp);
        fprintf(fp, SECOND_HALF, 10, 34, FIRST_HALF, SECOND_HALF);
        fclose(fp);
    }
    char cmd[256];
    strcpy(cmd, "gcc -Wall -Wextra -Werror -D GENERATED ");
    strcat(cmd, FILE_NAME(fname, I));
    strcat(cmd, " -o ");
    strcat(cmd, FILE_EXEC(exec_file, I));
    strcat(cmd, " && ./");
    strcat(cmd, FILE_EXEC(exec_file, I));
    system(cmd);
    return 0;
}