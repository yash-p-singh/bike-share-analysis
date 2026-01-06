SELECT
  EXTRACT(MONTH FROM started_at) AS ride_month,
  COUNT(ride_id) AS count_rides
FROM
  BikeTrips
WHERE
  member_casual = 'casual'
GROUP BY
  ride_month
ORDER BY
  ride_month
