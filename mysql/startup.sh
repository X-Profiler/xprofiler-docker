#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
  mkdir -p /run/mysqld
fi

if [ -d /easy-monitor/mysql/data/mysql ]; then
  echo "[i] MySQL directory already present, skipping creation"
else
  echo "[i] MySQL data directory not found, creating initial DBs"

  mysql_install_db --user=root > /dev/null

  if [ "$MYSQL_ROOT_PASSWORD" = "" ]; then
    MYSQL_ROOT_PASSWORD=root
    echo "[i] MySQL root Password: $MYSQL_ROOT_PASSWORD"
  fi
  
  tfile=`mktemp`
  if [ ! -f "$tfile" ]; then
      return 1
  fi
  
  cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
EOF

  /usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
  
fi

exec /usr/bin/mysqld --user=root --init-file=/easy-monitor/mysql/easy_monitor_init_db.sql --console
