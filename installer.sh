source .env



# need to chek that docker is installed
if ! [ -x "$(command -v docker)" ]; then
    echo 'Error: docker is not installed.' >&2
    exit 1
fi

# need to chek that docker-compose is installed
if ! [ -x "$(command -v docker-compose)" ]; then
    echo 'Error: docker-compose is not installed.' >&2
    exit 1
fi
# need to chek that git is installed
if ! [ -x "$(command -v git)" ]; then
    echo 'Error: git is not installed.' >&2
    exit 1
fi
# need to chek that curl is installed
if ! [ -x "$(command -v curl)" ]; then
    echo 'Error: curl is not installed.' >&2
    exit 1
fi
# need to chek that unzip is installed
if ! [ -x "$(command -v unzip)" ]; then
