**## Features

- Real-time memory usage monitoring
- Global variable tracking
- Function analysis with source location
- Table size reporting
- Thread status monitoring
- Garbage collection stats

## Usage

The analyzer runs automatically every 10 seconds and reports:

### X7K9M4 (Memory Overview)
- Current memory usage in human-readable format

### H2J9P5 (Global Variables)
- Lists all global variables and their types
- Total count of global variables

### L4R8T3 (Functions)
- Total function count
- Source file and line number for each function
- Instance count per location

### W6Y2N8 (Tables)
- Size of each table (number of elements)
- Total table count

### Q5F7B1 (Threads)
- Status of each thread
- Total thread count

### C3V8M2 (Garbage Collection)
- Memory usage before collection
- Memory usage after collection
- Amount of memory cleaned

## Safety Features

- Uses pcall for safe function execution
- Error handling with warning messages
- Safe thread spawning

## Requirements

- Lua 5.1 or later
- Access to debug library
- Access to coroutine library
- Access to a Executor

## Notes

Memory values are displayed in B, KB, MB, or GB as needed.
The analyzer runs in a separate thread to avoid blocking the main execution.
