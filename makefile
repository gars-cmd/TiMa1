all: loops loops1 loops2 recursives recursives1 recursived loopd mains maindrec maindloop

loops: loops1 loops2
	ar rcu libclassloops.a basicClassification.o advancedClassificationLoop.o
	ranlib libclassloops.a

loops1: basicClassification.c basicClassification.h
	gcc -c basicClassification.c

loops2: advancedClassificationLoop.c advancedClassificationLoop.h
	gcc -c advancedClassificationLoop.c

recursives: recursives1 
	ar rcs libclassrec.a advancedClassificationRecursion.o
	ranlib libclassrec.a

recursives1: advancedClassificationRecursion.c 
	gcc -c advancedClassificationRecursion.c

recursived: advancedClassificationRecursion.c
	gcc -Wall -fPIC -c advancedClassificationRecursion.c
	gcc -shared advancedClassificationRecursion.o -o libclassrec.so

loopd: basicClassification.c advancedClassificationLoop.c
	gcc -Wall -fPIC -c advancedClassificationLoop.c basicClassification.c
	gcc -shared advancedClassificationLoop.o basicClassification.o -o libclassloops.so

mains: main.c libclassrec.a
	gcc -c main.c
	gcc -Wall -g -o mains main.o libclassrec.a basicClassification.o

maindloop: main.c libclassloops.so
	gcc -c main.c
	gcc -Wall -g -o maindloop main.o ./libclassloops.so basicClassification.o

maindrec: main.c libclassrec.so
	gcc -c main.c
	gcc -Wall -g -o maindrec main.o ./libclassrec.so basicClassification.o

clean:
	rm -rf *.o *.so *.a mains maindrec maindloop