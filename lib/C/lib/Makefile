# Source files to compile before adding them in the archive
SRC		=	read_file.c

# Object files extension (binary files resulting from the compilation).
# For each ".c" source file, an object file is created.
OBJ 	= 	$(SRC:.c=.o)

# Name of the binary file that results, here, from the linking process.
# After the compilation, the next step is the archiving. The object files are bundled into a static archive file.
# Here, this binary file is not an executable, as
NAME 	= 	libcbashutils.a

# -Wextra	-->
# -Wall		-->
# -I		--> Include files from a specific folder
CFLAGS 	+= 	-Wextra -Wall -I../include

all: 	$(NAME)
	ar rc $(NAME) $(OBJ)		# Archivating all the object files created.

$(NAME): $(OBJ)

clean:
	rm -f $(OBJ)				# Cleaning all the object files if the "clean" rule is called with the "make" command.

fclean: clean
	rm -f $(OBJ)
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
