# Use a suitable base image with the required build tools (e.g., CentOS, Ubuntu, etc.)
FROM devopsedu/webapp

# Set environment variables for Apache version and source code directory
ENV SOURCE_DIR=/opt/project/projCert/website

# Update the package list and install necessary build tools
RUN apt-get update && \
    apt-get install -y build-essential \
    && apt-get clean

# Copy the Apache source code to the container
COPY ./website/ $SOURCE_DIR


# Cleanup the build environment
RUN rm -rf $SOURCE_DIR

# Define a volume for the web content
VOLUME /var/www/html

# Expose Apache ports (e.g., 80 and 443)
EXPOSE 80 443

# Start Apache
CMD ["httpd", "-D", "FOREGROUND"]
