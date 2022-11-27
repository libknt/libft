# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keys <keys@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/30 11:18:56 by kyoda             #+#    #+#              #
#    Updated: 2022/11/28 00:43:18 by keys             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libft.a
CC 			= gcc
# CC 			= clang
INCLUDE		= -I ./
CFLAGS		= -Wall -Wextra -Werror
# CFLAGS		= -Wall -Wextra -Werror $(INCLUDE) -g -fsanitize=address -fsanitize=undefined -fsanitize=integer

SRCS		=	ft_atoi.c 		\
				ft_atol.c		\
				ft_calloc.c 	\
				ft_isalpha.c 	\
				ft_isdigit.c 	\
				ft_memchr.c 	\
				ft_memcpy.c 	\
				ft_memset.c 	\
				ft_strdup.c 	\
				ft_strlcpy.c 	\
				ft_strncmp.c 	\
				ft_strrchr.c 	\
				ft_toupper.c 	\
				ft_bzero.c 		\
				ft_isalnum.c 	\
				ft_isascii.c 	\
				ft_isprint.c 	\
				ft_memcmp.c 	\
				ft_memmove.c 	\
				ft_strchr.c 	\
				ft_strlcat.c 	\
				ft_strlen.c 	\
				ft_strnstr.c 	\
				ft_tolower.c 	\
				ft_itoa.c 		\
				ft_putchar_fd.c \
				ft_putendl_fd.c \
				ft_putnbr_fd.c 	\
				ft_putstr_fd.c	\
				ft_split.c 		\
				ft_striteri.c 	\
				ft_strjoin.c 	\
				ft_strmapi.c 	\
				ft_strtrim.c 	\
				ft_substr.c

SRCS_BONUS	=	ft_lstadd_back.c	\
				ft_lstadd_front.c	\
				ft_lstclear.c		\
				ft_lstdelone.c 		\
				ft_lstiter.c 		\
				ft_lstlast.c 		\
				ft_lstmap.c 		\
				ft_lstnew.c 		\
				ft_lstsize.c
OBJDIR		= obj/
OBJS  = $(addprefix $(OBJDIR), $(SRCS:.c=.o))
OBJS_BONUS	= $(addprefix $(OBJDIR), $(SRCS_BONUS:.c=.o))
ifdef WITH_BONUS
OBJS += $(OBJS_BONUS)
endif

all : $(NAME)

$(NAME) : $(OBJS)
	ar rcs $@ $^

$(OBJDIR)%.o: %.c
	@mkdir -p $$(dirname $@)
	$(CC) $(INCLUDE) $(CFLAGS) -o $@ -c $<

bonus :
	@$(MAKE) --no-print-directory all WITH_BONUS=1

clean :
	$(RM) $(OBJS_BONUS) $(OBJS)

fclean : clean
	$(RM) $(NAME)

re : fclean all

.PHONY : all clean fclean re bonus
