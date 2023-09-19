/* Consulta usada no Bigquery(GBQ) para criação da nova tabela de análises*/

CREATE OR REPLACE TABLE `appoutsider.appoutsider.table_analysis` AS (
  SELECT 
    f.VendorID,
    d.lpep_pickup_datetime,
    d.pickup_period,
    d.lpep_dropoff_datetime,
    d.dropoff_period,
    c.passenger_count,
    z.zone AS pickup_zone,  
    z.borough AS pickup_borough,  
    zd.zone AS dropoff_zone,  
    zd.borough AS dropoff_borough,  
    p.payment_description,
    r.ratecode_description,
    f.trip_distance,
    f.tip_amount,
    f.tolls_amount,
    f.fare_amount,
    f.total_amount
  FROM `appoutsider.factory_table` AS f
  INNER JOIN `appoutsider.datetime` AS d ON (f.datetime_id = d.datetime_id)
  INNER JOIN `appoutsider.passenger` AS c ON (f.passenger_id = c.passenger_id)
  INNER JOIN `appoutsider.payment` AS p ON (f.payment_id = p.payment_id)
  INNER JOIN `appoutsider.zones` AS z ON (f.pickup_location_id = z.LocationID)
  INNER JOIN `appoutsider.zones` AS zd ON (f.dropoff_location_id = zd.LocationID)
  INNER JOIN `appoutsider.ratecode` AS r ON (f.ratecode_id = r.ratecode_id)
);
