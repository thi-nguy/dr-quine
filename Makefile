CC = clang
CFLAGS += -W -Wall -Wextra -g3 -Werror

RM = rm -f

NAME = Colleen
SRC = Colleen.c
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

test: all; ./$(NAME) > tmp_Colleen ; diff $(SRC) tmp_Colleen

re: fclean all