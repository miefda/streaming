#!/bin/bash
#use: cat FILENAME | nc IP PORT
#to stream to the listening device


mkfifo /tmp/stream

while true
do 
	cat /tmp/stream | mplayer - -fs -cache 32 &	#use with mplayer
	#cat /tmp/stream | cvlc - -f &			#use with vlc
	PID=$!
	nc -l -p 5000 > /tmp/stream
	sleep 1
	kill -9 $PID
	sleep 1

done

