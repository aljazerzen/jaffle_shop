SELECT
  id AS customer_id,
  first_name,
  last_name
FROM
   {{ ref('raw_customers') }}

-- Generated by PRQL compiler version 0.4.2 (https://prql-lang.org)
