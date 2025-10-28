-- ============================================================
-- EXPENSE TRACKER DATABASE SCHEMA & SQL QUERIES
-- ============================================================

-- ------------------------------------------------------------
-- TABLE DEFINITIONS
-- ------------------------------------------------------------

-- Categories Table
CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);

-- Expenses Table
CREATE TABLE IF NOT EXISTS expenses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,              -- Format: YYYY-MM-DD
    category_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    amount REAL NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- ------------------------------------------------------------
-- INDEXES FOR PERFORMANCE
-- ------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_expenses_date 
ON expenses(date);

CREATE INDEX IF NOT EXISTS idx_expenses_category 
ON expenses(category_id);

CREATE INDEX IF NOT EXISTS idx_expenses_month_year 
ON expenses(strftime('%Y-%m', date));

-- ------------------------------------------------------------
-- INSERT DEFAULT CATEGORIES
-- ------------------------------------------------------------

INSERT OR IGNORE INTO categories (name) VALUES 
    ('Food'),
    ('Transportation'),
    ('Entertainment'),
    ('Utilities'),
    ('Healthcare'),
    ('Shopping'),
    ('Education'),
    ('Other');

-- ------------------------------------------------------------
-- SAMPLE DATA INSERTION
-- ------------------------------------------------------------

-- Insert sample expenses
INSERT INTO expenses (date, category_id, description, amount) VALUES
    ('2025-10-01', 1, 'Grocery shopping at Walmart', 85.50),
    ('2025-10-02', 2, 'Gas fill-up', 45.00),
    ('2025-10-03', 3, 'Movie tickets', 30.00),
    ('2025-10-05', 1, 'Restaurant dinner', 65.75),
    ('2025-10-07', 4, 'Electricity bill', 120.00),
    ('2025-10-10', 2, 'Uber ride', 15.50),
    ('2025-10-12', 6, 'Clothing purchase', 89.99),
    ('2025-10-15', 1, 'Coffee shop', 12.50);

-- ------------------------------------------------------------
-- QUERY: GET ALL EXPENSES WITH CATEGORY NAMES
-- ------------------------------------------------------------

SELECT 
    e.id,
    e.date,
    c.name AS category,
    e.description,
    e.amount
FROM expenses e
JOIN categories c ON e.category_id = c.id
ORDER BY e.date DESC;

-- ------------------------------------------------------------
-- QUERY: GET EXPENSES FOR SPECIFIC MONTH AND YEAR
-- ------------------------------------------------------------

-- Get October 2025 expenses
SELECT 
    e.id,
    e.date,
    c.name AS category,
    e.description,
    e.amount
FROM expenses e
JOIN categories c ON e.category_id = c.id
WHERE strftime('%m', e.date) = '10'
  AND strftime('%Y', e.date) = '2025'
ORDER BY e.date DESC;

-- ------------------------------------------------------------
-- QUERY: MONTHLY SUMMARY STATISTICS
-- ------------------------------------------------------------

-- Total expenses, count, and average for a month
SELECT 
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_spent,
    AVG(amount) AS average_transaction,
    MIN(amount) AS min_expense,
    MAX(amount) AS max_expense
FROM expenses
WHERE strftime('%m', date) = '10'
  AND strftime('%Y', date) = '2025';

-- ------------------------------------------------------------
-- QUERY: CATEGORY BREAKDOWN FOR PIE CHART
-- ------------------------------------------------------------

-- Get total spending by category for a specific month
SELECT 
    c.name AS category,
    SUM(e.amount) AS total,
    COUNT(e.id) AS transaction_count,
    ROUND((SUM(e.amount) * 100.0 / (
        SELECT SUM(amount) 
        FROM expenses 
        WHERE strftime('%m', date) = '10' 
          AND strftime('%Y', date) = '2025'
    )), 2) AS percentage
FROM expenses e
JOIN categories c ON e.category_id = c.id
WHERE strftime('%m', e.date) = '10'
  AND strftime('%Y', e.date) = '2025'
GROUP BY c.name
ORDER BY total DESC;

-- ------------------------------------------------------------
-- QUERY: MONTHLY TREND FOR BAR CHART
-- ------------------------------------------------------------

-- Get monthly totals for entire year
SELECT 
    strftime('%m', date) AS month,
    SUM(amount) AS total
FROM expenses
WHERE strftime('%Y', date) = '2025'
GROUP BY month
ORDER BY month;

-- With month names
SELECT 
    CASE strftime('%m', date)
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END AS month_name,
    SUM(amount) AS total
FROM expenses
WHERE strftime('%Y', date) = '2025'
GROUP BY strftime('%m', date)
ORDER BY strftime('%m', date);

-- ------------------------------------------------------------
-- QUERY: TOP N EXPENSES
-- ------------------------------------------------------------

-- Get top 5 highest expenses for a month
SELECT 
    e.date,
    c.name AS category,
    e.description,
    e.amount
FROM expenses e
JOIN categories c ON e.category_id = c.id
WHERE strftime('%m', e.date) = '10'
  AND strftime('%Y', e.date) = '2025'
ORDER BY e.amount DESC
LIMIT 5;

-- ------------------------------------------------------------
-- QUERY: DAILY SPENDING PATTERN
-- ------------------------------------------------------------

-- Daily totals for a month
SELECT 
    date,
    SUM(amount) AS daily_total,
    COUNT(*) AS transaction_count
FROM expenses
WHERE strftime('%m', date) = '10'
  AND strftime('%Y', date) = '2025'
GROUP BY date
ORDER BY date;

-- ------------------------------------------------------------
-- QUERY: COMPARISON WITH PREVIOUS MONTH
-- ------------------------------------------------------------

-- Compare current month with previous month
SELECT 
    'Current Month' AS period,
    SUM(amount) AS total
FROM expenses
WHERE strftime('%Y-%m', date) = '2025-10'

UNION ALL

SELECT 
    'Previous Month' AS period,
    SUM(amount) AS total
FROM expenses
WHERE strftime('%Y-%m', date) = '2025-09';

-- ------------------------------------------------------------
-- QUERY: YEAR-TO-DATE TOTALS
-- ------------------------------------------------------------

SELECT 
    SUM(amount) AS ytd_total,
    COUNT(*) AS ytd_transactions,
    AVG(amount) AS ytd_average
FROM expenses
WHERE strftime('%Y', date) = '2025';

-- ------------------------------------------------------------
-- QUERY: CATEGORY STATISTICS
-- ------------------------------------------------------------

-- Get statistics for each category (all time)
SELECT 
    c.name AS category,
    COUNT(e.id) AS total_transactions,
    SUM(e.amount) AS total_spent,
    AVG(e.amount) AS average_per_transaction,
    MIN(e.amount) AS min_expense,
    MAX(e.amount) AS max_expense
FROM categories c
LEFT JOIN expenses e ON c.id = e.category_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- ------------------------------------------------------------
-- QUERY: EXPENSES BY DATE RANGE
-- ------------------------------------------------------------

-- Get expenses between two dates
SELECT 
    e.date,
    c.name AS category,
    e.description,
    e.amount
FROM expenses e
JOIN categories c ON e.category_id = c.id
WHERE e.date BETWEEN '2025-10-01' AND '2025-10-31'
ORDER BY e.date DESC;

-- ------------------------------------------------------------
-- QUERY: BUDGET TRACKING (Custom Categories)
-- ------------------------------------------------------------

-- Compare actual spending vs hypothetical budget
WITH monthly_budget AS (
    SELECT 'Food' AS category, 500.00 AS budget
    UNION ALL SELECT 'Transportation', 200.00
    UNION ALL SELECT 'Entertainment', 150.00
    UNION ALL SELECT 'Utilities', 300.00
)
SELECT 
    mb.category,
    mb.budget,
    COALESCE(SUM(e.amount), 0) AS actual_spent,
    mb.budget - COALESCE(SUM(e.amount), 0) AS remaining,
    ROUND((COALESCE(SUM(e.amount), 0) * 100.0 / mb.budget), 2) AS percent_used
FROM monthly_budget mb
LEFT JOIN categories c ON mb.category = c.name
LEFT JOIN expenses e ON c.id = e.category_id 
    AND strftime('%Y-%m', e.date) = '2025-10'
GROUP BY mb.category, mb.budget;

-- ------------------------------------------------------------
-- MAINTENANCE QUERIES
-- ------------------------------------------------------------

-- Delete old expenses (older than 2 years)
DELETE FROM expenses
WHERE date < date('now', '-2 years');

-- Vacuum database to reclaim space
VACUUM;

-- Check database integrity
PRAGMA integrity_check;

-- Get database statistics
SELECT 
    (SELECT COUNT(*) FROM expenses) AS total_expenses,
    (SELECT COUNT(*) FROM categories) AS total_categories,
    (SELECT SUM(amount) FROM expenses) AS lifetime_total;