FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
EXPOSE 1433

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /p3ops-22-23-2zit-app/src
COPY ["/p3ops-22-23-2zit-app/src/Server/Server.csproj", "src/Server/"]
COPY ["/p3ops-22-23-2zit-app/src/Client/Client.csproj", "src/Client/"]
COPY ["/p3ops-22-23-2zit-app/src/Shared/Shared.csproj", "src/Shared/"]
COPY ["/p3ops-22-23-2zit-app/src/Services/Services.csproj", "src/Services/"]
COPY ["/p3ops-22-23-2zit-app/src/Domain/Domain.csproj", "src/Domain/"]
COPY ["/p3ops-22-23-2zit-app/src/Persistence/Persistence.csproj", "src/Persistence/"]
RUN dotnet restore "/p3ops-22-23-2zit-app/src/Server/Server.csproj"

COPY . .
WORKDIR "/src/src/Server"
RUN dotnet build "Server.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Server.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Server.dll"]