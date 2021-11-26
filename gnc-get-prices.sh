echo "script started $(date | awk -F " " '{print $4}')" >> /logfile
gnucash-cli --logto /debug.log -Q get  postgres://${DB_USER}:${DB_PASSWORD}@${DB_ADDRESS}:${DB_PORT}/${DB_DATABASE} >> /logfile
if grep -q ERROR /debug.log; then
    echo "ERROR found, retrying....." >> /logfile
    for (( i=1; i<=10; i++ ))
    do
	    echo "retrying attempt $i" >> /logfile
	    gnucash-cli --logto /debug.log -Q get postgres://${DB_USER}:${DB_PASSWORD}@${DB_ADDRESS}:${DB_PORT}/${DB_DATABASE}
        if grep -q ERROR /debug.log; then
            sleep 120
        else
            echo "success" >> /logfile
            break
        fi
    done
else
    echo "success" >> /logfile
fi

echo "script ended $(date | awk -F " " '{print $4}')" >> /logfile       