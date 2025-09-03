# Lab 1 Scripts

# Test MySQL Connection: Using MySQL command line client:
mysql -h sa-mysql-lab1.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
# Enter password: Lab123456!

# Test commands:
SHOW DATABASES;
USE labdb;
CREATE TABLE test_table (id INT PRIMARY KEY, name VARCHAR(50));
INSERT INTO test_table VALUES (1, 'Test Data');
SELECT * FROM test_table;
EXIT;

# Test PostgreSQL Connection: Using psql client

psql -h sa-postgres-lab1.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -p 5432 -U postgres -d labdb
# Enter password: Lab123456!

# Test commands:
\\l
\\c labdb
CREATE TABLE test_table (id SERIAL PRIMARY KEY, name VARCHAR(50));
INSERT INTO test_table (name) VALUES ('Test Data');
SELECT * FROM test_table;
\\q

# Lab 2

# Test Connection Still Works:

mysql -h sa-mysql-lab1.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
SELECT @@hostname;  # Shows which instance you are connected
SHOW DATABASES;
EXIT;

# Lab 3

# Test Local Read Replica:

# Connect to local read replica
mysql -h sa-mysql-replica-local.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
# Test read operations
SELECT * FROM labdb.test_table;

# Try write operation (should fail)
INSERT INTO labdb.test_table VALUES (2, 'This should fail');
# Expected: ERROR 1290 (HY000): The MySQL server is running with the --read-only option

EXIT;

# Test Replication Lag:

# Connect to source (master)
mysql -h sa-mysql-lab1.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
INSERT INTO labdb.test_table VALUES (3, 'Replication test');
SELECT NOW();  # Note the time
EXIT;

# Immediately connect to replica
mysql -h sa-mysql-replica-local.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
SELECT * FROM labdb.test_table WHERE id = 3;
SELECT NOW();  # Compare time
EXIT;

# Lab 4

# Create Test Data:

mysql -h sa-mysql-replica-local.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
USE labdb;
CREATE TABLE backup_test (
  id INT PRIMARY KEY,
  data VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO backup_test VALUES (1, 'Before snapshot', NOW());
SELECT * FROM backup_test;
EXIT;

# Create More Test Data

mysql -h sa-mysql-replica-local.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
USE labdb;
INSERT INTO backup_test VALUES (2, 'Data to be lost', NOW());
INSERT INTO backup_test VALUES (3, 'More data to lose', NOW());
SELECT * FROM backup_test;
# Note the current time
SELECT NOW();
EXIT;

# Simulate Accidental Deletion

mysql -h sa-mysql-replica-local.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
USE labdb;
DROP TABLE backup_test;  # Simulate accidental deletion
SHOW TABLES;  # Verify table is gone
EXIT;

# Test Restored Data:

# Connect to restored instance

mysql -h sa-mysql-restored.cnyy0igkkd9i.eu-west-1.rds.amazonaws.com -P 3306 -u admin -p
USE labdb;
SHOW TABLES;  # backup_test table should exist
SELECT * FROM backup_test;  # Should show data before deletion
EXIT;