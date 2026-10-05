# SQL Learning Archive

A collection of T-SQL laboratory work and homework focused on relational database design, data manipulation, and querying. Each exercise is independent; the original SQL statements are preserved as coursework.

## At a glance

| | Count |
|---|---:|
| Labs | 1 |
| Homework exercises | 6 |
| SQL files | 8 |
| Database diagrams | 3 |

One of the eight SQL files is an identical copy of the TurboAz exercise, retained from the original archive. The generic Northwind setup script formerly named `SQLQuery3.sql` was removed because it was not an exercise; it remains recoverable from Git history.

## Repository structure

```text
SQL/
├── Labs/
│   └── HospitalDB/
├── Homework/
│   ├── StudentsDB/
│   ├── MarketDB/
│   ├── IMDb/
│   ├── Spotify/
│   ├── RestaurantDB/
│   └── TurboAz/
├── .gitignore
└── README.md
```

`Labs` contains the hospital database lab. All other projects are homework. Each topic keeps its SQL script and, when available, its ERD diagram together.

## Labs

| Project | Original file | Topics |
|---|---|---|
| [HospitalDB](Labs/HospitalDB/HospitalSchemaAndQueries.sql) | `SQLQuery2.sql` | Patients, doctors, departments, visits, medications, joins, and stored procedures |

## Homework

| Project | Original file | Topics | Diagram |
|---|---|---|---|
| [StudentsDB](Homework/StudentsDB/StudentsTable.sql) | `SQLQuery1.sql` | Create a database and student table; add a column with `ALTER TABLE` | — |
| [MarketDB](Homework/MarketDB/MarketSchemaAndQueries.sql) | `QueryTask001.sql` | Products and employees, CRUD, constraints, filters, and subqueries | — |
| [IMDb](Homework/IMDb/IMDbSchemaAndQueries.sql) | `QueryTask002.sql` | Movies, directors, actors, genres, many-to-many relations, and joins | [ERD](Homework/IMDb/IMDbERD.jpg) |
| [Spotify](Homework/Spotify/SpotifySchemaAndQueries.sql) | `QueryTask003.sql` | Artists, albums, songs, joins, views, and a stored procedure | [ERD](Homework/Spotify/SpotifyERD.jpg) |
| [RestaurantDB](Homework/RestaurantDB/RestaurantSchemaAndQueries.sql) | `QueryTask004.sql` | Meals, tables, orders, aggregates, date calculations, and reporting queries | — |
| [TurboAz](Homework/TurboAz/TurboAzSchemaAndQueries.sql) | `QueryTask005.sql` | Car types, brands, models, cars, foreign keys, and joins | [ERD](Homework/TurboAz/TurboAzERD.jpg) |

The [TurboAz copy](Homework/TurboAz/TurboAzSchemaAndQueriesCopy.sql), previously `queries/Query.sql`, is byte-for-byte identical to the main TurboAz script. It is kept to preserve the original coursework files without presenting it as a separate exercise.

## Topics covered

- Database and table creation with T-SQL
- Primary keys, foreign keys, identity columns, unique values, and check constraints
- `INSERT`, `UPDATE`, `DELETE`, and `ALTER TABLE`
- Joins and many-to-many relationships
- Filtering, string functions, aggregates, grouping, and subqueries
- Views and stored procedures
- Basic relational modeling illustrated by the ERD diagrams

## Working with the scripts

These files target Microsoft SQL Server and its T-SQL syntax. Use an isolated practice instance and inspect a script before running any statement. The scripts are learning notes, not repeatable migrations: most create a database with a fixed name, so running them again may fail.

Some original statements are meant to be tried separately rather than executed top-to-bottom. For example, the hospital lab drops a procedure before a later `EXEC`, and the restaurant homework drops tables before later inserts. Those statements remain unchanged so the original exercise history is intact. Run only the sections you intend to practice, and do not use these scripts against a database containing important data.

No SQL Server execution or database changes were performed as part of this repository organization. The source files and diagrams were checked structurally; runtime behavior has not been certified.

## Notes

- File and folder names are descriptive; database names, table names, and SQL statements inside the scripts are unchanged.
- The root `.gitignore` excludes IDE files and generated SQL Server database/backup files, but keeps `.sql` scripts and diagrams tracked.
- This repository is maintained for learning and portfolio review.
