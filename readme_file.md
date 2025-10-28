# Expense Tracker with Monthly Analytics

A comprehensive Java desktop application for managing personal expenses with powerful analytics, charts, and monthly summaries.

## 🎯 Features

- **Expense Management**: Add, edit, and delete expenses with categories
- **Category Management**: Create custom expense categories
- **Monthly Analytics**: Detailed monthly summaries with SQL aggregations
- **Visual Charts**: Pie charts for category breakdown and bar charts for monthly trends
- **Data Export**: Export expenses and summaries to CSV files
- **Filtering**: Filter expenses by month and year
- **SQLite Database**: Persistent storage with relational database

## 🛠️ Technologies Used

- **Java 11+**: Core programming language
- **JavaFX 17**: Modern UI framework
- **SQLite**: Embedded database
- **JDBC**: Database connectivity
- **JFreeChart**: Chart generation library
- **Maven**: Build and dependency management

## 📋 Prerequisites

- Java Development Kit (JDK) 11 or higher
- Apache Maven 3.6+
- JavaFX SDK (included via Maven)

## 🚀 Project Setup

### 1. Project Structure

```
expense-tracker/
├── pom.xml
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── expensetracker/
│                   ├── ExpenseTrackerApp.java
│                   ├── DatabaseManager.java
│                   ├── Expense.java
│                   ├── ExpenseDialog.java
│                   ├── ChartWindow.java
│                   ├── MonthlySummaryWindow.java
│                   └── CategoryDialog.java
├── expenses.db (generated at runtime)
└── README.md
```

### 2. Database Schema

**Categories Table:**
```sql
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);
```

**Expenses Table:**
```sql
CREATE TABLE expenses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    amount REAL NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
```

### 3. Installation Steps

**Step 1: Clone or Create Project Directory**
```bash
mkdir expense-tracker
cd expense-tracker
```

**Step 2: Create Maven Project Structure**
```bash
mkdir -p src/main/java/com/expensetracker
```

**Step 3: Add All Java Files**
Copy all the provided Java files into `src/main/java/com/expensetracker/`:
- ExpenseTrackerApp.java
- DatabaseManager.java
- Expense.java
- ExpenseDialog.java
- ChartWindow.java
- MonthlySummaryWindow.java
- CategoryDialog.java

**Step 4: Add pom.xml**
Copy the provided `pom.xml` to the project root directory.

**Step 5: Build the Project**
```bash
mvn clean install
```

**Step 6: Run the Application**
```bash
mvn javafx:run
```

### 4. Creating Executable JAR

**Build JAR with Dependencies:**
```bash
mvn clean package
```

The executable JAR will be created at:
```
target/expense-tracker-1.0.0.jar
```

**Run the JAR:**
```bash
java -jar target/expense-tracker-1.0.0.jar
```

## 📊 Application Features Guide

### A. Adding Expenses

1. Click **"Add Expense"** button
2. Fill in the form:
   - **Date**: Select expense date
   - **Category**: Choose from dropdown
   - **Description**: Enter expense details
   - **Amount**: Enter amount (positive number)
3. Click **"Save"**

### B. Editing Expenses

1. Select an expense from the table
2. Click **"Edit Expense"**
3. Modify the details
4. Click **"Save"**

### C. Deleting Expenses

1. Select an expense from the table
2. Click **"Delete Expense"**
3. Confirm deletion

### D. Filtering Expenses

1. Select month and year from dropdowns
2. Click **"Apply Filter"**
3. Click **"Reset"** to view all expenses

### E. Viewing Charts

**Access Charts:**
- Menu: **Analytics → View Charts**

**Available Charts:**
1. **Pie Chart**: Category breakdown for selected month
2. **Bar Chart**: Monthly expense trends for selected year

**Features:**
- Interactive chart type selection
- Month and year filtering
- Real-time chart updates

### F. Monthly Summary

**Access Summary:**
- Menu: **Analytics → Monthly Summary**

**Summary Includes:**
- Total expenses
- Number of transactions
- Average transaction amount
- Category breakdown with percentages
- Visual progress bars
- Top 5 expenses
- Daily average
- Comparison with previous month

**Export Summary:**
- Click **"Export to CSV"** button
- File saved as `summary_[month]_[year].txt`

### G. Managing Categories

**Access Categories:**
- Menu: **Categories → Manage Categories**

**Operations:**
- View all categories
- Add new categories
- Remove existing categories (if not in use)

**Default Categories:**
- Food
- Transportation
- Entertainment
- Utilities
- Healthcare
- Shopping
- Education
- Other

### H. Exporting Data

**Export to CSV:**
- Menu: **File → Export to CSV**
- All expenses exported to `expenses_export.csv`

**CSV Format:**
```
ID,Date,Category,Description,Amount
1,2025-10-01,Food,"Grocery shopping",85.50
2,2025-10-02,Transportation,"Gas",45.00
```

## 🔍 SQL Query Examples

The application uses various SQL queries for analytics:

**1. Get Monthly Expenses:**
```sql
SELECT e.*, c.name as category 
FROM expenses e 
JOIN categories c ON e.category_id = c.id 
WHERE strftime('%m', e.date) = ? 
AND strftime('%Y', e.date) = ?
ORDER BY e.date DESC;
```

**2. Category Breakdown:**
```sql
SELECT c.name, SUM(e.amount) as total 
FROM expenses e 
JOIN categories c ON e.category_id = c.id 
WHERE strftime('%m', e.date) = ? 
AND strftime('%Y', e.date) = ? 
GROUP BY c.name 
ORDER BY total DESC;
```

**3. Monthly Totals:**
```sql
SELECT strftime('%m', date) as month, 
       SUM(amount) as total 
FROM expenses 
WHERE strftime('%Y', date) = ? 
GROUP BY month 
ORDER BY month;
```

## 📦 Deliverables

### 1. Application JAR
- **File**: `target/expense-tracker-1.0.0.jar`
- **Size**: ~15-20 MB (includes all dependencies)
- **Run**: `java -jar expense-tracker-1.0.0.jar`

### 2. Database File
- **File**: `expenses.db`
- **Location**: Project root directory
- **Type**: SQLite database
- **Auto-created**: On first run

### 3. Chart Screenshots

To capture charts:
1. Run application
2. Navigate to Analytics → View Charts
3. Generate different chart types
4. Take screenshots

**Recommended Screenshots:**
- Pie chart showing category breakdown
- Bar chart showing monthly trends
- Monthly summary report

### 4. Exported Data Files

**CSV Export:**
- `expenses_export.csv`: All expenses

**Summary Export:**
- `summary_[month]_[year].txt`: Monthly summary reports

## 🐛 Troubleshooting

### Issue: JavaFX not found
**Solution:**
```bash
# Ensure JavaFX is in Maven dependencies
mvn clean install -U
```

### Issue: Database locked
**Solution:**
- Close other instances of the application
- Delete `expenses.db` and restart (creates fresh database)

### Issue: Charts not displaying
**Solution:**
- Ensure JFreeChart dependency is included
- Check console for error messages
- Verify Java Swing compatibility

### Issue: JAR won't run
**Solution:**
```bash
# Build with dependencies
mvn clean package

# Run with specific Java version
java -version
java -jar target/expense-tracker-1.0.0.jar
```

## 🎨 Customization

### Adding New Categories
1. Open application
2. Menu: Categories → Manage Categories
3. Enter new category name
4. Click "Add Category"

### Modifying UI Colors
Edit the button styles in `ExpenseTrackerApp.java`:
```java
addBtn.setStyle("-fx-background-color: #4CAF50; -fx-text-fill: white;");
```

### Changing Database Location
Modify `DatabaseManager.java`:
```java
private static final String DB_URL = "jdbc:sqlite:path/to/expenses.db";
```

## 📈 Future Enhancements

Potential features to add:
- Budget planning and alerts
- Recurring expense tracking
- Multi-currency support
- Cloud backup integration
- Mobile app companion
- PDF report generation
- Advanced data visualization
- Expense predictions using ML

## 📝 License

This project is open-source and available for educational purposes.

## 👥 Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Submit a pull request

## 📧 Support

For issues or questions:
- Check the troubleshooting section
- Review Java/JavaFX documentation
- Check SQLite JDBC documentation
- Review JFreeChart API documentation

## 🎓 Learning Resources

- **JavaFX**: https://openjfx.io/
- **SQLite**: https://www.sqlite.org/
- **JFreeChart**: https://www.jfree.org/jfreechart/
- **Maven**: https://maven.apache.org/

---

**Built with ❤️ using Java, JavaFX, SQLite, and JFreeChart**