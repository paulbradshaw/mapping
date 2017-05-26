while read line
do
        const=`echo $line | awk -F"," {'print $1'}`
        maj=`echo $line | awk -F"," {'print $3'}`
        winner=`echo $line | awk -F"," {'print $2'}`

        echo "{"
        echo " \"name\": \"$const\","
        echo " \"majority\": \"$maj\","
        echo " \"winner\": \"$winner\""
        echo "},"
done < election15.csv
