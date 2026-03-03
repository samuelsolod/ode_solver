# The compiler to use
CXX = g++

# Compiler flags (Warnings enabled, C++17 standard)
CXXFLAGS = -Wall -std=c++17 -I.

# The name of your final executable
TARGET = solver

# Find all .cpp files in the current dir and the euler subdir
SRCS = main.cpp $(wildcard euler/*.cpp)

# Generate a list of .o (object) files from the .cpp files
OBJS = $(SRCS:.cpp=.o)

# The default rule: build the target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Rule to compile .cpp files into .o files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up the build files
clean:
	rm -f $(OBJS) $(TARGET)
