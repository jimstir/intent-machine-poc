#!/bin/sh

# Start the first nwaku node with its configuration
/app/nwaku --config /config/config1.toml &
echo "nwaku node 1 started"

# Start the Node.js listener for the first node
node /backend/intentNode/listener.js &
echo "Node.js listener for node 1 started"

# Start the second nwaku node with its configuration
/app/nwaku --config /config/config2.toml &
echo "nwaku node 2 started"

# Start the Node.js listener for the second node
node /backend/intentNode/listener.js &
echo "Node.js listener for node 2 started"

# Start the third nwaku node with its configuration
/app/nwaku --config /config/config3.toml &
echo "nwaku node 3 started"

# Start the Node.js listener for the third node
node /backend/intentNode/listener.js &
echo "Node.js listener for node 3 started"

# Wait to keep the container running
wait
