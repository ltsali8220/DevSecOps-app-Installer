
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
create_docfile(){

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

main(){
    read input -p "is this your dev_setup? (y/n): " dev_setup
        if [[ "$dev_setup" == "y" || "$dev_setup" == "Y" ]]; then
            create_dir
            create_docfile
        fi "Created placeholder Dockerfile in $BACKEND_DIR"

}

if __name__ == "__main__"; then
    main
fi


"""
# Lightweight ReactJS Dockerfile
FROM node:18-alpine AS build

WORKDIR /app
COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci --silent
COPY frontend/ ./
RUN npm run build

# Serve with lightweight web server
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

"""

"""
# Lightweight Django Dockerfile
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app
COPY backend/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/ ./

EXPOSE 8000
CMD ["gunicorn", "backend.wsgi:application", "--bind", 

"""