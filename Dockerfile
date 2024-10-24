# Stage 1: Build the Blazor WebAssembly app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

# Verwijder de standaard NGINX configuratie
RUN rm /etc/nginx/conf.d/default.conf

# Kopieer je aangepaste nginx.conf naar de juiste locatie
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Kopieer de bestanden van je Blazor-app naar de webroot
COPY --from=build /app/publish/wwwroot /usr/share/nginx/html
