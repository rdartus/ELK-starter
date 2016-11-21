spawn htpasswd /etc/nginx/htpasswd.users test

# Automate the 'New password' Procedure
expect "New password:"
send "test2\r"

expect "Re-type new password:"
send "test2\r"
