-- Ripple setup check.
-- Run it from inside the ripple-data folder with:
--     duckdb -f check_setup.sql
-- If you see five row counts and "Ripple is ready", your workspace works.

SELECT 'app_orders.csv'                AS source, COUNT(*) AS row_count FROM 'data/raw/app_orders.csv'
UNION ALL
SELECT 'app_customers.csv',             COUNT(*) FROM 'data/raw/app_customers.csv'
UNION ALL
SELECT 'payments_export.csv',           COUNT(*) FROM 'data/raw/payments_export.csv'
UNION ALL
SELECT 'support_tickets.csv',           COUNT(*) FROM 'data/raw/support_tickets.csv'
UNION ALL
SELECT 'Revenue_FINAL_v3_USE_THIS.csv', COUNT(*) FROM 'data/raw/Revenue_FINAL_v3_USE_THIS.csv';

SELECT '✅ Ripple is ready. Go find out what Gerald has been up to.' AS status;
