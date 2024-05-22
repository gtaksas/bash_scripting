#!/bin/bash

var="8dm7KsjU28B7v621Jls"
value="ERmFRMVZ0U2paTlJYTkxDZz09Cg"

for i in {1..40}
do
        var=$(echo $var | base64)
		
		# checks if the variable named "var" contains the contents of the variable named "value" and contains more than 113,450 characters. If do so then print the last 20 characters
        if [[ $var == *$value* && ${#var} -gt 113450 ]]
        then
            echo ${var: -20}
            # also:
            # echo -n $var | tail -c 20
            # note that both method excludes new-line characters
            exit 0
        fi
done
