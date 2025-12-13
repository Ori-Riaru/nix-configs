TARGET = output
SOURCES = main.cpp
BUILD_DIR = build
CC = g++
CFLAGS = -O3
LFLAGS = -lm

OBJS = $(SOURCES:.c=.o)
OBJS := $(OBJS:.cpp=.o)
BUILD_OBJS = $(addprefix $(BUILD_DIR)/, $(OBJS))

.PHONY: all clean purge

all: $(TARGET)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(TARGET): $(BUILD_DIR) $(BUILD_OBJS)
	$(CC) $(BUILD_OBJS) -o $@ $(LFLAGS)

$(BUILD_DIR)/%.o: %.cpp | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

purge: clean
	rm -f $(TARGET)