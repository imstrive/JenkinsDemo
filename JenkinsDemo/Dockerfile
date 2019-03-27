FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
#EXPOSE 54095
#EXPOSE 44335

#FROM microsoft/dotnet:2.1-sdk AS build
#WORKDIR /src
#COPY JenkinsDemo/JenkinsDemo.csproj JenkinsDemo/
#RUN dotnet restore JenkinsDemo/JenkinsDemo.csproj
COPY . .
#WORKDIR /src/JenkinsDemo
#RUN dotnet build JenkinsDemo.csproj -c Release -o /app
EXPOSE 80
EXPOSE 443

#FROM build AS publish
#RUN dotnet publish JenkinsDemo.csproj -c Release -o /app
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app .
ENTRYPOINT ["dotnet", "JenkinsDemo.dll"]
