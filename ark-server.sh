#!/bin/sh

# Install server / check for updates
steamcmd +login anonymous +app_update 2430930 +quit

# Start server with proton
SERVER_CMD="$PROTON run '${ARK_PATH}/Binaries/Win64/ArkAscendedServer.exe' ${ASA_START_PARAMS}"

echo $SERVER_CMD

# Start the server
eval $SERVER_CMD > /dev/null 2>&1 &

#eval $SERVER_CMD
#exit 0

SERVER_PID=$!

# Capture logs
tail -f --retry "${ARK_PATH}/Saved/Logs/ShooterGame.log" &

# Monitor server process
wait $SERVER_PID
exit $?
