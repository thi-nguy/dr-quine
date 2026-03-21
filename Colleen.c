#include <stdio.h>
/*Dr*/
void ft_print() {
    char *s = "#include <stdio.h>%c/*Dr*/%cvoid ft_print() {%c    char *s = %c%s%c;%c    printf(s, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10);%c}%cint main() {%c/*Quine*/%c    ft_print();%c    return (0);%c}";
    printf(s, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10);
}
int main() {
/*Quine*/
    ft_print();
    return (0);
}