CC = clang
CFLAGS += -W -Wall -Wextra -g3 -Werror

RM = rm -f

NAME = Grace
SRC = Grace.c
OBJ = $(SRC:.c=.o)

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

test: all; diff $(SRC) Grace_kid.c

re: fclean all