.PHONY: all run run1 run2 clean

all:
	gcc -o chal -no-pie chal.c

run: run1 run2

run1: all
	@cat 1.txt | ./chal

run2: all
	@cat 2.txt | ./chal

clean:
	rm -f chal
