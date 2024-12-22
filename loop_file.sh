#！/bin/bash

# Define the source files
files=(
    "path_a"
    "path_b"
)

# Get the current date in YYYYMMOD Format
current_date=$(date+"%Y%m%d_%H%M%S")

# Define the destination folder
destination_folder="/home/hihihihihihih"

# Define the destination folder with the current date
# destination folder="$HOME/$current_date"

# Create the destination folder
# mkdir -p "$destination_folder"

# Loop through each file and copy it with the new filename
for file in "${files[@]}"; do

    # Extract the base name of the file
    base_name=$(basename "$file")

    # Define the new filename with the date appended
    # example: abc.20241127.log
    # new_filename="${base_name%.*).$current_date.$(base_name##*.}"

    new_filename=$base_name.$current_date

    # Copy the file to the destination folder with the new filename
    cp "$file" "$destination_folder/$new_filename"

    # Print a message indicating the file has been copied
    echo "File copied to $destination_folder/$new_filename"
done
