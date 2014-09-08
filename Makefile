# Custom makefile Raytracer project.
# (Couldn't get the other one working, but did take some things from it.)

CC=g++

BUILD_DIR=./bin
NFF_DIR=./nff
PICS_DIR=./pics
SRC_DIR=./src

# CFLAGS=-std=c++11 -g -Wall
CFLAGS=-g -Wall

SRCS=$(wildcard $(SRC_DIR)/*.cpp)
OBJS=$(SRCS:.cpp=.o)

EXEC=$(BUILD_DIR)/trace

$(EXEC):

%.png: %.pam
	convert $(PICS_DIR)/$< $(PICS_DIR)/$@

%.pam: $(NFF_DIR)/%.nff $(EXEC)
	$(EXEC) -l $<

$(EXEC): $(OBJS)
	$(CC) $(CFLAGS) -o $(EXEC) $(OBJS)

.cpp.o:
	$(CC) $(CFLAGS) -c $< -o $@
