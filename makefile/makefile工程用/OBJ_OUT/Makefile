#
#By rocky-wang
#
#date:2007/12/10
#
	
SOURCE = $(wildcard *.c)
OBJS = $(patsubst %.c,%.o,$(SOURCE))
#TARGET = Bin

include ../Rules/Rules.mk	
	
all:$(TARGET)
$(TARGET):$(OBJS) $(OBJ_DIR)
	$(CROSS_COMPILE)$(CXX) $(CROSS_LINK) -o $@ *.o

$(OBJ_DIR):ECHO
	@make --no-print-directory -C $@
ECHO:
	@echo hello > /dev/null

.PHONY:clean
clean:
	@../Rules/clean.sh
	@rm -f *.o *.d $(TARGET)

include $(SOURCE:.c=.d)	
	
%.o:%.c
	$(CROSS_COMPILE)$(CXX) -Wall $(CFLAGS) -c $< -o $@

%.d: %.c
	@set -e; rm -f $@; \
	$(CXX) -MM $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$


