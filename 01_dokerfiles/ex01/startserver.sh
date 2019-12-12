#REMOVE PREVIOUS
echo "STOPPING and removing previous BYOTSS container"
docker container stop byotss > /dev/null
docker container rm byotss > /dev/null
#MV TO SCRIPT
echo "MOVING to Script folder"
SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPT_DIR
rm -rf old_logs
mv logs old_logs
#BUILD SERVER
echo "BUILDING image"
docker build -t byotss . > /dev/null
echo "STARTING server"
docker run --rm \
-p 9987:9987/udp -p 10011:10011 -p 30033:30033 \
-v $(pwd)/logs:/home/teamspeak/logs \
--name byotss \
--detach \
byotss
echo "STOP server by typing"
echo "  docker stop byotss"
echo "Privilege key in $SCRIPT_DIR/logs"