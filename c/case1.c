#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char* argv[])
{
	FILE *fp_inputdeck ;
	int count;
	char args_error_flag = 0;

	if (argc > 1) {
		for (count = 1; count < argc; count+=2) {
			if(!strcmp(argv[count],"-inp")) {
				printf("-inp : %s \n", argv[count+1]);
				fp_inputdeck = fopen(argv[count+1], "r");
				if (fp_inputdeck == NULL) {
					printf("Error opening %s file. path : %s \n",argv[count], argv[count+1]);
					exit(1);
				}
			} else {
				printf("Invalid command option: %s\n", argv[count] );
				args_error_flag = 1;
			};
		}
		if(args_error_flag == 1) {
			printf("Check your comand option\n");
			exit(1);
		}
	} else {
		printf("Invalid arguments number.\n");
		exit(1);
	}


	fclose(fp_inputdeck);

	return 0;
}
