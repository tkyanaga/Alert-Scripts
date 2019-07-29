README
This script checks a website and will report if the # of results increases.

Checking interval, email body, subject and default address may be set in script.

This was tested using forums.vwvortex.com, postfix on MacOS. should work with all unix/linux distros

Result search string is unique to vwvortex forum, works with caraudiojunkie forums as well. Configure as needed!

The first variable is the search url, the second is the email address to send mail to.

Usage is ./alrt.sh url-to-be-searched alertee@mailservice.com
