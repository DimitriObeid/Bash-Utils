## MAKEFILE FOR COMPILING THE BASH PARSER

# SOURCE FILES
SRC	=	main.cpp

# CREATING OBJECT FILES
OBJ	=	$(SRC: .cpp= .o)

# EXECUTABLE FILE'S NAME
EXE	=	CSVParser.exec

# COMPILATION OPTIONS
CXXFLAGS	=	-Werror -Wextra -Wall -ICSV.h


## COMMANDS

RM	=	rm -f


##

$(NAME): $(OBJ)
	g++ -o $(NAME) $(OBJ)

all: $(NAME)

clean:	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
