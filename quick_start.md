# Expense Tracker - Quick Start Guide

Get started with your personal expense tracking in 5 minutes!

## 🚀 Installation (First Time Users)

### Windows Users

1. **Download and Install Java** (if not already installed)
   - Visit: https://www.oracle.com/java/technologies/downloads/
   - Download JDK 11 or higher
   - Run installer and follow prompts

2. **Download the Application**
   - Get `expense-tracker-1.0.0.jar`
   - Save it to your preferred location (e.g., `C:\ExpenseTracker\`)

3. **Run the Application**
   - Double-click `expense-tracker-1.0.0.jar`
   - OR open Command Prompt and run:
     ```
     java -jar expense-tracker-1.0.0.jar
     ```

### Mac/Linux Users

1. **Verify Java Installation**
   ```bash
   java -version
   ```
   If not installed, install JDK 11+

2. **Download and Run**
   ```bash
   java -jar expense-tracker-1.0.0.jar
   ```

---

## 📖 Your First 5 Minutes

### Step 1: Add Your First Expense (1 min)

1. Click the green **"Add Expense"** button
2. Fill in the details:
   - **Date**: Pick today's date
   - **Category**: Select "Food"
   - **Description**: Type "Lunch at café"
   - **Amount**: Enter 15.50
3. Click **"Save"**

🎉 **Success!** Your first expense is recorded!

### Step 2: Add More Expenses (2 min)

Add a few more expenses to see the app in action:

**Example 1: Transportation**
- Date: Today
- Category: Transportation
- Description: Uber to work
- Amount: 12.00

**Example 2: Shopping**
- Date: Yesterday
- Category: Shopping
- Description: New shoes
- Amount: 89.99

**Example 3: Utilities**
- Date: This week
- Category: Utilities
- Description: Electric bill
- Amount: 125.00

### Step 3: View Your Analytics (1 min)

1. Go to menu: **Analytics → View Charts**
2. See your expenses visualized in a pie chart!
3. Try switching to "Bar Chart - Monthly Trend"

### Step 4: Generate Monthly Summary (1 min)

1. Go to menu: **Analytics → Monthly Summary**
2. Click **"Generate Summary"**
3. See your spending breakdown with percentages!

---

## 🎯 Common Tasks

### Adding an Expense

```
Click "Add Expense" → Fill Form → Save
```

### Editing an Expense

```
Select Expense → Click "Edit Expense" → Modify → Save
```

### Deleting an Expense

```
Select Expense → Click "Delete Expense" → Confirm
```

### Filtering by Month

```
Select Month & Year → Click "Apply Filter"
```

### Viewing Charts

```
Menu: Analytics → View Charts
```

### Exporting Data

```
Menu: File → Export to CSV
```

---

## 💡 Pro Tips

### Tip 1: Use Descriptive Names
Instead of "Food", write "Lunch at Subway" or "Groceries at Walmart"

### Tip 2: Add Expenses Daily
Make it a habit to add expenses daily so you don't forget!

### Tip 3: Create Custom Categories
Go to **Categories → Manage Categories** to add your own categories like "Gym", "Pet Care", etc.

### Tip 4: Review Monthly
At the end of each month, generate a summary to see your spending patterns

### Tip 5: Export for Records
Export to CSV monthly and keep backup records

---

## 📊 Understanding the Interface

### Main Window Layout

```
┌────────────────────────────────────────┐
│  File  Analytics  Categories      ← Menu Bar
├────────────────────────────────────────┤
│  All Expenses                      ← Title
│  Filter: [Month] [Year] [Apply]   ← Filters
├────────────────────────────────────────┤
│  ID  Date  Category  Description  Amount  ← Table
│   1  10-22  Food     Lunch        $15.50
│   2  10-21  Shopping New shoes    $89.99
│                                    
│  Total: $105.49                    ← Running Total
├────────────────────────────────────────┤
│  [Add] [Edit] [Delete] [Refresh]  ← Actions
└────────────────────────────────────────┘
```

### Buttons Explained

- **🟢 Add Expense**: Create new expense entry
- **🔵 Edit Expense**: Modify selected expense
- **🔴 Delete Expense**: Remove selected expense
- **🔄 Refresh**: Reload data from database

---

## 📈 Understanding Charts

### Pie Chart (Category Breakdown)

Shows how much you spent in each category as a percentage of total spending.

**Best for**: Understanding where your money goes

**Example**:
- Food: 35%
- Transportation: 20%
- Shopping: 25%
- Utilities: 20%

### Bar Chart (Monthly Trend)

Shows your total spending for each month of the year.

**Best for**: Spotting spending patterns over time

**Example**:
- Identify high-spending months
- Compare current month to past months
- Track if you're reducing expenses

---

## 📋 Monthly Summary Explained

### What You'll See:

1. **Total Expenses**: Sum of all expenses for the month
2. **Number of Transactions**: How many times you spent money
3. **Average Transaction**: Total ÷ Number of transactions
4. **Category Breakdown**: 
   - Amount spent per category
   - Percentage of total
   - Visual progress bar
5. **Top 5 Expenses**: Your biggest purchases
6. **Daily Average**: Total ÷ days in month
7. **Previous Month Comparison**: How spending changed

### Example Summary:

```
═══════════════════════════════════════
   EXPENSE SUMMARY - OCTOBER 2025
═══════════════════════════════════════

Total Expenses: $1,250.00
Number of Transactions: 45
Average Transaction: $27.78

CATEGORY BREAKDOWN:
Food:                $450.00 (36.0%)
[████████████████████░░░░░░░░░░]

Transportation:      $200.00 (16.0%)
[████████░░░░░░░░░░░░░░░░░░░░░░]

Shopping:            $300.00 (24.0%)
[████████████░░░░░░░░░░░░░░░░░░]
```

---

## 🔧 Troubleshooting

### Problem: Application won't start

**Solution 1**: Check Java installation
```bash
java -version
```
Should show Java 11 or higher

**Solution 2**: Run from command line to see errors
```bash
java -jar expense-tracker-1.0.0.jar
```

### Problem: Database error

**Solution**: Delete `expenses.db` file and restart (creates fresh database)

⚠️ **Warning**: This deletes all data!

### Problem: Charts not showing

**Solution**: 
- Ensure you have expenses for the selected period
- Try different month/year selections
- Click "Refresh" button

### Problem: Can't export CSV

**Solution**: 
- Check file permissions in current directory
- Try running as administrator (Windows)
- Check if file is open in another program

---

## 📁 File Locations

After running, you'll find these files:

- **expenses.db**: Your database (contains all data)
- **expenses_export.csv**: Exported expense data
- **summary_[month]_[year].txt**: Exported summaries

💡 **Backup Tip**: Regularly copy `expenses.db` to a backup location!

---

## 🎓 Learning Path

### Week 1: Basic Usage
- Add expenses daily
- Try different categories
- View the table

### Week 2: Explore Features
- Use filters
- View charts
- Generate summaries

### Week 3: Advanced Usage
- Create custom categories
- Export data
- Compare months

### Week 4: Mastery
- Analyze spending patterns
- Set personal budgets (manually track)
- Make data-driven financial decisions

---

## 🆘 Getting Help

### Common Questions

**Q: Can I use this on multiple devices?**
A: Copy the `expenses.db` file to sync data between devices

**Q: Is my data secure?**
A: All data is stored locally on your computer

**Q: Can I track income too?**
A: Currently designed for expenses only

**Q: How do I backup my data?**
A: Copy the `expenses.db` file to a safe location

**Q: Can I share data with family?**
A: Export to CSV and share, or share the database file

---

## 🎯 Best Practices

### Daily Habits
✅ Add expenses as they happen  
✅ Use specific descriptions  
✅ Choose correct categories  

### Weekly Habits
✅ Review week's expenses  
✅ Check for missing entries  

### Monthly Habits
✅ Generate monthly summary  
✅ Analyze spending patterns  
✅ Export data for records  
✅ Backup database file  

---

## 🚀 Next Steps

Now that you're set up:

1. **Start tracking today!**
2. **Add at least 10 expenses this week**
3. **Review your first monthly summary**
4. **Identify one area to reduce spending**

---

## 📞 Quick Reference Card

```
┌─────────────────────────────────────┐
│     EXPENSE TRACKER CHEAT SHEET     │
├─────────────────────────────────────┤
│ Add Expense:      Green Button      │
│ Edit Expense:     Blue Button       │
│ Delete Expense:   Red Button        │
│ View Charts:      Analytics Menu    │
│ Monthly Summary:  Analytics Menu    │
│ Export CSV:       File Menu         │
│ Manage Categories: Categories Menu  │
└─────────────────────────────────────┘
```

---

**Happy Tracking! 💰📊**

*Remember: The first step to financial wellness is knowing where your money goes!*