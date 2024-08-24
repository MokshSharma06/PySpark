-- Databricks notebook source
-- MAGIC %fs rm -r "dbfs:/user/hive/warehouse/demo_db.db"

-- COMMAND ----------

DROP TABLE IF EXISTS demo_db.fire_calls;

-- COMMAND ----------

create database  if not exists demo_db

-- COMMAND ----------

create table if not exists demo_db.fire_calls

-- COMMAND ----------

-- MAGIC %md
-- MAGIC forgot to add cols , so altered ( format using parquet was not used)

-- COMMAND ----------

Alter Table demo_db.fire_calls
Add COLUMNS (
  CallNumber integer,
  UnitID string,
  IncidentNumber integer,
  CallType string,
  CallDate string,
  WatchDate string,
  CallFinalDisposition string,
  AvailableDtTm string,
  Address string,
  City string,
  Zipcode integer,
  Battalion string,
  StationArea string,
  Box string,
  OriginalPriority string,
  Priority string,
  FinalPriority integer,
  ALSUnit boolean,
  CallTypeGroup string,
  NumAlarms integer,
  UnitType string,
  UnitSequenceInCallDispatch integer,
  FirePreventionDistrict string,
  SupervisorDistrict string,
  Neighborhood string,
  Location string,
  RowID string,
  Delay float
)

-- COMMAND ----------

desc demo_db.fire_calls

-- COMMAND ----------

insert into demo_db.fire_calls
select * from global_temp.fire_service_table

-- COMMAND ----------

select* from demo_db.fire_calls
