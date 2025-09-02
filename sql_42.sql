/*
 median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

Input Format

The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

SELECT ROUND(AVG(LAT_N), 4) AS median_lat
FROM (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM STATION
) AS sub
WHERE row_num IN (
    (total_count + 1) / 2,
    (total_count + 2) / 2
);