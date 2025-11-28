#!/bin/bash
set -e

echo "=== Linux Security Hardening Script ==="
echo "This script will harden your Ubuntu/Debian server."
echo ""

# 1. System updates
echo "1/5 Updating system"
apt update && apt upgrade -y
apt install -y unattended-upgrades
systemctl enable unattended-upgrades

# 2. SSH hardening
echo "2/5 Hardening the SSH configurations"
sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^#\?Port .*/Port 2222/' /etc/ssh/sshd_config
systemctl restart ssh || systemctl restart sshd

# 3. Firewall (UFW)
echo "3/5 Configuring the UFW firewall"
apt install -y ufw
ufw --force enable
ufw default deny incoming
ufw default allow outgoing
ufw allow 2222/tcp   # SSH
ufw allow 80/tcp     # HTTP
ufw allow 443/tcp    # HTTPS

# 4. Install auditd
echo "4/5 Installing auditd "
apt install -y auditd
systemctl enable auditd
systemctl start auditd


echo ""
echo "Hardening Compleet"

