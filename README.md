# JAMK Database Course

This repo contains the questions and the answers which I solved during the onging period of the course.

## Resources to learn SQL
- [JAMK SQL Course](jamk-db-course) </br>
- [MySQLtutorial](mysqltutorial) </br>
- [NoSQL commands](nosql-commands)

## Achieved grades
| Exercise Name                                      |  Achieved Grade   | Total Grade |
| :---                                               |      :----:       |    :---:    |
| Exercise set 1 - Database Design: Car Repair Shop  |         3         |      3      |
| Exercise set 1 - Database Design: Music Events     |         3         |      3      |
| Exercise set 2 - SQL basics 1                      |         3         |      3      |
| Exercise set 3 - SQL basics 2                      |         3         |      3      |
| Exercise set 4 - SQL basics 3                      |       due         |      3      |
| Exercise set 5 - SQL basics 4                      |       due         |      3      |
| Exercise set 6 - SQL basics 5                      |       due         |      3      |
| Exercise set 7 - No SQL                            |       due         |      2      |

</br>

## Exercise Database Design/Schema
![Databse Design/Schema](/ocelot_database_tables.png)

## String comparison in sql is weird. Also strings are case insensitive.

String comparison starts from start/left side of a two strings. String comparison continues as long as the characters are same. When a different character is found between the strings the charcters ASCII values are compared. Whichever char is greater according to ASCII table that is the greater character and the string containing the first greater character is the greater. The other string is the smaller one. If both of the strings are identical even if Casing doesn't match the strings will still be equal.

<!-- links for resources -->
[mysqltutorial]: https://www.mysqltutorial.org/
[jamk-db-course]: https://hantt.pages.labranet.jamk.fi/ttc2020-online-material/
[nosql-commands]: https://github.com/Iftakharpy/JAMK-Database-Course/blob/34d5651f1310405bd76b9c409063f0dae57d047d/Exercise%20set%207%20-%20NoSQL/commands.md
