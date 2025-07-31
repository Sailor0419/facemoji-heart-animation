#!/bin/bash

echo "🚀 Facemoji隐藏福利挑战页面自动部署脚本"
echo "=============================================="

# 检查Git配置
if ! git config user.name > /dev/null 2>&1; then
    echo "❌ Git用户名未配置"
    read -p "请输入您的Git用户名: " git_username
    git config --global user.name "$git_username"
fi

if ! git config user.email > /dev/null 2>&1; then
    echo "❌ Git邮箱未配置"
    read -p "请输入您的Git邮箱: " git_email
    git config --global user.email "$git_email"
fi

# 检查远程仓库
if ! git remote get-url origin > /dev/null 2>&1; then
    echo ""
    echo "📋 请按以下步骤创建GitHub仓库："
    echo "1. 访问 https://github.com/new"
    echo "2. 仓库名称：facemoji-heart-animation"
    echo "3. 选择 Public（公开）"
    echo "4. 不要勾选'Add a README file'"
    echo "5. 点击'Create repository'"
    echo ""
    read -p "请输入GitHub仓库URL (例如: https://github.com/你的用户名/facemoji-heart-animation.git): " repo_url
    
    if [ -n "$repo_url" ]; then
        git remote add origin "$repo_url"
        echo "✅ 远程仓库配置成功"
    else
        echo "❌ 未提供仓库URL，退出"
        exit 1
    fi
fi

# 确保所有更改已提交
if ! git diff-index --quiet HEAD --; then
    echo "📝 提交最新更改..."
    git add .
    git commit -m "Update: Facemoji hidden benefits challenge"
fi

# 推送到GitHub
echo "📤 推送到GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 部署成功！"
    echo "=============================================="
    echo "🌐 您的页面将在以下地址可用："
    
    # 从远程URL提取用户名
    repo_url=$(git remote get-url origin)
    if [[ $repo_url =~ github\.com[:/]([^/]+)/ ]]; then
        username="${BASH_REMATCH[1]}"
        echo "https://$username.github.io/facemoji-heart-animation/"
    else
        echo "https://你的用户名.github.io/facemoji-heart-animation/"
    fi
    
    echo ""
    echo "📱 所有人都可以通过这个链接访问您的Facemoji挑战页面！"
    echo ""
    echo "🔧 下一步操作："
    echo "1. 进入GitHub仓库页面"
    echo "2. 点击 Settings > Pages"
    echo "3. Source选择 'Deploy from a branch'"
    echo "4. Branch选择 'main'，文件夹选择 '/'"
    echo "5. 点击 Save"
    echo ""
    echo "⏰ 页面可能需要几分钟时间才能生效"
    echo ""
    echo "🎯 功能特点："
    echo "- 💖 动态抖动的爱心表情"
    echo "- 🎉 隐藏福利发现机制"
    echo "- 🎬 TikTok视频创作挑战"
    echo "- 🎁 免费会员奖励"
    echo "- 📱 响应式手机界面"
else
    echo "❌ 推送失败，请检查："
    echo "1. 网络连接"
    echo "2. GitHub仓库权限"
    echo "3. 仓库URL是否正确"
fi 