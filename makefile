CC     = gcc
CFLAGS = -Wall -g -std=c99
CCLINK =$(CC)
OBJS   = main.o file0.o file1.o file2.o file3.o file4.o
EXEC   = prog.exe
RM     = rm -f

$(EXEC): $(OBJS)
	$(CCLINK) $(OBJS) -o $(EXEC)

file0.o: file0.c file0.h file2.h file3.h
file1.o: file1.c file1.h file0.h file3.h file4.h
file2.o: file2.c file2.h file4.h
file3.o: file3.c file3.h file0.h
file4.o: file4.c file4.h file0.h
main.o: main.c file0.h file1.h file2.h file3.h file4.h
  
clean:
	$(RM) $(EXEC) $(OBJS)
