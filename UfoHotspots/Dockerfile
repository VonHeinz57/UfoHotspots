#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["UfoHotspots/UfoHotspots.csproj", "UfoHotspots/"]
RUN dotnet restore "UfoHotspots/UfoHotspots.csproj"
COPY . .
WORKDIR "/src/UfoHotspots"
RUN dotnet build "UfoHotspots.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "UfoHotspots.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "UfoHotspots.dll"]
