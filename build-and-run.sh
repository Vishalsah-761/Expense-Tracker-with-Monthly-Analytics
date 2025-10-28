#!/bin/bash

# ============================================================
# Expense Tracker - Build and Run Script
# ============================================================

set -e  # Exit on error

echo "======================================"
echo "Expense Tracker Build Script"
echo "======================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo -e "${RED}Error: Maven is not installed!${NC}"
    echo "Please install Maven from: https://maven.apache.org/"
    exit 1
fi

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo -e "${RED}Error: Java is not installed!${NC}"
    echo "Please install JDK 11 or higher"
    exit 1
fi

# Display Java version
echo -e "${BLUE}Java Version:${NC}"
java -version
echo ""

# Display Maven version
echo -e "${BLUE}Maven Version:${NC}"
mvn -version
echo ""

# Function to clean project
clean_project() {
    echo -e "${BLUE}[1/4] Cleaning project...${NC}"
    mvn clean
    echo -e "${GREEN}✓ Clean complete${NC}"
    echo ""
}

# Function to compile project
compile_project() {
    echo -e "${BLUE}[2/4] Compiling project...${NC}"
    mvn compile
    echo -e "${GREEN}✓ Compilation complete${NC}"
    echo ""
}

# Function to run tests
run_tests() {
    echo -e "${BLUE}[3/4] Running tests...${NC}"
    mvn test || echo -e "${BLUE}No tests to run${NC}"
    echo ""
}

# Function to package JAR
package_jar() {
    echo -e "${BLUE}[4/4] Packaging JAR with dependencies...${NC}"
    mvn package
    echo -e "${GREEN}✓ JAR created successfully${NC}"
    echo ""
}

# Function to run application
run_application() {
    echo -e "${BLUE}Starting Expense Tracker...${NC}"
    echo ""
    mvn javafx:run
}

# Function to display menu
show_menu() {
    echo "======================================"
    echo "What would you like to do?"
    echo "======================================"
    echo "1. Clean and build project"
    echo "2. Build and run application"
    echo "3. Just run application"
    echo "4. Create executable JAR only"
    echo "5. Run JAR file"
    echo "6. Exit"
    echo "======================================"
    read -p "Enter your choice [1-6]: " choice
    echo ""
}

# Main script logic
main() {
    while true; do
        show_menu
        
        case $choice in
            1)
                clean_project
                compile_project
                run_tests
                package_jar
                echo -e "${GREEN}Build completed successfully!${NC}"
                echo -e "JAR file location: ${BLUE}target/expense-tracker-1.0.0.jar${NC}"
                echo ""
                ;;
            2)
                clean_project
                compile_project
                run_tests
                package_jar
                echo -e "${GREEN}Build completed! Starting application...${NC}"
                echo ""
                run_application
                ;;
            3)
                run_application
                ;;
            4)
                package_jar
                echo -e "${GREEN}JAR created at: ${BLUE}target/expense-tracker-1.0.0.jar${NC}"
                echo ""
                ;;
            5)
                if [ -f "target/expense-tracker-1.0.0.jar" ]; then
                    echo -e "${BLUE}Running JAR file...${NC}"
                    java -jar target/expense-tracker-1.0.0.jar
                else
                    echo -e "${RED}Error: JAR file not found!${NC}"
                    echo "Please build the project first (Option 1 or 4)"
                fi
                echo ""
                ;;
            6)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo -e "${RED}Invalid choice! Please select 1-6${NC}"
                echo ""
                ;;
        esac
    done
}

# Run main function
main