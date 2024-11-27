# SQL Playground

This is a playground to practice SQL

## Learn By Doing

https://sql.sh/ is a fantastic ressource

Pick something you don't know yet there

Then practice here

Create a new file with your own queries, tweak them until they do exactly what you want how you want

## Install

`$ git clone https://github.com/jmfayard/playground-sql`

The database used is SQLite https://www.sqlite.org/about.html

Everything is stored in the single file `playground-sql/library.sqlite`

You will need a SQL client, I suggest IntelliJ or Visual Studio Code.

### IntelliJ

If you have a JetBrains license, use DataGrip or IntelliJ Ultimate which has superb SQL support
- Open the `Database` view
- `New Datasoruce` > `Datasource from path` > `playground-sql/library.sqlite` > `Sqlite Driver`
- Download the SQL driver, test the connection, apply

![](https://share.cleanshot.com/ghHCKfw7+)
### Visual Studio Code

If you are into Visual Studio Code
- install [SQLTools - Database management for VS Code](https://vscode-sqltools.mteixeira.dev/en/home)
- in particular install the SQLite driver

In both cases, create a connection to the local sqlite databse at `library.sqlite`

![](https://share.cleanshot.com/RrV8Pdpk+)



## Contribute

You are welcome to contribute your own queries to this repo

