# ========================
# 1) Build stage
# ========================
# Pin your .NET 9 base image. Adjust tag based on official previews available.
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copy project file & restore
COPY dotnet-sample.csproj .
RUN dotnet restore dotnet-sample.csproj

# Copy remaining source code & publish (Release)
COPY . .
RUN dotnet publish -c Release -o out

# ========================
# 2) Runtime stage
# ========================
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final
WORKDIR /app

ENV ASPNETCORE_URLS=http://0.0.0.0:80
# Copy the build output
COPY --from=build /app/out ./

# Expose a port
EXPOSE 80

# Run the app
ENTRYPOINT ["dotnet", "dotnet-sample.dll"]

