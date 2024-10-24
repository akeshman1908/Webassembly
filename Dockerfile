# Fase 1: Build de Blazor WebAssembly-app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish --configuration Release -o /app

# Fase 2: Serve de app met een lichte runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "Frontend.dll"]
