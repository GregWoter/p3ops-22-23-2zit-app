# Here, we include the dotnet core SDK as the base to build our app
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
# Setting the work directory for our app
WORKDIR /p3ops-22-23-2zit-app

# We copy the .csproj of our app to root and 
COPY . ./

#Database arguments
ENV DOTNET_ENVIRONMENT = Production
ENV DOTNET_ConnectionStrings__SqlDatabase = "SqlServer": "Server=127.0.0.1,1433;Database=tempdb;User Id=SA;Password=R0tieFAkor.123"

# restore the dependencies of the project.
# COPY /p3ops-22-23-2zit-app/src/Server/Server.csproj ./
RUN dotnet restore "src/Server/Server.csproj"

# We proceed by copying all the contents in
# the main project folder to root and build it
RUN dotnet build "src/Server/Server.csproj" -c Release -o /build

# Once we're done building, we'll publish the project
# to the publish folder 
FROM build-env AS publish
RUN dotnet publish "src/Server/Server.csproj" -c Release -o /publish

# We then get the base image for Nginx and set the 
# work directory 
FROM nginx:alpine AS final
WORKDIR /usr/share/nginx/html

# We'll copy all the contents from wwwroot in the publish
# folder into nginx/html for nginx to serve. The destination
# should be the same as what you set in the nginx.conf.
COPY --from=publish /publish/wwwroot /usr/local/webapp/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
