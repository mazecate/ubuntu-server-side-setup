#!/bin/bash

# Define the path to your log file
log_file="/path/to/var/log/messages"
csv_file="/path/to/output.csv"

# Write the CSV header
echo "Date,Time,Host,Message" > $csv_file

# Read the log file and convert to CSV
while IFS= read -r line
do
    # Assuming log lines are formatted as: "Month Day Time Host Message"
    date=$(echo $line | awk '{print $1" "$2}')
    time=$(echo $line | awk '{print $3}')
    host=$(echo $line | awk '{print $4}')
    message=$(echo $line | cut -d' ' -f5-)

    # Write the formatted log line to the CSV file
    echo "$date,$time,$host,$message" >> $csv_file
done < $log_file

echo "Log file has been converted to CSV."
