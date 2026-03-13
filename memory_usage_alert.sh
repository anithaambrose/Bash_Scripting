#!/bin/bash
#
# monitors memory usage on a system and sends an email alert if usage exceeds a specified threshold.
#
# STEPS:
# install packages:
#  sudo apt install mailutils
#  choose: satellite , enter localhost, delete everything and enter - [smtp.gmail.com]:587
#  sudo apt install libsasl2-modules -y
#
# Add Gmail Credentials:
#  sudo nano /etc/postfix/sasl_passwd
#  Add this line:
#  [smtp.gmail.com]:587    yourgmail@gmail.com:your-app-password
#  sudo chmod 600 /etc/postfix/sasl_passwd
#
# Lockdown and hash credentials:
#  sudo postmap /etc/postfix/sasl_passwd
#
# Tell Postfix to use authentication:
# sudo nano /etc/postfix/main.cf
# 
# Add these lines to the bottom of the file:
# relayhost = [smtp.gmail.com]:587
# smtp_use_tls = yes
# smtp_sasl_auth_enable = yes
# smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
# smtp_sasl_security_options = noanonymous
#
# Restart the service:
#  sudo systemctl restart postfix

# Troubleshooting:
#  Logfile:
#  	sudo tail -f /var/log/mail.log
#  MailQueue:
#  	 mailq
#     
# Test :
#  echo "Test alert" | mail -s "Test from server" anitodevops@gmail.com
#
#####################################
# NOTE:
# free: Displays memory usage statistics.
# awk '{print $3/$2 * 100.0}': Calculates the percentage of used memory.
# bc -l: This command-line calculator is used for floating-point comparison.
#####################################
set -x
THRESHOLD=88888888Y_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( $(echo "$MEMORY_USAGE > $THRESHOLD" | bc -l) )); then
	echo "Memory usage is high: $MEMORY_USAGE%" | mail -s "Alert: High Memory Usage" anitodevops@gmail.com
fi
