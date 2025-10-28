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

### 4. Chart Visualization Tests

**Test 4.1: Pie Chart - Category Breakdown**
- **Steps:**
  1. Add multiple expenses in different categories
  2. Menu → Analytics → View Charts
  3. Select "Pie Chart - Category Breakdown"
  4. Select current month and year
- **Expected Result:** 
  - Pie chart displays with all categories
  - Percentages add up to 100%
  - Labels show category names and amounts
- **Status:** ☐ Pass ☐ Fail

**Test 4.2: Bar Chart - Monthly Trend**
- **Steps:**
  1. Add expenses across multiple months
  2. Open Charts window
  3. Select "Bar Chart - Monthly Trend"
  4. Select year
- **Expected Result:** 
  - Bar chart shows all 12 months
  - Heights correspond to amounts
  - Months without expenses show zero
- **Status:** ☐ Pass ☐ Fail

**Test 4.3: Chart with No Data**
- **Steps:**
  1. Filter to month with no expenses
  2. Open Charts window
- **Expected Result:** Chart displays "No Data" message
- **Status:** ☐ Pass ☐ Fail

**Test 4.4: Chart Refresh**
- **Steps:**
  1. View chart
  2. Change month/year selection
  3. Click "Refresh"
- **Expected Result:** Chart updates with new data
- **Status:** ☐ Pass ☐ Fail

---

### 5. Monthly Summary Tests

**Test 5.1: Generate Monthly Summary**
- **Steps:**
  1. Add 5-10 expenses for a month
  2. Menu → Analytics → Monthly Summary
  3. Select month and year
  4. Click "Generate Summary"
- **Expected Result:** 
  - Total expenses calculated
  - Number of transactions shown
  - Average transaction displayed
  - Category breakdown with percentages
  - Progress bars visible
  - Top 5 expenses listed
- **Status:** ☐ Pass ☐ Fail

**Test 5.2: Summary with Previous Month Comparison**
- **Steps:**
  1. Add expenses for two consecutive months
  2. Generate summary for second month
- **Expected Result:** 
  - Comparison section shows previous month data
  - Change amount calculated
  - Change percentage displayed
- **Status:** ☐ Pass ☐ Fail

**Test 5.3: Export Summary to Text**
- **Steps:**
  1. Generate summary
  2. Click "Export to CSV"
- **Expected Result:** 
  - Text file created: `summary_[month]_[year].txt`
  - File contains formatted summary
- **Status:** ☐ Pass ☐ Fail

**Test 5.4: Summary with No Data**
- **Steps:**
  1. Select month with no expenses
  2. Generate summary
- **Expected Result:** "No expenses recorded for this period" message
- **Status:** ☐ Pass ☐ Fail

---

### 6. Category Management Tests

**Test 6.1: View All Categories**
- **Steps:**
  1. Menu → Categories → Manage Categories
- **Expected Result:** All categories listed
- **Status:** ☐ Pass ☐ Fail

**Test 6.2: Add New Category**
- **Steps:**
  1. Open Manage Categories
  2. Enter "Investments" in text field
  3. Click "Add Category"
- **Expected Result:** 
  - Success message
  - New category appears in list
  - Available in expense form dropdown
- **Status:** ☐ Pass ☐ Fail

**Test 6.3: Add Duplicate Category**
- **Steps:**
  1. Try to add existing category (e.g., "Food")
  2. Click "Add Category"
- **Expected Result:** Error message displayed
- **Status:** ☐ Pass ☐ Fail

**Test 6.4: Add Empty Category**
- **Steps:**
  1. Leave category field empty
  2. Click "Add Category"
- **Expected Result:** No action or validation error
- **Status:** ☐ Pass ☐ Fail

**Test 6.5: Delete Category**
- **Steps:**
  1. Add custom category with no expenses
  2. Select category
  3. Click "Remove Selected Category"
  4. Confirm deletion
- **Expected Result:** 
  - Category removed from list
  - Not available in dropdown
- **Status:** ☐ Pass ☐ Fail

**Test 6.6: Delete Category in Use**
- **Steps:**
  1. Try to delete category with associated expenses
- **Expected Result:** 
  - Deletion may fail (database constraint)
  - Or expenses orphaned (depending on implementation)
- **Status:** ☐ Pass ☐ Fail

---

### 7. Data Export Tests

**Test 7.1: Export All Expenses to CSV**
- **Steps:**
  1. Add multiple expenses
  2. Menu → File → Export to CSV
- **Expected Result:** 
  - File `expenses_export.csv` created
  - Contains all expenses
  - Proper CSV format
  - Headers: ID, Date, Category, Description, Amount
- **Status:** ☐ Pass ☐ Fail

**Test 7.2: Export Empty Database**
- **Steps:**
  1. Delete all expenses
  2. Export to CSV
- **Expected Result:** CSV with headers only
- **Status:** ☐ Pass ☐ Fail

**Test 7.3: CSV Format Validation**
- **Steps:**
  1. Export expenses
  2. Open CSV in spreadsheet software
- **Expected Result:** 
  - Data loads correctly
  - Commas handled properly in descriptions
  - Quotes around text fields
- **Status:** ☐ Pass ☐ Fail

---

### 8. UI/UX Tests

**Test 8.1: Table Sorting**
- **Steps:**
  1. Add multiple expenses
  2. Click on table column headers
- **Expected Result:** Table sorts by clicked column
- **Status:** ☐ Pass ☐ Fail

**Test 8.2: Table Selection**
- **Steps:**
  1. Click on different rows in table
- **Expected Result:** Row highlights on selection
- **Status:** ☐ Pass ☐ Fail

**Test 8.3: Total Label Updates**
- **Steps:**
  1. Add/edit/delete expenses
  2. Observe total label
- **Expected Result:** Total updates automatically
- **Status:** ☐ Pass ☐ Fail

**Test 8.4: Dialog Cancel**
- **Steps:**
  1. Open Add/Edit dialog
  2. Enter data
  3. Click "Cancel"
- **Expected Result:** 
  - Dialog closes
  - No changes saved
- **Status:** ☐ Pass ☐ Fail

**Test 8.5: Refresh Button**
- **Steps:**
  1. Click "Refresh" button
- **Expected Result:** Table reloads from database
- **Status:** ☐ Pass ☐ Fail

---

### 9. Database Persistence Tests

**Test 9.1: Data Persistence**
- **Steps:**
  1. Add expenses
  2. Close application
  3. Reopen application
- **Expected Result:** All expenses still present
- **Status:** ☐ Pass ☐ Fail

**Test 9.2: Database File Integrity**
- **Steps:**
  1. Use SQLite browser to open `expenses.db`
  2. Verify schema and data
- **Expected Result:** 
  - Tables exist: categories, expenses
  - Foreign key relationships correct
  - Data matches application display
- **Status:** ☐ Pass ☐ Fail

**Test 9.3: Concurrent Access**
- **Steps:**
  1. Open two instances of application
  2. Add expense in first instance
  3. Refresh second instance
- **Expected Result:** 
  - Second instance sees new expense
  - Or database locked error
- **Status:** ☐ Pass ☐ Fail

---

### 10. Error Handling Tests

**Test 10.1: Database Connection Error**
- **Steps:**
  1. Make `expenses.db` read-only
  2. Try to add expense
- **Expected Result:** Appropriate error message
- **Status:** ☐ Pass ☐ Fail

**Test 10.2: Invalid Date Format**
- **Steps:**
  1. Manually edit date field (if possible)
  2. Enter invalid date
- **Expected Result:** Validation error or date picker prevents invalid input
- **Status:** ☐ Pass ☐ Fail

**Test 10.3: Large Amount Values**
- **Steps:**
  1. Enter amount: 999999999.99
  2. Save expense
- **Expected Result:** 
  - Expense saved correctly
  - Display handles large numbers
- **Status:** ☐ Pass ☐ Fail

**Test 10.4: Special Characters in Description**
- **Steps:**
  1. Enter description: "Test's "expense" with $pecial ch@rs!"
  2. Save expense
- **Expected Result:** 
  - Saves correctly
  - Displays correctly
  - Exports correctly to CSV
- **Status:** ☐ Pass ☐ Fail

---

## 📊 Performance Tests

**Test P.1: Large Dataset Handling**
- **Steps:**
  1. Import/create 1000+ expenses
  2. Test all features
- **Expected Result:** Application remains responsive
- **Status:** ☐ Pass ☐ Fail

**Test P.2: Chart Rendering Speed**
- **Steps:**
  1. Generate charts with 12 months of data
  2. Measure load time
- **Expected Result:** Charts render within 2-3 seconds
- **Status:** ☐ Pass ☐ Fail

**Test P.3: Database Query Performance**
- **Steps:**
  1. Apply various filters
  2. Generate summaries
- **Expected Result:** Queries complete quickly (<1 second)
- **Status:** ☐ Pass ☐ Fail

---

## 🔒 Security Tests

**Test S.1: SQL Injection Prevention**
- **Steps:**
  1. Enter: `'; DROP TABLE expenses; --` in description
  2. Save expense
- **Expected Result:** 
  - Input saved as literal text
  - No SQL execution
  - Database intact
- **Status:** ☐ Pass ☐ Fail

**Test S.2: File Path Traversal**
- **Steps:**
  1. Attempt to export to: `../../etc/passwd`
- **Expected Result:** Export restricted to current directory
- **Status:** ☐ Pass ☐ Fail

---

## 📝 Test Report Template

### Test Execution Summary

- **Date:** [Date]
- **Tester:** [Name]
- **Version:** 1.0.0
- **Environment:** [OS, Java version]

### Results

| Category | Total | Passed | Failed | N/A |
|----------|-------|--------|--------|-----|
| Database | 2 | | | |
| Expense Management | 6 | | | |
| Filtering | 3 | | | |
| Charts | 4 | | | |
| Summary | 4 | | | |
| Categories | 6 | | | |
| Export | 3 | | | |
| UI/UX | 5 | | | |
| Persistence | 3 | | | |
| Error Handling | 4 | | | |
| Performance | 3 | | | |
| Security | 2 | | | |
| **TOTAL** | **45** | | | |

### Critical Issues Found

1. [Issue description]
2. [Issue description]

### Recommendations

1. [Recommendation]
2. [Recommendation]

---

## 🚀 Acceptance Criteria

Application is ready for deployment when:

- [ ] All critical tests pass
- [ ] No data loss occurs
- [ ] Charts display correctly
- [ ] Export functions work
- [ ] Database persists data
- [ ] UI is responsive
- [ ] No crashes during normal use
- [ ] Performance is acceptable
- [ ] Security measures in place

---

## 📞 Reporting Issues

When reporting issues, include:

1. **Test Case ID**: (e.g., Test 2.1)
2. **Steps to Reproduce**: Detailed steps
3. **Expected Result**: What should happen
4. **Actual Result**: What actually happened
5. **Screenshots**: If applicable
6. **Environment**: OS, Java version
7. **Severity**: Critical/High/Medium/Low

---

**Happy Testing! 🎉** 2. Expense Management Tests

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