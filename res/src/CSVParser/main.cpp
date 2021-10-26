#include "CSV.h"

int main(int argc, char* argv[])
{
	if (argc != 3) {
		std::cout << "ERROR : At least or only 2 arguments are expected :" << std::endl;
		std::cout << "\t - The CSV file's path" << std::endl;
		std::cout << "\t - The language's code" << std::endl;
		exit(84);
	}

	std::ofstream csv(argv[1]);

	return (0);
}