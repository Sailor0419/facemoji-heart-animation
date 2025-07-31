#!/bin/bash

echo "🚀 快速部署Facemoji隐藏福利挑战页面"
echo "======================================"

# 检查是否已有远程仓库
if git remote get-url origin > /dev/null 2>&1; then
    echo "✅ 检测到远程仓库配置"
    repo_url=$(git remote get-url origin)
    echo "仓库地址: $repo_url"
    
    # 推送到GitHub
    echo "📤 推送到GitHub..."
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "🎉 部署成功！"
        echo "======================================"
        
        # 提取用户名
        if [[ $repo_url =~ github\.com[:/]([^/]+)/ ]]; then
            username="${BASH_REMATCH[1]}"
            echo "🌐 您的页面地址："
            echo "https://$username.github.io/facemoji-heart-animation/"
        fi
        
        echo ""
        echo "📱 所有人都可以通过这个链接访问！"
        echo ""
        echo "🔧 下一步：在GitHub仓库设置中启用Pages"
        echo "1. 进入仓库页面"
        echo "2. Settings > Pages"
        echo "3. Source: Deploy from a branch"
        echo "4. Branch: main, 文件夹: /"
        echo "5. Save"
        
    else
        echo "❌ 推送失败"
    fi
    
else
    echo "❌ 未配置远程仓库"
    echo ""
    echo "📋 请先创建GitHub仓库："
    echo "1. 访问 https://github.com/new"
    echo "2. 仓库名: facemoji-heart-animation"
    echo "3. 选择 Public"
    echo "4. 不要勾选README"
    echo "5. 创建后复制仓库URL"
    echo ""
    read -p "请输入GitHub仓库URL: " repo_url
    
    if [ -n "$repo_url" ]; then
        git remote add origin "$repo_url"
        echo "✅ 远程仓库配置成功"
        
        # 推送到GitHub
        echo "📤 推送到GitHub..."
        git push -u origin main
        
        if [ $? -eq 0 ]; then
            echo ""
            echo "🎉 部署成功！"
            echo "======================================"
            
            # 提取用户名
            if [[ $repo_url =~ github\.com[:/]([^/]+)/ ]]; then
                username="${BASH_REMATCH[1]}"
                echo "🌐 您的页面地址："
                echo "https://$username.github.io/facemoji-heart-animation/"
            fi
            
            echo ""
            echo "📱 所有人都可以通过这个链接访问！"
            echo ""
            echo "🔧 下一步：在GitHub仓库设置中启用Pages"
            echo "1. 进入仓库页面"
            echo "2. Settings > Pages"
            echo "3. Source: Deploy from a branch"
            echo "4. Branch: main, 文件夹: /"
            echo "5. Save"
            
        else
            echo "❌ 推送失败"
        fi
    else
        echo "❌ 未提供仓库URL"
    fi
fi 