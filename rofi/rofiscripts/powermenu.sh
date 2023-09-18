#!/bin/bash

options="Shutdown\nRestart\nLogout\nSuspend\nHibernate"
selected_option=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case "$selected_option" in
  "Shutdown")
    systemctl poweroff
    ;;
  "Restart")
    systemctl reboot
    ;;
  "Logout")
    qdbus org.kde.ksmserver /KSMServer logout 0 0 0
    ;;
  "Suspend")
    systemctl suspend
    ;;
  "Hibernate")
    systemctl hibernate
    ;;
  *)
    echo "Invalid option"
    ;;
esac
