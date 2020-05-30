# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: Peer <pde-bakk@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/19 17:13:57 by peerdb        #+#    #+#                  #
#    Updated: 2020/05/06 17:27:30 by Peer          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

FLAGS = -Wall -Werror -Wextra
ifdef DEBUG
 FLAGS += -g -fsanitize=address
endif

SRC_DIR = src/

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s

OBJ = $(SRC%.s=%.o)

all: $(NAME)

%.o : %.s
	nasm -f elf64 $< -o $@

$(NAME): $(addprefix $(SRC_DIR), $(OBJ))
	ar -rcs $(NAME) $^

clean:
	rm -rf $(addprefix $(SRC_DIR), $(OBJ))

fclean: clean
	rm -rf $(NAME)

re: fclean all