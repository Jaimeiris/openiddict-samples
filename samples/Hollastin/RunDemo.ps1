$root = $PSScriptRoot;
. $root\..\Shared.ps1

# Authorization Server
Push-Location "$root/Hollastin.Server"
dotnet restore
dotnet build --no-incremental #rebuild
Start-Process dotnet -ArgumentList "watch run urls=https://localhost:44360" -PassThru 
Pop-Location

# Client Application
Push-Location "$root/Hollastin.Client"
dotnet restore
dotnet build --no-incremental
Start-Process dotnet -ArgumentList "watch run" -PassThru
Pop-Location