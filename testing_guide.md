# Expense Tracker - Testing Guide

Complete testing manual for the Expense Tracker application.

## 📋 Pre-Testing Checklist

- [ ] Java 11+ installed and configured
- [ ] Maven installed and accessible
- [ ] Project compiled successfully
- [ ] Database file (`expenses.db`) accessible
- [ ] All dependencies resolved

## 🧪 Test Scenarios

### 1. Database Initialization Tests

**Test 1.1: First Launch - Database Creation**
- **Steps:**
  1. Delete `expenses.db` if it exists
  2. Launch application
  3. Check if `expenses.db` is created
- **Expected Result:** Database file created with schema and default categories
- **Status:** ☐ Pass ☐ Fail

**Test 1.2: Default Categories Load**
- **Steps:**
  1. Launch application
  2. Click "Add Expense"
  3. Check category dropdown
- **Expected Result:** 8 default categories displayed (Food, Transportation, etc.)
- **Status:** ☐ Pass ☐ Fail

---

### 2. Expense Management Tests

**Test 2.1: Add New Expense - Valid Data**
- **Steps:**
  1. Click "Add Expense"
  2. Fill form:
     - Date: 2025-10-22
     - Category: Food
     - Description: Grocery shopping
     - Amount: 85.50
  3. Click "Save"
- **Expected Result:** 
  - Success message displayed
  - Expense appears in table
  - Total updated
- **Status:** ☐ Pass ☐ Fail

**Test 2.2: Add Expense - Invalid Amount**
- **Steps:**
  1. Click "Add Expense"
  2. Enter negative amount: -50
  3. Click "Save"
- **Expected Result:** Validation error displayed
- **Status:** ☐ Pass ☐ Fail

**Test 2.3: Add Expense - Empty Description**
- **Steps:**
  1. Click "Add Expense"
  2. Leave description empty
  3. Click "Save"
- **Expected Result:** Validation error displayed
- **Status:** ☐ Pass ☐ Fail

**Test 2.4: Edit Existing Expense**
- **Steps:**
  1. Select an expense from table
  2. Click "Edit Expense"
  3. Modify amount to 100.00
  4. Click "Save"
- **Expected Result:** 
  - Expense updated in table
  - Total recalculated
- **Status:** ☐ Pass ☐ Fail

**Test 2.5: Delete Expense**
- **Steps:**
  1. Select an expense
  2. Click "Delete Expense"
  3. Confirm deletion
- **Expected Result:** 
  - Expense removed from table
  - Total updated
- **Status:** ☐ Pass ☐ Fail

**Test 2.6: Delete Without Selection**
- **Steps:**
  1. Ensure no expense is selected
  2. Click "Delete Expense"
- **Expected Result:** Warning message displayed
- **Status:** ☐ Pass ☐ Fail

---

### 3. Filtering Tests

**Test 3.1: Filter by Month**
- **Steps:**
  1. Add expenses for different months
  2. Select "October" from month dropdown
  3. Click "Apply Filter"
- **Expected Result:** Only October expenses displayed
- **Status:** ☐ Pass ☐ Fail

**Test 3.2: Filter by Year**
- **Steps:**
  1. Add expenses for different years
  2. Select year from dropdown
  3. Click "Apply Filter"
- **Expected Result:** Only selected year expenses displayed
- **Status:** ☐ Pass ☐ Fail

**Test 3.3: Reset Filter**
- **Steps:**
  1. Apply a filter
  2. Click "Reset"
- **Expected Result:** All expenses displayed
- **Status:** ☐ Pass ☐ Fail

---

###