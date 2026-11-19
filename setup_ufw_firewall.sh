#!/bin/bash
# ==============================================================================
# Script cấu hình tường lửa UFW (Uncomplicated Firewall) trên Ubuntu VPS
# Nguyên tắc: Mặc định Chặn toàn bộ Incoming -> Chỉ mở Port 22 (SSH) và Port 8080 (App)
# ==============================================================================
set -e

echo "=== 1. Reset UFW về trạng thái ban đầu ==="
sudo ufw --force reset

echo "=== 2. Thiết lập chính sách mặc định: Deny Incoming, Allow Outgoing ==="
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "=== 3. Mở cổng SSH (22/tcp) để tránh mất kết nối máy chủ ==="
sudo ufw allow 22/tcp comment 'SSH Remote Access'

echo "=== 4. Mở cổng ứng dụng Backend (8080/tcp) ==="
sudo ufw allow 8080/tcp comment 'QuickBite Backend Service'

echo "=== 5. Kích hoạt tường lửa UFW ==="
sudo ufw --force enable

echo "=== 6. Kiểm tra trạng thái tường lửa ==="
sudo ufw status verbose
