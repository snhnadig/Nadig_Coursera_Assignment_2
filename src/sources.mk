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

# Source files for HOST
SOURCESH = ./main.c \
	./memory.c \

# Include files for HOST
INCLUDESH = -I ../include/common

# Include files for Cross Compiler
INCLUDESCROSS = -I../include/common \
			-I ../include/msp432  \
			-I ../include/CMSIS

#Source files for Cross Compiler
SOURCESCROSS = ./interrupts_msp432p401r_gcc.c \
			./startup_msp432p401r_gcc.c \
			./system_msp432p401r.c \
			./main.c \
			./memory.c \

