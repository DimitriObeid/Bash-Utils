#include <fstream>
#include <iostream>
#include <ios>

int main(int argc, char** argv)
{
	if (argc < 1)
	{
		std::cout << "ERROR : At least 1 argument is expected :" << std::endl;
		std::cout << "\t - The CSV file's path" << std::endl;
		exit(84);
	}

	ofstream csv("");

	return (0);
}
