{# SELECT 
fare_amount, 
total_amount, 
extract(month from pickup_datetime) as month, 
fare_amount*.2 as fare_amount_perc, 
CASE WHEN total_amount > (fare_amount*.2) AND total_amount > 30 THEN true else false end as flag 
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018` #}



SELECT 
t.fare_amount, 
t.total_amount, 
extract(month from t.pickup_datetime) as month, 
t.fare_amount*.2 as fare_amount_perc, 
{{test('t.total_amount','t.fare_amount',0.2,30)}} as flag
FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018` as t