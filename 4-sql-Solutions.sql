-- Databricks notebook source
select * from demo_db.fire_calls limit 100;

-- COMMAND ----------

drop view if exists fire_service_calls_tbl_cache;

-- COMMAND ----------

cache lazy table fire_service_calls_tbl_cache as
select * from demo_db.fire_calls

-- COMMAND ----------

select count(*) from demo_db.fire_calls

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 1) distinct types of calls made ?

-- COMMAND ----------

SELECT calltype, COUNT(*) AS call_count
FROM demo_db.fire_calls
GROUP BY calltype
sort by call_count DESC;


-- COMMAND ----------

-- MAGIC %md
-- MAGIC 2. find all CALLNUMBER for the responses with greater than 5 mins delay
-- MAGIC

-- COMMAND ----------

select CallNumber , delay from demo_db.fire_calls
where 
delay > 5
order by CallNumber desc;

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC 3. Most Common CAll types were ?

-- COMMAND ----------

SELECT calltype, COUNT(*) AS call_count
FROM demo_db.fire_calls
GROUP BY calltype
sort by call_count DESC;

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC 4. Zip codes accounted for most common calls? 

-- COMMAND ----------

select CallType , zipcode , count(*) as count from demo_db.fire_calls
group by CallType, Zipcode
order by count desc;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q5. What San Francisco neighborhoods are in the zip codes 94102 and 94103?

-- COMMAND ----------

select city , Neighborhood, Zipcode from demo_db.fire_calls
where Zipcode =94102 or Zipcode=94103;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 6. What was the sum of all Numalarms, average, min, and max of the call response times?

-- COMMAND ----------

select sum(numalarms) as sum , avg(delay) , min(delay) , max(delay)
from demo_db.fire_calls

-- COMMAND ----------

-- MAGIC %md 
-- MAGIC Q7. How many distinct years of data is in the data set?

-- COMMAND ----------

select distinct(calldate) from demo_db.fire_calls

-- COMMAND ----------

DESCRIBE demo_db.fire_calls;


-- COMMAND ----------

select distinct year(to_date(callDate, "MM/dd/yyyy")) as year_num
from demo_db.fire_calls
order by year_num

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 8. What week of the year in 2018 had the most fire calls?
-- MAGIC

-- COMMAND ----------

select weekofyear(to_date(callDate, "MM/dd/yyyy")) week_year, count(*) as count
from demo_db.fire_calls
where year(to_date(callDate, "MM/dd/yyyy")) == 2018
group by week_year
order by count desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 9. What neighborhoods in San Francisco had the worst response time in 2018?

-- COMMAND ----------

select Neighborhood , Delay
from demo_db.fire_calls
where year(to_date(callDate, "MM/dd/yyyy")) == 2018
group by Neighborhood , Delay ,CallDate
order by delay desc

-- COMMAND ----------


