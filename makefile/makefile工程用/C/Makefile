#
#By rocky-wang
#
#date:2010-12-08
#
	
SOURCE = $(wildcard *.c)
OBJS = $(patsubst %.c,%.o,$(SOURCE))

all:$(OBJS)

include ../Rules/Rules.mk	
	
include $(SOURCE:.c=.d)	

%.o:%.c
	@$(CROSS_COMPILE)$(CXX) -Wall $(CFLAGS) -c $< -o $@
	@cp $@ $(BIN_DIR)/

%.d: %.c
	@set -e; rm -f $@; \
	$(CXX) -MM $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

.PHONY:clean
clean:
	rm -f *.o *.d

