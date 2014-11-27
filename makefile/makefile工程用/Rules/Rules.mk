SUB_DIR = ../                         #add the abject dir
INC_DIR = $(SUB_DIR)include						#add the dir of *.h 
BIN_DIR = $(SUB_DIR)OBJ_OUT						#you out put dir ,the top makefile must in this floder
																			#and you need to make make in this dir



OBJ_DIR += $(SUB_DIR)line_list/				#add you all C dir
OBJ_DIR += $(SUB_DIR)link_list/
OBJ_DIR += $(SUB_DIR)main/
OBJ_DIR += $(SUB_DIR)stack/
OBJ_DIR += $(SUB_DIR)queue/

CFLAGS += -D__DEBUG__									#add the cross of the compiler need
CFLAGS += -I$(INC_DIR)

CROSS_LINK +=	-lpthread								#add the cross of the linker need


CROSS_COMPILER = 
CXX = gcc

TARGET = bin                         #the name you target

export OBJ_DIR
