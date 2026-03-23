CC = gcc
CFLAGS += -Wall -Wextra -Werror

RM = rm -f

NAME = Sully
SRC = Sully.c
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

test: all; diff $(SRC) Sully_kid.c

re: fclean all