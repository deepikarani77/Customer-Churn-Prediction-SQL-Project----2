-- Task 1: Set database as default
use customer_churn_db;

-- Task 2: Show one column, multiple columns, all columns

-- one column you wanted to see Churn
select Churn from customer_churn;

-- multiple columns you wanted to see customerID, gender, Churn
select customerID, gender, Churn from customer_churn;

-- all columns you wanted to see
select * from customer_churn;

-- Task 3: Get unique list & remove duplicates

-- -- Unique values of Contract
select distinct(Contract) from customer_churn;

-- -- Count distinct contracts
select count(distinct Contract) from customer_churn;

-- Task 4: Perform Mathematical Operations

-- Increase MonthlyCharges by 10%

select customerID, MonthlyCharges, MonthlyCharges * 1.10 as increased_charges
from customer_churn;

-- Total Charges per year
select customerID, MonthlyCharges, MonthlyCharges * 12 as yearly_charges
from customer_churn;

-- Task 5: Perform Logical Operations

-- Customers paying more than 70 per month
select customerID, MonthlyCharges from customer_churn
where MonthlyCharges > 70;

-- Customers with tenure > 12 months AND Churn = 'Yes'
select customerID, tenure, Churn from customer_churn
where tenure >12 AND Churn = 'Yes';

-- Task 6: Create Calculated Columns
-- Average monthly spend per year of tenure

select customerID,tenure,MonthlyCharges,
(MonthlyCharges * tenure) as total_spent
from customer_churn;

-- Task 7: Count Customers by Gender
select gender, count(*) as customer_count
from customer_churn
group by gender;

-- Task 8: Average MonthlyCharges by Contract Type
select Contract, avg(MonthlyCharges) as avg_monthly_charges
from customer_churn
group by Contract;

-- Task 9: Top 10 Customers with Highest Monthly Charges

select customerID, MonthlyCharges from customer_churn
order by MonthlyCharges desc
limit 10;

-- Task 10: Churn Rate Calculation

select Churn, count(*) as customer_count,
round((count(*) * 100.0 /
(select count(*) from customer_churn)),2) as percentage
from customer_churn 
group by Churn;














