#!/bin/bash
template=`cat <<TEMPLATE
***** Icinga  *****

Notification Type: $NOTIFICATIONTYPE

Service: $SERVICEDESC
Host: $HOSTALIAS
Address: $HOSTADDRESS
State: $SERVICESTATE

Date/Time: $LONGDATETIME

Additional Info: $SERVICEOUTPUT

Comment: [$NOTIFICATIONAUTHORNAME] $NOTIFICATIONCOMMENT
TEMPLATE
`

MESSAGE=$(/usr/bin/printf "%b" "$template")

curl -s --user 'api:key-91d41dc2065ba936949e7f0d2140de8e' https://api.mailgun.net/v3/mg.cyriusg.se/messages -F from='Icinga <mailgun@mg.cyriusg.se>' -F to="$USEREMAIL" -F subject="$NOTIFICATIONTYPE - $HOSTDISPLAYNAME - $SERVICEDISPLAYNAME is $SERVICESTATE" -F text="$MESSAGE"
