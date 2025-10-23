
source .env

create_dir(){
    for dir in ${Directories[@]}; do
        if [ ! -d "${!dir}" ]; then
            mkdir -p "${!dir}"
            echo "Created directory: ${!dir}"
        else
            echo "Directory already exists: ${!dir}"
        fi
    done
}
docfile_create(){

    if [ ! -f "$BACKEND_DIR/Dockerfile" ]; then
        touch "$BACKEND_DIR/Dockerfile"
    fi
        echo 'Error: unzip is not installed.' >&2
        exit 1
    fi
    # Create placeholder Dockerfile in frontend directory if it doesn't exist
    if [ ! -f "$FRONTEND_DIR/Dockerfile" ]; then            
        touch "$FRONTEND_DIR/Dockerfile"
    fi
        echo "Created placeholder Dockerfile in $FRONTEND_DIR"
}