# Pulling Ubuntu image
FROM ubuntu:latest

# Updating packages and installing cron
RUN apt-get update && apt-get install cron curl -y 

# Copying script file into the container
COPY backup.sh .

# Giving executable permission to the script file
RUN chmod +x backup.sh

# Adding crontab to the appropriate location
ADD crontab /etc/cron.d/my-cron-file

# Giving permission to crontab file
RUN chmod 0644 /etc/cron.d/my-cron-file

# Running crontab
RUN crontab /etc/cron.d/my-cron-file

# Creating entry point for cron 
ENTRYPOINT ["cron", "-f"]
