#!/bin/bash

echo "🔄 快速更新Facemoji页面"
echo "========================"

# 检查是否有修改
if git diff --quiet; then
    echo "✅ 没有需要更新的内容"
    exit 0
fi

# 显示修改的文件
echo "📝 检测到以下文件有修改："
git status --porcelain

# 添加所有修改
echo "📦 添加修改的文件..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "Update: $(date '+%Y-%m-%d %H:%M:%S')"

# 推送到GitHub
echo "📤 推送到GitHub..."
git push

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 更新成功！"
    echo "========================"
    echo "🌐 页面地址：https://Sailor0419.github.io/facemoji-heart-animation/"
    echo ""
    echo "⏰ 页面将在几分钟内自动更新"
else
    echo "❌ 推送失败"
fi 