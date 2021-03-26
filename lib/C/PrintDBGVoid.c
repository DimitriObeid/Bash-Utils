#include <stdio.h>
#include <stdlib.h>

void readFile()
{
	FILE *fp;	# Structure handling all informations about a file (buffer memory adress, access rights (read, write), etc...)
	int buff = 100;
	char *filepath = "/usr/local/lib/Bash-utils/config/Terminal.conf";

	gets(filepath);
	fp = fopen(filepath, "r");

	if (fp) {
		fgets();
	}
}

int main()
{
	// Read the Terminal configuration file, get the defined terminal color and adapt the text color.
	

	if (argv[1] = "black")
		printf("");

	printf("\n");
	return 0;
}
