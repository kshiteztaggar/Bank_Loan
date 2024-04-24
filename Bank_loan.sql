select * from bank_loan

-- TOTAL LOAN APPLICAITONS  
SELECT COUNT(id) AS Total_Applications FROM bank_loan
-- MONTH TO DATE(MTD) LOAN APPLICATIONS 
SELECT COUNT(id) AS Total_Applications FROM bank_loan WHERE MONTH(issue_date) = 12 


-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan
-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan WHERE MONTH(issue_date) = 12


-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan
-- MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan
WHERE MONTH(issue_date) = 12 and year(issue_date) = 2021


-- Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan
-- MTD Average Interest
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan
WHERE MONTH(issue_date) = 12


-- Avg DTI (USED TO CHECK THE FINANCIAL HEALTH OF COUSTOMER)
SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan
-- MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan
WHERE MONTH(issue_date) = 12


-- Good Loan Percentage (CURRENT & FULLY PAID)
SELECT loan_status from bank_loan

SELECT(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100) / 
	COUNT(id) AS Good_Loan_Percentage FROM bank_loan
--Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
--Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
--Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


--Bad Loan Percentage (CHARGED OFF)
SELECT loan_status from bank_loan

SELECT(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100) / 
COUNT(id) AS Bad_Loan_Percentage FROM bank_loan
--Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan WHERE loan_status = 'Charged Off'
--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan WHERE loan_status = 'Charged Off'
--Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan
WHERE loan_status = 'Charged Off'


--LOAN STATUS
SELECT loan_status,
 COUNT(id) AS Total_Loan_Applications,
 SUM(total_payment) AS Total_Amount_Received,
 SUM(loan_amount) AS Total_Funded_Amount,
 AVG(int_rate * 100) AS Interest_Rate,
 AVG(dti * 100) AS DTI FROM bank_loan GROUP BY loan_status
 --FOR MTD Total Amount Received MTD Total Funded Amount 
 SELECT loan_status, 
SUM(total_payment) AS MTD_Total_Amount_Received, 
SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan WHERE MONTH(issue_date) = 12 GROUP BY loan_status






