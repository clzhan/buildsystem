#ifndef DEBUG_H
#define DEBUG_H

#include <stdio.h>

#ifdef __DEBUG__
	#define debug_printf(arg...) {\
							printf("[DEBUG]:");\
							printf(arg);\
							fflush(stdout);\
		}
	#define error_printf(arg...) {\
							printf("\033[1;31m");\
							printf("[ERROR]:");\
							printf(arg);\
							fflush(stdout);\
							printf("\033[0m");\
							}
	#define info_printf(arg...) {\
				printf("\033[1;34m");\
				printf("[INFO]:");\
				printf(arg);\
				fflush(stdout);\
				printf("\033[0m");\
				}
	
#else
	#define debug_printf(...) {  }
	
	#define error_printf(arg...) {\
							printf("[ERROR]:");\
							printf(arg);\
							fflush(stdout);\
		}
	#define info_printf(arg...) { }
#endif

#endif

