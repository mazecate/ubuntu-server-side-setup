#!/bin/bash

# Define the source files
files=(
    "access_log"
    "error_log"
)

# Get the current date in YYYYMMDD format
current_date=$(date +"%Y%m%d_%H%M%S")

# Define the destination folder with the current date
destination_folder="$HOME/$current_date"

# Create the destination folder
mkdir -p "$destination_folder"

# Function to convert log file to CSV
convert_to_csv() {
    local file=$1
    local csv_file=$2

    # Example conversion using awk (adjust the pattern and fields as needed)
    awk 'BEGIN {FS=" "; OFS=","} { print $1, $2, $3, $4, $5, $6, $7, $8, $9 }' "$file" > "$csv_file"
}

# Loop through each file and copy it with the new filename
for file in "${files[@]}"; do
    # Extract the base name of the file
    base_name=$(basename "$file")

    # Define the new filename with the date appended
    new_filename="${base_name%.*}_$current_date.${base_name##*.}"

    # Copy the file to the destination folder with the new filename
    cp "$file" "$destination_folder/$new_filename"

    # Define the CSV filename
    csv_filename="${base_name%.*}_$current_date.csv"

    # Convert the log file to CSV
    convert_to_csv "$file" "$destination_folder/$csv_filename"

    # Print a message indicating the file has been copied and converted
    echo "File copied to $destination_folder/$new_filename and converted to $destination_folder/$csv_filename"
done
