#!/bin/bash

# =========================================================
# Docker Lab Validation Script
# =========================================================

# -------------------------------
# Color Codes
# -------------------------------

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# -------------------------------
# Variables
# -------------------------------

PASS_COUNT=0
FAIL_COUNT=0

HOSTNAME=$(hostname)
CURRENT_DATE=$(date +"%Y-%m-%d")
CURRENT_TIME=$(date +"%H:%M:%S")

# =========================================================
# Function : validate_result
# =========================================================

validate_result() {

    case $1 in

        0)
            echo -e "${GREEN}[PASS] $2${NC}"
            PASS_COUNT=$((PASS_COUNT+1))
            ;;

        *)
            echo -e "${RED}[FAIL] $2${NC}"
            FAIL_COUNT=$((FAIL_COUNT+1))
            ;;

    esac
}

# =========================================================
# Function : validate_lab01
# =========================================================

validate_lab01() {

    echo
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}        VALIDATING LAB01 - DOCKER BASICS       ${NC}"
    echo -e "${BLUE}================================================${NC}"

    echo -e "${YELLOW}Hostname : ${HOSTNAME}${NC}"
    echo -e "${YELLOW}Date     : ${CURRENT_DATE}${NC}"
    echo -e "${YELLOW}Time     : ${CURRENT_TIME}${NC}"

    echo -e "${BLUE}================================================${NC}"
    echo

    # ---------------------------------------------------------
    # Test 1 - Docker Version Command
    # ---------------------------------------------------------

    echo -e "${YELLOW}Test 1: Validate Docker Version Command${NC}"

    docker version >/tmp/docker_version.out 2>/tmp/docker_version.err

    validate_result $? "Docker version command executed successfully"

    echo

    # ---------------------------------------------------------
    # Test 2 - Docker Version Output
    # ---------------------------------------------------------

    echo -e "${YELLOW}Test 2: Validate Docker Version Output${NC}"

    grep -q "Client:" /tmp/docker_version.out
    CLIENT_STATUS=$?

    grep -q "Server:" /tmp/docker_version.out
    SERVER_STATUS=$?

    if [ $CLIENT_STATUS -eq 0 ] && [ $SERVER_STATUS -eq 0 ]; then
        validate_result 0 "Docker version output contains Client and Server details"
    else
        validate_result 1 "Docker version output validation failed"
    fi

    echo

    # ---------------------------------------------------------
    # Test 3 - Docker Daemon Status
    # ---------------------------------------------------------

    echo -e "${YELLOW}Test 3: Validate Docker Daemon Status${NC}"

    systemctl is-active --quiet docker

    validate_result $? "Docker daemon is running"

    echo

    # =========================================================
    # Final Summary
    # =========================================================

    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}              LAB01 VALIDATION SUMMARY          ${NC}"
    echo -e "${BLUE}================================================${NC}"

    echo -e "${GREEN}Passed Tests : ${PASS_COUNT}${NC}"
    echo -e "${RED}Failed Tests : ${FAIL_COUNT}${NC}"

    echo -e "${BLUE}================================================${NC}"

    # =========================================================
    # Final Result
    # =========================================================

    if [ $FAIL_COUNT -eq 0 ]; then
        echo -e "${GREEN}[FINAL RESULT] LAB01 VALIDATION PASSED${NC}"
    else
        echo -e "${RED}[FINAL RESULT] LAB01 VALIDATION FAILED${NC}"
    fi
}

# =========================================================
# Main Menu
# =========================================================

echo -e "${BLUE}================================================${NC}"
echo -e "${BLUE}            DOCKER LAB VALIDATION MENU          ${NC}"
echo -e "${BLUE}================================================${NC}"

echo -e "${YELLOW}Select the Lab to Validate:${NC}"
echo
echo "1) LAB01 - Docker Basics"
echo "2) Exit"
echo

read -p "Enter your choice: " CHOICE

case $CHOICE in

    1)
        validate_lab01
        ;;

    2)
        echo -e "${YELLOW}Exiting Validation Script...${NC}"
        exit 0
        ;;

    *)
        echo -e "${RED}Invalid Choice. Please select a valid option.${NC}"
        exit 1
        ;;

esac
