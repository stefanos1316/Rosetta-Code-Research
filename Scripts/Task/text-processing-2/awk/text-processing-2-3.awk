bash$ awk '!(/^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]([ \t]+[-]?[0-9]+\.[0-9]+[\t ]+[-]?[0-9]+)+$/ && NF==49)' readings.txt
bash$
