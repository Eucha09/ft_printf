CFLAGS = -Wall -Wextra -Werror
NAME = libftprintf.a
LIBFT_DIR = Libft
LIBFT = libft.a
INCLUDES = includes
SOURCES =	srcs/ft_printf.c\
			srcs/ft_put_data.c\
			srcs/ft_put_char_format.c\
			srcs/ft_put_str_format.c\
			srcs/ft_put_int_format.c\
			srcs/ft_put_uint_format.c\
			srcs/ft_put_pointer_format.c\
			srcs/ft_put_hex_format.c\
			srcs/ft_put_utils.c\
			srcs/ft_utils1.c\
			srcs/ft_utils2.c
SOURCES_BONUS =	srcs_bonus/ft_printf_bonus.c\
				srcs_bonus/ft_put_data_bonus.c\
				srcs_bonus/ft_put_char_format_bonus.c\
				srcs_bonus/ft_put_str_format_bonus.c\
				srcs_bonus/ft_put_int_format_bonus.c\
				srcs_bonus/ft_put_uint_format_bonus.c\
				srcs_bonus/ft_put_pointer_format_bonus.c\
				srcs_bonus/ft_put_hex_format_bonus.c\
				srcs_bonus/ft_put_utils_bonus.c\
				srcs_bonus/ft_utils1_bonus.c\
				srcs_bonus/ft_utils2_bonus.c
OBJECTS = $(SOURCES:.c=.o)
OBJECTS_BONUS = $(SOURCES_BONUS:.c=.o)
BONUS_CHECK = bonus_check

all : $(NAME)

$(NAME) : $(OBJECTS)
	make -C $(LIBFT_DIR)
	cp $(LIBFT_DIR)/$(LIBFT) $@
	ar rcs $@ $^

bonus : $(BONUS_CHECK)

$(BONUS_CHECK) : $(OBJECTS_BONUS)
	make -C $(LIBFT_DIR)
	cp $(LIBFT_DIR)/$(LIBFT) $(NAME)
	ar rcs $(NAME) $^
	touch $@

%.o : %.c
	cc $(CFLAGS) -c $^ -o $@ -I $(INCLUDES)

clean :
	rm -f $(OBJECTS) $(OBJECTS_BONUS)
	make clean -C $(LIBFT_DIR)

fclean : clean
	rm -f $(NAME) $(BONUS_CHECK)
	make fclean -C $(LIBFT_DIR)

re : fclean all

.PHONY : all bonus clean fclean re