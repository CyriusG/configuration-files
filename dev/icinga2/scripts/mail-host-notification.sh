#!/bin/sh
template=`cat <<TEMPLATE
***** Icinga  *****

Notification Type: $NOTIFICATIONTYPE

Host: $HOSTALIAS
Address: $HOSTADDRESS
State: $HOSTSTATE

Date/Time: $LONGDATETIME

Additional Info: $HOSTOUTPUT

Comment: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT
TEMPLATE
`

MESSAGE=$(/usr/bin/printf "%b" "$template")

curl -s --user 'api:key-91d41dc2065ba936949e7f0d2140de8e' https://api.mailgun.net/v3/mg.cyriusg.se/messages -F from='Icinga <mailgun@mg.cyriusg.se>' -F to="$USEREMAIL" -F subject="$NOTIFICATIONTYPE - $HOSTDISPLAYNAME is $HOSTSTATE" -F text="$MESSAGE"
