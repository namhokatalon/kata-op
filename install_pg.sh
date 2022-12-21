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
