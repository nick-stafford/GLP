# GLP Pipeline Executor Makefile

CXX = g++
CXXFLAGS = -std=c++17 -Wall -O2

SRC_DIR = src
BUILD_DIR = build

SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
TARGET = $(BUILD_DIR)/glp

.PHONY: all clean run

all: $(TARGET)

$(TARGET):
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $(SRC_DIR)/*.cpp

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf $(BUILD_DIR)
