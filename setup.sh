# echo 'start'

# # variables
# echo 'variables:'
# GITHASH=`git rev-parse --short HEAD`
# IMGNAME=jenkinsdemo
# CONTAINER=jenkinsdemo
# # publish
# echo 'publish:'
# rm -rf ./publish
# dotnet publish -o ./publish
# # image
# echo 'image:'
# docker build -t $IMGNAME:$GITHASH .
# docker tag $IMGNAME:$GITHASH $IMGNAME:latest
# docker rmi -f $(docker images -q -f dangling=true)
# # container
# echo 'container:'
# docker stop $CONTAINER || true && docker rm -f $CONTAINER || true
# docker run -d --name $CONTAINER $IMGNAME

# echo 'done!'



#!/bin/sh
image_version=`date +%Y%m%d%H%M`;
# date +%Y%m%d%H%M`
echo $image_version;
# cd ~/code/58HouseSearch/HouseCrawler.Core/HouseCrawler.Web;
git pull --rebase origin master;
docker stop jenkinsdemo;
docker rm jenkinsdemo;
docker build -t jenkinsdemo:$image_version .;
docker images;
docker run -p 10000:80 -d --name jenkinsdemo jenkinsdemo:$image_version;
# -v ~/docker-data/house-web/appsettings.json:/app/appsettings.json -v ~/docker-data/house-web/NLogFile/:/app/NLogFile   --restart=always
docker logs jenkinsdemo;
#删除build过程中产生的镜像    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)