SELECT
  EXTRACT(DAYOFWEEK FROM started_at) AS weekday,
  ROUND(AVG(EXTRACT(MINUTE FROM (ended_at - started_at)) 
          + EXTRACT(HOUR FROM (ended_at - started_at)) * 60
          + EXTRACT(SECOND FROM (ended_at - started_at)) / 60), 2) AS avg_trip_duration_minutes
FROM  
  hello-476408.CyclisticTrips.BikeTrips
WHERE
  member_casual = 'casual'
GROUP BY
  weekday
ORDER BY
  weekday