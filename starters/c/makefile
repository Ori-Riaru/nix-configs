TARGET = output
SOURCES = main.c
BUILD_DIR = build
CC = gcc
CFLAGS = -O3 -Wall
LFLAGS = -lm

OBJS = $(SOURCES:.c=.o)
BUILD_OBJS = $(addprefix $(BUILD_DIR)/, $(OBJS))

.PHONY: all clean purge

all: $(TARGET)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(TARGET): $(BUILD_DIR) $(BUILD_OBJS)
	$(CC) $(BUILD_OBJS) -o $@ $(LFLAGS)

$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

purge: clean
	rm -f $(TARGET)