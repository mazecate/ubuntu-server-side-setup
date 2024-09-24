#!/bin/bash

# 切换到用户的主目录
cd ~

# 执行 df -h 命令并将结果输出到 home_output.txt 文件
df -h > home_output.txt

# print new line to the file
printf "\n" >> home_output.txt

pwd >> home_output.txt

top 1 | head -n 13 > output.txt

# 执行 tail 命令并将结果输出到 error_log_output.txt 文件
# tail -f -n 100 /var/log/error_log > error_log_output.txt

# 获取当前日期和前两天的日期
# today=$(date +%Y%m%d)
# yesterday=$(date -d "yesterday" +%Y%m%d)
# day_before_yesterday=$(date -d "2 days ago" +%Y%m%d)

# # 定义日志文件路径
# log_files=(
#     "/var/log/error_log_$day_before_yesterday"
#     "/var/log/error_log_$yesterday"
#     "/var/log/error_log_$today"
# )

# # 输出日志内容到 error_log_output.txt 文件
# for log_file in "${log_files[@]}"; do
#     if [ -f "$log_file" ]; then
#         echo "Processing $log_file" >> error_log_output.txt
#         tail -n 100 "$log_file" >> error_log_output.txt
#     else
#         echo "$log_file does not exist" >> error_log_output.txt
#     fi
# done


# MYSQL_USER="your_username"
# MYSQL_PASSWORD="your_password"
# MYSQL_DATABASE="your_database"
# OUTPUT_FILE="output.csv"

# # 定義查詢函數
# create_table() {
#     echo "CREATE TABLE example_table (id INT PRIMARY KEY, name VARCHAR(50));"
# }

# insert_data() {
#     echo "INSERT INTO example_table (id, name) VALUES (1, 'Alice');"
# }

# select_data() {
#     echo "SELECT * FROM example_table;"
# }

# export_data() {
#     echo "SELECT * FROM user WHERE user_id = 1 INTO OUTFILE '/tmp/$OUTPUT_FILE'
#     FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n';"
# }

# # 打開 MySQL 連接並執行查詢
# mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" <<EOF
# $(create_table)
# $(insert_data)
# $(select_data)
# $(export_data)
# EOF

# # 移動文件到用戶主目錄
# mv /tmp/$OUTPUT_FILE ~/
