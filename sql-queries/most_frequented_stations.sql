WITH
  start_station_frequencies AS (
    SELECT
      start_station_name,
      COUNT(ride_id) AS count_start,
    FROM
      hello-476408.CyclisticTrips.BikeTrips
    WHERE
      member_casual = 'casual'
      AND start_station_name IS NOT NULL
    GROUP BY
      start_station_name
  ),
  end_station_frequencies AS (
    SELECT
      end_station_name,
      COUNT(ride_id) AS count_end,
    FROM
      hello-476408.CyclisticTrips.BikeTrips
    WHERE
      member_casual = 'casual'
      AND end_station_name IS NOT NULL
    GROUP BY
      end_station_name
  )
SELECT
  CASE
    WHEN start_station_frequencies.start_station_name IS NULL THEN end_station_frequencies.end_station_name
    ELSE start_station_frequencies.start_station_name
  END AS station_name,
  CASE
    WHEN start_station_frequencies.count_start IS NULL THEN end_station_frequencies.count_end
    WHEN end_station_frequencies.count_end IS NULL THEN start_station_frequencies.count_start
    ELSE start_station_frequencies.count_start + end_station_frequencies.count_end
  END AS count_encountered
FROM
  start_station_frequencies
FULL OUTER JOIN
  end_station_frequencies
  ON start_station_frequencies.start_station_name = end_station_frequencies.end_station_name
ORDER BY
  count_encountered DESC
LIMIT 10
