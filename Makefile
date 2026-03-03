CXX      := g++
CXXFLAGS := -Wall -Wextra -std=c++17 -Isrc
TARGET   := ode_solver
SRC_DIR  := src
OBJ_DIR  := obj

# Only looks inside src/ for .cpp files
SRCS     := $(shell find $(SRC_DIR) -name '*.cpp')
OBJS     := $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(TARGET)

.PHONY: all clean
