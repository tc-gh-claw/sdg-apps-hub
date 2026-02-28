#!/bin/bash
# SDG Apps Auto-Generator - 每小時生成一款永續發展 APP
# Created by 蝦仔

PROJECT_DIR="/root/.openclaw/workspace/sdg-apps-hub"
DATE=$(date +%Y%m%d_%H%M)
APP_NUM=$(date +%H)

cd "$PROJECT_DIR"

# 根據小時決定生成哪款 APP
case $APP_NUM in
    01|13)
        APP_NAME="carbon-calculator"
        APP_TITLE="Carbon Footprint Calculator"
        APP_DESC="碳足跡計算器 - 計算每日碳排放量"
        ;;
    02|14)
        APP_NAME="eco-shopping"
        APP_TITLE="Eco Shopping List"
        APP_DESC="永續購物清單 - 環保消費指南"
        ;;
    03|15)
        APP_NAME="sustainable-diet"
        APP_TITLE="Sustainable Diet Planner"
        APP_DESC="永續飲食規劃 - 健康環保餐單"
        ;;
    04|16)
        APP_NAME="water-tracker"
        APP_TITLE="Water Conservation Tracker"
        APP_DESC="節水追蹤器 - 記錄用水習慣"
        ;;
    05|17)
        APP_NAME="energy-monitor"
        APP_TITLE="Home Energy Monitor"
        APP_DESC="家居能源監測 - 節能減碳助手"
        ;;
    06|18)
        APP_NAME="waste-sorter"
        APP_TITLE="Smart Waste Sorter"
        APP_DESC="智能垃圾分類 - 正確分類指引"
        ;;
    07|19)
        APP_NAME="green-transport"
        APP_TITLE="Green Transport Planner"
        APP_DESC="綠色出行規劃 - 低碳交通方案"
        ;;
    08|20)
        APP_NAME="sdg-quiz"
        APP_TITLE="SDG Knowledge Quiz"
        APP_DESC="SDG知識測驗 - 永續發展學習"
        ;;
    09|21)
        APP_NAME="eco-challenge"
        APP_TITLE="30-Day Eco Challenge"
        APP_DESC="30天環保挑戰 - 養成永續習慣"
        ;;
    10|22)
        APP_NAME="biodiversity"
        APP_TITLE="Biodiversity Explorer"
        APP_DESC="生物多樣性探索 - 認識自然生態"
        ;;
    11|23)
        APP_NAME="renewable-energy"
        APP_TITLE="Renewable Energy Sim"
        APP_DESC="再生能源模擬 - 了解潔淨能源"
        ;;
    12|00)
        APP_NAME="climate-action"
        APP_TITLE="Climate Action Tracker"
        APP_DESC="氣候行動追蹤 - 個人減碳目標"
        ;;
    *)
        APP_NAME="sdg-app-$DATE"
        APP_TITLE="SDG App $DATE"
        APP_DESC="永續發展應用程式"
        ;;
esac

APP_DIR="$PROJECT_DIR/app-$(printf "%03d" $APP_NUM)-$APP_NAME"
mkdir -p "$APP_DIR"

echo "[$(date)] Generating $APP_TITLE..." >> "$PROJECT_DIR/generation.log"

# 創建基礎 HTML 模板
cat > "$APP_DIR/index.html" << 'HTMLEOF'
<!DOCTYPE html>
<html lang="zh-HK">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APP_TITLE</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, #1a5f3f 0%, #2d8a5e 100%);
            min-height: 100vh;
            padding: 20px;
            color: #333;
        }
        .container { max-width: 800px; margin: 0 auto; }
        .header {
            text-align: center;
            color: white;
            margin-bottom: 30px;
            padding: 20px;
        }
        .header h1 { font-size: 2.2rem; font-weight: 800; margin-bottom: 10px; }
        .card {
            background: white;
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
        }
        .btn {
            padding: 15px 30px;
            background: linear-gradient(135deg, #4ade80 0%, #22c55e 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🌍 APP_TITLE</h1>
            <p>APP_DESC</p>
            <p style="margin-top: 10px; font-size: 0.9rem; opacity: 0.8;">生成時間: GENERATED_AT</p>
        </div>
        <div class="card">
            <h2 style="color: #1a5f3f; margin-bottom: 15px;">📱 功能開發中</h2>
            <p>這是 SDG Apps Hub 自動生成的第 APP_NUMBER 款應用程式。</p>
            <p style="margin-top: 15px;">這款 APP 旨在對應聯合國永續發展目標(SDGs)，
            幫助用戶在日常生活中實踐永續行動。</p>
        </div>
        
        <div class="card">
            <button class="btn" onclick="alert('功能即將推出！')">開始使用</button>
            <button class="btn" onclick="location.reload()">重新整理</button>
        </div>
    </div>
</body>
</html>
HTMLEOF

# 替換變數
sed -i "s/APP_TITLE/$APP_TITLE/g" "$APP_DIR/index.html"
sed -i "s/APP_DESC/$APP_DESC/g" "$APP_DIR/index.html"
sed -i "s/APP_NUMBER/$(printf "%03d" $APP_NUM)/g" "$APP_DIR/index.html"
sed -i "s/GENERATED_AT/$(date '+%Y-%m-%d %H:%M:%S')/g" "$APP_DIR/index.html"

echo "[$(date)] Generated: $APP_TITLE at $APP_DIR" >> "$PROJECT_DIR/generation.log"
echo "$(date +%Y-%m-%d %H:%M:%S) - $APP_TITLE" >> "$PROJECT_DIR/apps-list.txt"
