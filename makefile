all: loopd recursived loops recursives  mains maindloop maindrec 

basicClassification.o : basicClassification.c NumClass.h
	gcc -Wall -g -c basicClassification.c 	


advancedClassificationLoop.o : advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -c advancedClassificationLoop.c


advancedClassificationRecursion.o : advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -c advancedClassificationRecursion.c

main.o: main.c NumClass.h
	gcc -Wall -g -c main.c 

loops: basicClassification.o advancedClassificationLoop.o 
	ar -rcs -o libclassloops.a basicClassification.o advancedClassificationLoop.o

recursives: basicClassification.o advancedClassificationRecursion.o 
	ar -rcs -o 	libclassrec.a  basicClassification.o advancedClassificationRecursion.o

recursived: basicClassification.o advancedClassificationRecursion.o     
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationRecursion.o

loopd: basicClassification.o advancedClassificationLoop.o 
	gcc -shared -o libclassloops.so basicClassification.o advancedClassificationLoop.o

mains: main.o libclassrec.a 
	gcc -Wall -g -o mains main.o libclassrec.a -lm

maindloop: main.o  
	gcc -Wall -g -o maindloop main.o ./libclassloops.so -lm

maindrec: main.o 
	gcc -Wall -g -o maindrec main.o ./libclassrec.so -lm
	
clean:
	rm -f *.o *.a *.so   mains maindloop maindrec
