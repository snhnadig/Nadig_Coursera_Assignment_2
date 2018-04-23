#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# Sneha Nadig: Week 2 Assignment
#The makefile compiles memory.c, main.c and platform sepecific.c files into executable named c1m2.out. There are platform overides for use to specify HOST type and specific include # files and compile flags pertaining to the particular HOST type.
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      .i files is preprocessed output of all c implementation files
#      .asm files is the assembly output of c-program implementation files 
# 	   .o files is the object file for all c source files
# 		compile all option compiles all object files but does not link
#		build compiles all object files and links to final executable 
#		clean removes all previously geneated output files
#
# Platform Overrides:
#      PLATFORM=HOST for native compiler
#	   PLATFORM=MSP432 for traget specific compiler
#
#------------------------------------------------------------------------------
include sources.mk

# Platform Overrides
PLATFORM = HOST


	ifeq ($(PLATFORM),HOST)
		CC = gcc
		CPPFLAGS = $(INCLUDESH)
		CFLAGS =  -g -Wall  -std=c99  -O0 
		LDFLAGS =-Wl,-Map=$(TARGET).map -Xlinker
		SOURCES = $(SOURCESH)

	endif
	ifeq ($(PLATFORM),MSP432)
		CC = arm-none-eabi-gcc
		LINKER_FILE = ../msp432p401r.lds
		CPU = cortex-m4
		ARCH = armv7e-m
		SPECS = nosys.specs
		FLOAT = hard
		FPU=fpv4-sp-d16
		CPPFLAGS = $(INCLUDESCROSS)
		CFLAGS = -Wall -Werror -g -O0 -std=c99  -mtune=$(CPU) -march=$(ARCH) -mthumb -mfloat-abi=$(FLOAT) -mfpu=$(FPU) --specs=$(SPECS) 
		LDFLAGS = -Wl,-Map=$(TARGET).map -T $(LINKER_FILE)
		SOURCES = $(SOURCESCROSS) 
	endif
	
TARGET = c1m2
OBJS = $(SOURCES:.c=.o)
	
%.o : %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -D$(PLATFORM) -c $< -o $@ 

%.i : %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -D$(PLATFORM) -E $< -o $@ 
%.asm : %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -D$(PLATFORM) -S $< -o $@ 
	objdump -S $(OBJS)
%.d: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -D$(PLATFORM) -MP -MF -MM $< -o $@ 
	
.PHONY: compile-all
compile-all:
	$(CC) $(CPPFLAGS) $(CFLAGS) -D$(PLATFORM) -c $(SOURCES)
	
.PHONY: build
build: all

.PHONY: all
all: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $(TARGET).out
	size $(TARGET).out

.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET).out $(TARGET).map *.i *.asm *.d *.o
