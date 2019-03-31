#FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
#WORKDIR /app
##EXPOSE 54095
##EXPOSE 44335
#
##FROM microsoft/dotnet:2.1-sdk AS build
##WORKDIR /src
##COPY JenkinsDemo/JenkinsDemo.csproj JenkinsDemo/
##RUN dotnet restore JenkinsDemo/JenkinsDemo.csproj
#COPY . .
##WORKDIR /src/JenkinsDemo
##RUN dotnet build JenkinsDemo.csproj -c Release -o /app
#EXPOSE 80
#EXPOSE 443
#
##FROM build AS publish
##RUN dotnet publish JenkinsDemo.csproj -c Release -o /app
##
##FROM base AS final
##WORKDIR /app
##COPY --from=publish /app .
#ENTRYPOINT ["dotnet", "JenkinsDemo.dll"]





#FROM microsoft/aspnetcore-build:2.1 AS build-env
#WORKDIR /app
#
## copy csproj and restore as distinct layers
#COPY *.csproj ./
#RUN dotnet restore
#
## copy everything else and build
#COPY . ./
#RUN dotnet publish -c Release -o out
#
## build runtime image
#FROM microsoft/aspnetcore:2.1
#WORKDIR /app
#COPY --from=build-env /app/out .
#ENTRYPOINT ["dotnet", "JenkinsDemo.dll"]



#FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
FROM microsoft/dotnet:2.1-aspnetcore-runtime
WORKDIR /app

FROM microsoft/dotnet:2.1-sdk AS build
COPY . .

RUN dotnet restore
RUN dotnet publish ./JenkinsDemo/JenkinsDemo.csproj -o /publish/
WORKDIR /publish

EXPOSE 80

ENTRYPOINT ["dotnet", "JenkinsDemo.dll"]