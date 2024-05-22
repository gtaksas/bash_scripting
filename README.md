# Bash Scripting Basics
This project is showcases the basics of `bash scripting` by documenting the key concept points.
The documentation may also includes solutions to the `Hack The Box` `Introduction to Bash Scripting` module.

Table of contents:
* 1. [Conditional Execution](#conditional-execution)
	* 1.1. [exercise-script.sh](#exercise-script.sh)
		* 1.1.1. [Steps to see the output](#steps-to-see-the-output)
* 2. [Arguments, Variables, and Arrays](#arguments-variables-and-arrays)
        * 2.1. [Special Variables](#21-special-variables)
        * 2.2. [Arrays.sh](#arrays-sh)
        * 2.3. [Declarig a variable with and without an Error](#declarig-a-variable-with-and-without-an-error)
* 3. [Comparision and Arithmetic Operators](#comparison-and-arithmetic-operators)
        * 3.1. [Comparision Exercise](#comparison-exercise)

##  1. <a name='conditional-execution'></a>Conditional Execution
###  1.1. <a name='exercise-script.sh'></a>exercise-script.sh

```bash
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

```bash
echo -n "$var" | wc -c
```

####  1.1.1. <a name='steps-to-see-the-output'></a>Steps to see the output

1. `git clone` this `repository` or copy the code above and save it to a file on your local machine. Name the file `exercise-script`.

2. Type the following line into the `terminal` to run and execute the code in the file so you can see the answer:
> bash exercise-script.sh


## 2. <a name='arguments-variables-and-arrays'></a>Arguments, Variables, and Arrays
### 2.1. <a name='special-variables'></a>Special Variables

https://www.geeksforgeeks.org/shell-script-to-demonstrate-special-parameters-with-example/

### 2.2. <a name='arrays-sh'></a>Arrays.sh

```bash
#!/bin/bash

domains=("www.inlanefreight.com ftp.inlanefreight.com vpn.inlanefreight.com" www2.inlanefreight.com)
echo ${domains[0]}
```
All spaces between the single `'...'` and double quotes `"..."` are ignored and handled as a single value assigned to the array.

terminal:
> ./Arrays.sh

output:
> www.inlanefreight.com ftp.inlanefreight.com vpn.inlanefreight.com

The `echo` statement that would print `www2.inlanefreight.com` when running the last `Arrays.sh` script:

```bash
echo ${domains[1]}
```

### 2.3. <a name='declarig-a-variable-with-and-without-an-error'></a>Declarig a variable with and without an Error

```
variable = "this will result with an error."
```

```
variable="Declared without an error."
```

When declaring variables that they do not contain a space!

## 3. <a name='comparision-and-arithmetic-operators'></a>Comparison and Arithmetic Operators
https://devmanual.gentoo.org/tools-reference/bash/index.html

### 3.1. <a name='comparision-exercise'></a>Comparison Exercise

exercise-script.sh
```bash
#!/bin/bash

var="8dm7KsjU28B7v621Jls"
value="ERmFRMVZ0U2paTlJYTkxDZz09Cg"

for i in {1..40}
do
        var=$(echo $var | base64)
		
		#<---- If condition here:
done

```
Create an "If-Else" condition in the "For"-Loop that checks if the variable named "var" contains the contents of the variable named "value". Additionally, the variable "var" must contain more than 113,450 characters. If these conditions are met, the script must then print the last 20 characters of the variable "var".

Sample solution:
```bash	
        if [[ $var == *$value* && ${#var} -gt 113450 ]]
        then
            echo ${var: -20}
            # also:
            # echo -n $var | tail -c 20
            # note that both method excludes new-line characters
            exit 0
        fi
```

