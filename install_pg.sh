### Amz-2
## Install

sudo amazon-linux-extras enable postgresql13
sudo yum install postgresql postgresql-server
sudo postgresql-setup initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql

sudo passwd postgres
su - postgres
psql -c "ALTER USER postgres WITH PASSWORD 'your-super-secret-password';"

## Make it reachable from outside
Because I opened port 5432 on ec2 only to a set of ip addresses I make postgres to listen to any incoming address:

Change /var/lib/pgsql/data/postgresql.conf and put around line 59:

listen_addresses = '*'
Likewise /var/lib/pgsql/data/pg_hba.conf (around line 88) add this line:

host  all  all 0.0.0.0/0 md5
Now you should be able to connect to your db from outside.


### Debian 11
## https://www.server-world.info/en/note?os=Debian_11&p=postgresql&f=1

### CentOS 7
## https://computingforgeeks.com/how-to-install-postgresql-14-centos-rhel-7/


### Psql
CREATE EXTENSION pg_stat_statements;

drop database k1;
drop database kit;
drop role datadog;
drop role root;
drop role kit_admin_role;
drop role kit_admin_user1;
drop role kit_app_role;
drop role kit_app_user1;
drop role kit_readonly_role;
drop role kit_readonly_user1;
create database k1;
create database kit;


1. ### Download debug images
wget https://katalon-op-deploy.s3.amazonaws.com/2.1.0/katalon-op-debug.tar.gz
docker load < katalon-op-debug.tar.gz
docker images | grep katalon-op-debug

2. ### Run debug image to check DB connect

docker run --rm -it katalon-op-debug:2.1.0 bash
root@11c015fa2fdf:/#

nc -zv <ip> 5432

psql -U postgres -p 5432 -h <ip>

\l  #list databases
\du #list roles
\dx #list extensions


