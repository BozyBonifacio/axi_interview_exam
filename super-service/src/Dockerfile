﻿FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /src

# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out


# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /src
COPY --from=build-env /src/out .
#EXPOSE 5000 5001

ENTRYPOINT ["dotnet", "SuperService.dll"]