# Use official Nginx base image
FROM nginx:alpine

# Copy custom Nginx config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
# Copy your frontend static files
COPY ../frontend/index.html /usr/share/nginx/html/index.html
COPY ../frontend/Assets /usr/share/nginx/html/Assets
