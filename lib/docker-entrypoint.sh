#!/bin/bash -e

rails db:create
rails db:migrate

if [[ -a /usr/src/app/tmp/pids/server.pid ]]; then
	echo "Removing stale PID file from /usr/src/app/tmp/pids/server.pid...."
	rm /usr/src/app/tmp/pids/server.pid
fi

rails s -b 0.0.0.0 -p 4040 -P /usr/src/app/tmp/pids/server.pid