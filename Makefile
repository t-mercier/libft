# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: tmercier <tmercier@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2021/12/02 17:13:26 by tmercier      #+#    #+#                  #
#    Updated: 2021/12/15 17:14:20 by tmercier      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

## COLORS ## ________________________________________________ ANSI color codes #

BLACK			=	\033[0;30m
RED				=	\033[0;31m
GREEN			=	\033[1;32m
ORANGE			=	\033[0;33m
BLUE			=	\033[0;34m
PURPLE			=	\033[0;35m
CYAN			=	\033[0;36m
LIGHT_GRAY		=	\033[0;37m
DARK_GRAY		=	\033[1;30m
LIGHT_RED		=	\033[1;31m
LIGHT_GREEN		=	\033[1;32m
YELLOW			=	\033[1;33m
LIGHT_BLUE		=	\033[1;34m
LIGHT_PURPLE	=	\033[1;35m
LIGHT_CYAN		=	\033[1;36m
WHITE			=	\033[1;37m
NO_COLOR		=	\033[0m

## VARIABLES ##___________________________________________________ path macros #

HEADS 			=	./includes/

OBJ_DIR			=	./obj_files/

SRC_DIR			=	./src_files/

#_______________________________________________________________ sources files #

SRC_NAME		=	ft_isalnum.c \
					ft_isalpha.c \
					ft_isascii.c \
					ft_isdigit.c \
					ft_isprint.c \
					ft_islower.c \
					ft_isupper.c \
					ft_tolower.c \
					ft_toupper.c \
					ft_putchar_fd.c \
					ft_putendl_fd.c \
					ft_putnbr_fd.c \
					ft_putstr_fd.c \
					ft_split.c \
					ft_strchr.c \
					ft_strdup.c \
					ft_strjoin.c \
					ft_strlcat.c \
					ft_strlcpy.c \
					ft_strcpy.c \
					ft_striteri.c \
					ft_strlen.c \
					ft_strmapi.c \
					ft_strncmp.c \
					ft_strnstr.c \
					ft_strrchr.c \
					ft_strtrim.c \
					ft_substr.c \
					ft_atoi.c \
					ft_itoa.c \
					ft_intlen.c \
					ft_bzero.c \
					ft_calloc.c \
					ft_memchr.c \
					ft_memcmp.c \
					ft_memcpy.c \
					ft_memmove.c \
					ft_memset.c \
					ft_lstadd_back.c \
					ft_lstadd_front.c \
					ft_lstclear.c \
					ft_lstdelone.c \
					ft_lstiter.c \
					ft_lstlast.c \
					ft_lstmap.c \
					ft_lstnew.c \
					ft_lstsize.c

#________________________________________________________________ tool macros #

CC				=	gcc

CFLAGS			=	-Wall -Wextra -Werror

RM				=	rm -f

AR				=	ar rcs

NAME			=	libft.a

SRC 			=	$(addprefix $(SRC_DIR), $(SRC_NAME))

OBJ 			=	$(addprefix $(OBJ_DIR), $(SRC_NAME:.c=.o))

## RULES ## ________________________________________________ compilation rules #

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "\n$(GREEN)-> libft.a compiled and indexed. ✅"

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@$(CC) $(FLAGS) -c $< -o $@ -I $(HEADS)
	@echo "\033[96m	$@\033[0m"

$(OBJ): | $(OBJ_DIR)

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)

#______________________________________________________________ cleaning rules #

clean:
	@printf "$(LIGHT_RED)\n-> deleting .o files ... from libft.\n"
	@$(RM) $(OBJ) 

fclean: clean
	@printf "\n$(LIGHT_RED)-> deleting $(NAME) file ...\n"
	@$(RM) $(NAME) 
	@rmdir obj_files

re: fclean all

norm:
	@printf "\n$(GREEN)norminette check ...\n\n$(NO_COLOR)"
	@norminette

end:
	@make fclean
	@make all
	@make norm
	@make fclean
	@printf "$(NO_COLOR)\n________________________________\n\n"
	@printf "$(GREEN)$(NAME) COMPILATION CHECKED ✅\n\n"
	@printf "$(NAME) NORM CHECKED ✅\n\n"
	@printf "$(NAME) & OBJ FILES REMOVED ✅\n\n"
	@printf "$(LIGHT_CYAN)READY TO BE PUSHED. ✅\n\n"

.PHONY: all clean fclean re gmk norminette norminette-exported export end