all: loops recursives recursived loopd mains maindrec maindloop

loops: loops1 loops2 basicClassification.o
	ar -rcs -o libclassloops.a basicClassification.o advancedClassificationLoop.o
	
loops1: basicClassification.c basicClassification.h
	gcc -c basicClassification.c

loops2: advancedClassificationLoop.c advancedClassificationLoop.h
	gcc -c advancedClassificationLoop.c

recursives: recursives1 basicClassification.o
	ar -rcs -o libclassrec.a advancedClassificationRecursion.o basicClassification.o
	

recursives1: advancedClassificationRecursion.c 
	gcc -c advancedClassificationRecursion.c

recursived: advancedClassificationRecursion.c basicClassification.o
	gcc -Wall -fPIC -c advancedClassificationRecursion.c
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o 

loopd: basicClassification.c advancedClassificationLoop.c
	gcc -Wall -fPIC -c advancedClassificationLoop.c basicClassification.c
	gcc -shared -o libclassloops.so advancedClassificationLoop.o basicClassification.o  

mains: main.c libclassrec.a
	gcc -c main.c
	gcc -Wall -g -o mains main.o libclassrec.a -lm

maindloop: main.c libclassloops.so
	gcc -c main.c
	gcc -Wall -g -o maindloop main.o ./libclassloops.so -lm

maindrec: main.c libclassrec.so
	gcc -c main.c
	gcc -Wall -g -o maindrec main.o ./libclassrec.so -lm

clean:
	rm -rf *.o *.so *.a mains maindrec maindloop
