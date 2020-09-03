
# The docker cmd to use
if [ -z "$DOCKER_CMD" ]
then
    DOCKER_CMD=$(which docker)
fi

# First, generate a bunch noisy js file
for x in $(seq 1 2000)
do
    filename=./src/noise/noise_${x}.js
    echo "Generating $filename"
    echo "console.log('loading file Number $x')" >$filename
    cat ./src/noise/base.js >>$filename
done

# Now, run a reverse-proxy
CONTAINER_NAME=chrome-bug-repro
$DOCKER_CMD stop "$CONTAINER_NAME" || :
$DOCKER_CMD \
    run \
    --name "$CONTAINER_NAME" \
    --rm \
    -v "$(realpath ./src):/usr/share/nginx/html/js:ro" \
    -v "$(realpath ./index.html):/usr/share/nginx/html/index.html:ro" \
    -p '8080:80' \
    nginx
