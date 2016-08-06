#!/bin/bash
cat auth_pid.log | xargs kill -9
echo "Kill PID:"
cat auth_pid.log
rm auth_pid.log