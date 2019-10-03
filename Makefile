CC	=	gcc
NASM	=	nasm
PRINT	=	printf
RM	=	rm -f

NAME	=	libasm.so

NFLAGS	=	-f elf64
CFLAGS	+=	-W -Wall -Wextra -Werror
CFLAGS	+=	-ansi -pedantic
CFLAGS	+=	-fPIC

SRCS	=	memcpy.S	\
		memmove.S	\
		memset.S	\
		rindex.S	\
		strcasecmp.S	\
		strchr.S	\
		strcmp.S	\
		strcspn.S	\
		strlen.S	\
		strncmp.S	\
		strpbrk.S	\
		strstr.S

OBJS	=	$(SRCS:.S=.o)

%.o: %.S
		$(NASM) $(NFLAGS) $< -o $@

$(NAME)	:	$(OBJS)
		$(CC) -o $(NAME) -shared $(OBJS)
		@$(PRINT) "\033[1;32m*** Library $(NAME) is compiled ***\n\033[0m"

all	:	$(NAME)

clean	:
		$(RM) $(OBJS)
		$(RM) *~ \#*\#
		@$(PRINT) "\033[1;31m*** Objects are removed ***\n\033[0m"

fclean	:	clean
		$(RM) $(NAME)
		@$(PRINT) "\033[1;31m*** Library $(NAME) is removed ***\n\033[0m"

re	:	fclean all

.PHONY	:	all clean fclean re