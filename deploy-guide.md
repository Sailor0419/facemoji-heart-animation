# 🚀 Facemoji 隐藏福利挑战页面部署指南

## 📋 部署步骤

### 1. 创建GitHub仓库
1. 访问 https://github.com/new
2. 仓库名称：`facemoji-heart-animation`
3. 选择 **Public**（公开）
4. **不要**勾选"Add a README file"
5. 点击"Create repository"

### 2. 配置远程仓库
```bash
git remote add origin https://github.com/你的用户名/facemoji-heart-animation.git
```

### 3. 推送到GitHub
```bash
git push -u origin main
```

### 4. 启用GitHub Pages
1. 进入GitHub仓库页面
2. 点击 **Settings** 标签
3. 左侧菜单找到 **Pages**
4. Source选择 **Deploy from a branch**
5. Branch选择 **main**
6. 文件夹选择 **/** (root)
7. 点击 **Save**

### 5. 访问您的页面
部署完成后，您的页面将在以下地址可用：
```
https://你的用户名.github.io/facemoji-heart-animation/
```

## 🎯 功能特点
- 💖 动态抖动的爱心表情
- 🎉 隐藏福利发现机制
- 🎬 TikTok视频创作挑战
- 🎁 免费会员奖励
- 📱 响应式手机界面

## ⚡ 快速部署脚本
运行 `./deploy.sh` 可以自动完成部署过程。

---
*部署完成后，所有人都可以通过公开链接访问您的Facemoji挑战页面！* 