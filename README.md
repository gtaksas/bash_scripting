# Bash Scripting Basics
This project is showcases the basics of `bash scripting` by documenting the key concept points.
The documentation may also includes solutions to the `Hack The Box` `Introduction to Bash Scripting` module.

Table of contents:
* 1. [Conditional Execution](#ConditionalExecution)
	* 1.1. [exercise-script.sh](#exercise-script.sh)
		* 1.1.1. [Steps to see the output](#Stepstoseetheoutput)

##  1. <a name='ConditionalExecution'></a>Conditional Execution
###  1.1. <a name='exercise-script.sh'></a>exercise-script.sh

```
#!/bin/bash
# Count number of characters in a variable:
#     echo $variable | wc -c

# Variable to encode
var="nef892na9s1p9asn2aJs71nIsm"

for counter in {1..40}
do
        var=$(echo $var | base64)
if [ $counter -eq 35 ]
then
	echo "$var" | wc -c
fi
done
```

Above we created an `If-Else` condition in the `For-Loop` of the `Exercise Script` that prints you the number of characters of the 35th generated value of the variable `"var"`. 

 You'll have to use the `do not output the trailing newline` `-n` option for `echo`. Otherwise, the newline character will also be counted.

```
echo -n "$var" | wc -c
```

####  1.1.1. <a name='Stepstoseetheoutput'></a>Steps to see the output

1. `git clone` this `repository` or copy the code above and save it to a file on your local machine. Name the file `exercise-script`.

2. Type the following line into the `terminal` to run and execute the code in the file so you can see the answer:
> bash exercise-script.sh