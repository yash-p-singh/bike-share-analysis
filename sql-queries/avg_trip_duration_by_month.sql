SELECT
  EXTRACT(MONTH FROM started_at) AS month,
  ROUND(AVG(EXTRACT(MINUTE FROM (ended_at - started_at)) 
          + EXTRACT(HOUR FROM (ended_at - started_at)) * 60
          + EXTRACT(SECOND FROM (ended_at - started_at)) / 60), 2) AS avg_trip_duration_minutes
FROM
  BikeTrips
WHERE
  member_casual = 'casual'
GROUP BY
  month
ORDER BY
  month
