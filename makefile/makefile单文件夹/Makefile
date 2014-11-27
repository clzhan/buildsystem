#
#By rocky-wang
#
#date:2007/12/10
#
	
SOURCE = $(wildcard *.c)
OBJS = $(patsubst %.c,%.o,$(SOURCE))
	
CROSS_COMPILE = 
CXX = gcc

CFLAGS += -D__DEBUG__
CFLAGS += -I../include/
	
all:bts
bts:$(OBJS)
	$(CROSS_COMPILE)$(CXX) -o $@ $^

.PHONY:clean
clean:
	rm -f *.o *.d bts

include $(SOURCE:.c=.d)	
	
%.o:%.c
	$(CROSS_COMPILE)$(CXX) -Wall $(CFLAGS) -c $< -o $@

%.d: %.c
	@set -e; rm -f $@; \
	$(CXX) -MM $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$


