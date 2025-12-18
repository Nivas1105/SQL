/* prime number

| Prime_Number |
| ------------ |
| 2            |
| 3            |
| 5            |
| 7            |

 */
SELECT DISTINCT n1.Numbers AS Prime_Number
FROM NumbersTable n1
WHERE n1.Numbers > 1
  AND NOT EXISTS (
      SELECT 1
      FROM NumbersTable n2
      WHERE n2.Numbers > 1
        AND n2.Numbers < n1.Numbers
        AND MOD(n1.Numbers, n2.Numbers) = 0
  )
ORDER BY n1.Numbers;