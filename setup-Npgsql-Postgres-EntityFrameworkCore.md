### Npgsql (Postgres) and an Entity Framework (EF) Core
### 

https://www.npgsql.org/efcore/index.html

https://medium.com/@nitinsharma17351/net-core-3-1-crud-using-blazor-and-entity-framework-core-with-postgre-sql-database-4b424051c5e0

```
--install dotnet-ef tool
dotnet tool install --global dotnet-ef --version 3.1.2
--upgrade if need
dotnet tool update --global dotnet-ef
--install this if require
dotnet add package Microsoft.EntityFrameworkCore.Design
--generate MODEL
dotnet ef dbcontext scaffold "Host=ip;Database=name;Username=user;Password=pass" Npgsql.EntityFrameworkCore.PostgreSQL -o Model -c "pyCenterDBContext"
```
*Using an Existing Database (Database-First)
The Npgsql EF Core provider also supports reverse-engineering a code model from an existing PostgreSQL database ("database-first"). To do so, use dotnet CLI to execute the following:*

`dotnet ef dbcontext scaffold "Host=my_host;Database=my_db;Username=my_user;Password=my_pw" Npgsql.EntityFrameworkCore.PostgreSQL`

### Blazor Web Assembly App Template/Review

https://www.nuget.org/packages/Microsoft.AspNetCore.Blazor.Templates/3.1.0-preview4.19579.2

`dotnet new --install Microsoft.AspNetCore.Blazor.Templates::3.1.0-preview4.19579.2`

### ASP.NET Core 3.1 Runtime (v3.1.2) - Windows Hosting Bundle

https://dotnet.microsoft.com/download/dotnet-core/thank-you/runtime-aspnetcore-3.1.2-windows-hosting-bundle-installer

```
HTTP Error 500.31 - ANCM Failed to Find Native Dependencies
Common solutions to this issue:
The specified version of Microsoft.NetCore.App or Microsoft.AspNetCore.App was not found.
Troubleshooting steps:
Check the system event log for error messages
Enable logging the application process' stdout messages
Attach a debugger to the application process and inspect
For more information visit: https://go.microsoft.com/fwlink/?LinkID=2028526
```