#!/bin/bash

sqlite3 connections.db <<< "CREATE TABLE hosts (hostip text NOT NULL, protocol text NOT NULL, state NOT NULL);";

hostip=`netstat | grep tcp | tr -s ' ' | cut -d' ' -f5 | cut -d":" -f1 | head -1`
protocol=`netstat | grep tcp | tr -s ' ' | cut -d' ' -f5 | cut -d":" -f2 | head -1`
state=`netstat | grep tcp | tr -s ' ' | cut -d' ' -f6 | head -1`

sqlite3 connections.db <<< "INSERT INTO hosts VALUES ('$hostip', '$protocol', '$state');";

hostip=`netstat | grep tcp | tr -s ' ' | cut -d' ' -f5 | cut -d":" -f1 | head -2 | tail -1`
protocol=`netstat | grep tcp | tr -s ' ' | cut -d' ' -f5 | cut -d":" -f2 | head -2 | tail -1`
state=`netstat | grep tcp | tr -s ' ' | cut -d' ' -f6 | head -2 | tail -1`

sqlite3 connections.db <<< "INSERT INTO hosts VALUES ('$hostip', '$protocol', '$state');";

sqlite3 connections.db <<< "SELECT * FROM hosts WHERE protocol='https';";
sqlite3 connections.db <<< "SELECT * FROM hosts WHERE state='ESTABLISHED';";