In `project3/mymalloc/`, create and run this script (e.g. you can call it `setup-test-real-local.sh`)

```bash
#!/bin/bash

# Function to ask for user approval
function ask_for_approval {
    read -p "$1 Do you want to continue? (y/N): " -n 1 -r
    echo    # Move to a new line
    # Default to 'N' if no input is provided
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Operation cancelled."
        exit 1
    fi
}

# Get the directory where the script is located
SCRIPT_DIR="$(dirname "$(realpath "$0")")" # e.g. ~/6.106/project3/mymalloc
cd "$SCRIPT_DIR/../.." || { echo "Failed to navigate to the parent directory."; exit 1; }
PARENT_DIR="$(pwd)" # e.g. ~/6.106/

# Clone abridged version of llvm-test-suite locally
ask_for_approval "Cloning git@github.com:snowmonkey18/llvm-test-suite-6106-proj3.git into $PARENT_DIR/llvm-test-suite."
git clone --depth 1 git@github.com:snowmonkey18/llvm-test-suite-6106-proj3.git llvm-test-suite || { echo "Failed to clone repository."; exit 1; }
cd llvm-test-suite || { echo "Failed to navigate into llvm-test-suite directory."; exit 1; }

# Build the project
ask_for_approval "Building the llvm-test-suite."
mkdir build && cd build || { echo "Failed to create or navigate to the build directory."; exit 1; }
cmake .. || { echo "CMake configuration failed."; exit 1; }
make -j$(nproc) || { echo "Build failed."; exit 1; }

# Navigate to project3/mymalloc
cd "$SCRIPT_DIR" || { echo "Failed to navigate to project3/mymalloc directory."; exit 1; }

# Create a local version of test-real.sh
ask_for_approval "Creating a local version of test-real.sh at $SCRIPT_DIR/test-real-local.sh."
cp test-real.sh test-real-local.sh && sed -i '10s|.*|TEST_PATH=../../llvm-test-suite/build/MultiSource/Benchmarks|' test-real-local.sh
echo "Setup complete! Run the local test script with:"
echo
echo "./test-real-local.sh malloc_wrapper.so"
```
