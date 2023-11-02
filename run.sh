# List all processes using port 5000
sudo lsof -i :5000
# Kill the process using port 10000
sudo kill $(sudo lsof -t -i :5000)

python3 /workspaces/AssistanceSoftwareWithGaze/core/scripts/run_server.py & 
cd graphics && bash ./run_ui.sh &

# Wait for the UI to start up
while ! curl -s http://localhost:5000 > /dev/null 2>&1; do
    sleep 1
done

sleep 30
firefox http://localhost:5000

# Set up a signal handler to kill child processes on exit
trap "pkill python3 & pkill flutter" EXIT