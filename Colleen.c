#include <stdio.h>
/*Dr*/
void ft_print() {
    char *s = "#include <stdio.h>%1$c/*Dr*/%1$cvoid ft_print() {%1$c    char *s = %2$c%3$s%2$c;%1$c    printf(s, 10, 34, s);%1$c}%1$cint main() {%1$c/*Quine*/%1$c    ft_print();%1$c    return (0);%1$c}";
    printf(s, 10, 34, s);
}
int main() {
/*Quine*/
    ft_print();
    return (0);
}