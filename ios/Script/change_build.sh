#!/bin/bash

# 定义xcconfig文件路径
XCCONFIG_FILE="../Config/Common.xcconfig"

# 读取当前版本号
OLD_VERSION=$(grep "CURRENT_PROJECT_VERSION" $XCCONFIG_FILE | awk -F'=' '{print $2}' | tr -d ' ;' | xargs)

# 生成新版本号(示例递增最后一位)
NEW_VERSION=$(echo $OLD_VERSION | awk -F. -v OFS=. '{$NF++;print}')

# 修改文件内容
sed -i '' "s/CURRENT_PROJECT_VERSION *=.*/CURRENT_PROJECT_VERSION = $NEW_VERSION/" $XCCONFIG_FILE

echo "Version updated: $OLD_VERSION -> $NEW_VERSION"
