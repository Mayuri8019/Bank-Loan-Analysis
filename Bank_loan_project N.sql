create database BANK_LOAN_ANALYTICS;
use bank_loan_analytics;
select count(*) from finance_1;
select * from finance_1c;
select count(*) from finance_2;

# KPI 1
select year(issue_d) as Year,sum(loan_amnt) Total_loan_amout from finance_1
group by year(issue_d)
order by year(issue_d);

# KPI 2 
select grade,sub_grade,sum(revol_bal) as Total_revol_balance
from finance_1 F1
join finance_2 F2
ON F1.id=F2.id
group by grade,sub_grade
order by grade,sub_grade;

# KPI 3 :
select verification_status, CONCAT(format(round(sum(total_pymnt)/1000000,2),1)," " ,"M") as Total_payment
from finance_1 F1
join finance_2 F2
ON F1.ID=F2.ID
group by verification_status;

#KPI 4

SELECT addr_state,loan_status,count(last_credit_pull_d)AS Total_count
from finance_1 
join finance_2
on(finance_1.id = finance_2.id)
GROUP BY addr_state,loan_status
ORDER BY addr_state;

#KPI 5

SELECT home_ownership,count(last_pymnt_d) AS count_last_pymnt_d
from finance_1 
join finance_2
on(finance_1.id = finance_2.id)
GROUP BY home_ownership;