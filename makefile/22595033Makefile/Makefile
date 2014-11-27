TARGET	:= sqlitevirgin

#CROSS	= arm-linux-
#CROSS	= /usr/local/arm/3.4.1/bin/arm-linux-

CC		= $(CROSS)gcc
#CC		= gcc -g
LD		= $(CROSS)ld

RM    = rm -f
PWD := $(shell pwd)

#kernel directory
#KDIR	=/mnt/hgfs/work/YLE2440_linux2.6.12

SRCDIRS	:= .

SRCEXTS	:= .c

#IFLAGS := -I$(PWD)/3rd-lib/include

CPPFLAGS :=
CFLAGS := -Wall -DLINUX -D_REENTRANT -O2 -DDEBUG #-Werror

#CFLAGS := -Wall -DLINUX -D_REENTRANT -O2 -DDEBUG -I. -I$(KDIR) #-Werror

LDFLAGS := -lpthread -lm  -ldl


SHELL   = /bin/sh
SOURCES = $(foreach d,$(SRCDIRS),$(wildcard $(addprefix $(d)/*,$(SRCEXTS))))
OBJS    = $(foreach x,$(SRCEXTS),$(patsubst %$(x),%.o,$(filter %$(x),$(SOURCES))))
DEPS    = $(patsubst %.o,%.d,$(OBJS))

.PHONY : all objs clean cleanall rebuild

all : $(TARGET)

# Rules for creating the dependency files (.d).
%.d : %.c
	@cd $(<D);$(CC) -MM -MD $(CFLAGS) $(<F)
%.d : %.C
	@$(CC) -MM -MD $(CXXFLAGS) $<
%.d : %.cc
	@$(CC) -MM -MD $(CXXFLAGS) $<
%.d : %.cpp
	@$(CC) -MM -MD $(CXXFLAGS) $<
%.d : %.CPP
	@$(CC) -MM -MD $(CXXFLAGS) $<
%.d : %.c++
	@$(CC) -MM -MD $(CXXFLAGS) $<
%.d : %.cp
	@$(CC) -MM -MD $(CXXFLAGS) $<
%.d : %.cxx
	@$(CC) -MM -MD $(CXXFLAGS) $<

# Rules for producing the objects.
objs : $(OBJS)
%.o : %.c
	cd $(<D);$(CC) -c $(CPPFLAGS) $(CFLAGS) $(<F)
%.o : %.C
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $<
%.o : %.cc
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $<
%.o : %.cpp
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $<
%.o : %.CPP
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $<
%.o : %.c++
	$(CXX -c $(CPPFLAGS) $(CXXFLAGS) $<
%.o : %.cp
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $<
%.o : %.cxx
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $<

# Rules for producing the executable.
#----------------------------------------------
$(TARGET):$(OBJS)
ifeq ($(strip $(SRCEXTS)), .c)  # C file
	$(CC) -o $(TARGET) $(OBJS) $(LDFLAGS)
else                            # C++ file
	$(CXX) -o $(TARGET) $(OBJS) $(LDFLAGS)
endif

-include $(DEPS)

rebuild: clean all

clean :
	@$(RM) $(OBJS) $(DEPS)	
        
#cleanall: clean
	@$(RM) $(TARGET)

