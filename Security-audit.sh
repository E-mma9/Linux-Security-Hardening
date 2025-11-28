#!/bin/bash

echo "Linux Security Audit "
echo ""



# Check SSH configuration
echo " SSH configuration:"
grep -E '^(Port|PermitRootLogin|PasswordAuthentication)' /etc/ssh/sshd_config || echo "No SSH settings found."
echo ""

#  Firewall status
echo  "UFW firewall status:"
ufw status verbose || echo "UFW not installed or not enabled."
echo ""

# 4. Failed SSH login attempts (last 24h)
echo " Failed SSH login attempts (last 24h):"
if [ -f /var/log/auth.log ]; then
  grep "Failed password" /var/log/auth.log | tail -20
else
  echo "auth.log not found."
fi
echo ""

# 5. Pending security updates
echo " Packages with available updates:"
apt list --upgradable 2>/dev/null | tail -20
echo ""

echo " Audit Complete "
