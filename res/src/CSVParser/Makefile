## MAKEFILE FOR COMPILING THE BASH PARSER

SRC	=	main.cpp		# SOURCE FILES

OBJ	=	$(SRC:.cpp=.o)		# CREATING OBJECT FILES

EXE	=	CSVParser-Linux		# EXECUTABLE FILE'S NAME

CXXFLAGS	= -g -Werror -Wextra -Wall	# COMPILATION OPTIONS


## COMMANDS ALIASES
GXX = g++

RM = rm -f


## MAKEFILE RULES (TO PASS AS ARGUMENT WHEN YOU CALL THE MAKE COMMAND, EXCEPT FOR THE "all:" RULE)
all: $(OBJ)
	$(GXX) -o $(EXE) $(CXXFLAGS) $(SRC)

clean:
	$(RM) $(OBJ)

debug:
	$(GXX) -o $(EXE) $(CXXFLAGS) $(SRC)

fclean:
	$(RM) $(EXE) $(OBJ)

re: fclean all

.PHONY: all clean fclean re
