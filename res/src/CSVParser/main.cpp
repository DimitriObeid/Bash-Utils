#include "CSV.h"

int main(int argc, char* argv[])
{
	if (argc < 1 || argc > 2) {
		std::cout << "ERROR : At least or only 1 argument is expected :" << std::endl;
		std::cout << "\t - The CSV file's path" << std::endl;
		exit(84);
	}

	std::ofstream csv(argv[1]);

	return (0);
}
