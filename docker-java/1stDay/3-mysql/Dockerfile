FROM mysql:5.7

# Copy the database initialize script:
# Contents of /docker-entrypoint-initdb.d are run on mysqld startup
ADD  initialize_db.sql /docker-entrypoint-initdb.d/initialize_db.sql

# Default values for passwords and database name. Can be overridden on docker run
# ENV MYSQL_ROOT_PASSWORD=my-secret-pw # Not defaulted for security reasons!
ENV MYSQL_DATABASE=signup
ENV MYSQL_USER=novi
ENV MYSQL_PASSWORD=password
