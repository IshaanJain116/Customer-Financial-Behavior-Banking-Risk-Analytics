create database banking_case;
Use banking_case;
show tables;
select * from customer;
describe customer;

ALTER TABLE customer ADD COLUMN Customer_ID INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE customer
MODIFY `Estimated Income` DECIMAL(12,2),
MODIFY `Bank Loans` DECIMAL(12,2),
MODIFY `Bank Deposits` DECIMAL(12,2),
MODIFY `Saving Accounts` DECIMAL(12,2),
MODIFY `Checking Accounts` DECIMAL(12,2);
