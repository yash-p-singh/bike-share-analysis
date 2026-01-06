SELECT
  EXTRACT(DAYOFWEEK FROM started_at) AS weekday,
  CAST(COUNT(ride_id) / 52 AS INT) AS count_rides
FROM
  BikeTrips
WHERE
  member_casual = 'casual'
GROUP BY
  weekday
ORDER BY
  weekday
