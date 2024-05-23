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
* 3. [Comparison and Arithmetic Operators](#comparison-and-arithmetic-operators)
        * 3.1. [Comparision Exercise](#comparison-exercise)
* 4. [Input and output Control](#input-and-output-control)  
* 5. [Flow Control Loops](#flow-control-loops)
        * 5.1. [For Loop Syntax Example](#for-loop-syntax-example)
        * 5.2. [While Loop Syntax Example](#while-loop-synax-example)
        * 5.3. [Until Loop Syntax Example](#until-loop-syntax-example)
        * 5.4. [For Loop Exercise](#for-loop-exercise)
* 6. [Flow Control Branches](#flow-control-branches)
        * 6.1. [Case Statements](#case-statements)
* 7. [Functions](#functions)
        * 7.1. [Function Syntax Examples](#function-syntax-examples)
        * 7.2. [Parameter Passing](#parameter-passing)
        * 7.3. [Return Codes](#return-codes)
* 8. [Debugging](#debugging)
        * 8.1. [Debugging -x](#debugging-x)
        * 8.2. [Verbose Debugging](#verbose-debugging)

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

## 3. <a name='comparison-and-arithmetic-operators'></a>Comparison and Arithmetic Operators
https://devmanual.gentoo.org/tools-reference/bash/index.html

### 3.1. <a name='comparison-exercise'></a>Comparison Exercise

comparison-exercise.sh
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

## 4. <a name='input-and-output-control'></a>Input and Output Control

https://mywiki.wooledge.org/BashGuide/InputAndOutput

https://www.geeksforgeeks.org/bash-script-read-user-input/

## 5. <a name='flow-control-loops'></a>Flow Control Loops

Branches:
- `If-Else` Conditions
- `Case` Statements

Loops:
- `For` Loops
- `While` Loops
- `Until` Loops

### 5.1. <a name='for-loop-syntax-example'></a>For Loop Syntax Example
https://www.cyberciti.biz/faq/bash-for-loop/

```bash
ip_addresses=(127.0.0.1 10.10.10.182 10.10.10.184)
for ip in $ip_addresses
do
        ping -c 1 $ip
done
```

#### Determine which address range a target is located in:
```bash
# Find Network range
function netw_range {
	for ip in $ip_addresses
	do
		netrange=$(whois $ip | grep "NetRange\|CIDR" | tee -a CIDR.txt)
		cidr=$(whois $ip | grep "CIDR" | awk '{print $2}')
		cidr_ips=$(prips $cidr)
		echo -e "\nNetRange for $ip:"
		echo -e "$netrange"
	done
}
```

### 5.2. <a name='while-loop-syntax-example'></a>While Loop Synax Example
https://www.cyberciti.biz/faq/bash-while-loop/

```bash
#!/bin/bash

count=10

while [ $count -gt 0 ]
do
  ((count--))
  echo "Count: $count"

  if [ $count == 6 ]
  then
    continue
  elif [ $count == 3 ]
  then
    break
  fi
done
```

## 5.3. <a name='until-loop-syntax-example'></a>Until Loop Syntax Example

Continues until the condition is `fals` and then stops when it is `true`.

```bash
#!/bin/bash

count=10

until [ $count -eq 0 ]
do
  ((count--))
  echo "Count: $count"
done
```
## 5.4. <a name='for-loop-exercise'></a>For Loop Exercise

This section of `Hack The Box`, `Introduction to Bash Scripting` is missing some information from the question description.

## The given script 
is an attempt to `decrypt` a `base64`-encoded string using a series of `sed` commands followed by an `OpenSSL` decryption step.
It has a:
1. Decrypt Function:
- The function processes the `hash` variable through a series of `sed` commands.
- It then decodes the processed string from `base64` and attempts to decrypt it using `OpenSSL` and store the value in the `flag` variable.
2. Variables:
- The `var` and `hash` variables are defined.
3. For-loop
- Space for the `for-loop` to complete
- And it also has some hint in the comments. A Base64 Encoding Example.
4. Check if `$salt` is empty
- An `if-else` statement which calls the `decrypt` function and `prints` the value of `$flag` variable `if` `$salt` is not empty. `Else` it stops execution and returns an `exit` code `1`.

## Question

Create a `For` loop that encodes the variable `var` 28 times in `base64`. The number of characters in the 28th hash is the value that must be assigned to the `salt` variable. 

### It is NOT clear what the author wants. 

1. First because we don't know whether or not we should add or count `new-line` characters.
So you first come up with something like this:
```bash
for i in {1..28}
do
    var=$(echo $var | base64)

    if [[ $i -eq 28 ]]
    then
        salt=${#var}
        echo $salt
    fi
done
```
And you print `34070` to the terminal.

2. You probably gonna `echo` `$salt` and think that this is the answer you should assign to the question. But you're wrong. You shouldn't even `echo $salt`. So you may come up with the actual solution at second try but you may gonna mess the whole thing up because of it.

```bash
for i in {1..28}
do
    var=$(echo $var | base64)

    if [[ $i -eq 28 ]]
    then    
	salt=$(echo $var | wc -c)
        echo $salt

    fi
done
```

Prints `34071`. You assign this value as an answer. And it fails even if the solution is correct.

## Mess the whole thing up a little bit
https://forum.hackthebox.com/t/introduction-to-bash-scripting-hack-the-box-academy/243473/17
https://www.reddit.com/r/hackthebox/comments/kz2g15/difficulties_with_introduction_to_bash_scripting/?rdt=51805

```bash
for ((i = 0 ; i < 28 ; i++)); 
do
    var=$(echo -n $var | base64 "-w 0")

    if [[ $i -eq 27 ]]
    then
        salt=$(echo -n $var | wc -c)
        echo $salt
    fi
done
```

At this point when I tried a trillion combinations of `-n`, `-w 0` to guess what the author was thinking I thought it was much simpler to write the whole `Hashcat`, `Wfuzz`, `THC Hydra` or any other friends source code. 

## Final solution:

```bash
for i in {1..28}
do
    var=$(echo $var | base64)

    if [[ $i -eq 28 ]]
    then    
	salt=$(echo $var | wc -c)
    fi
done
```

Then of course I realized that maybe this exercise was designed to be like this so it forces you to research. I shouldn't spoile but hey, these challenges need a bit of updating anyway.

A reminder to myself: 
Don't spend too much time on basic concepts like this.

## 6. <a name='flow-control-branches'></a>Flow Control Branches

[if-else](#conditional-execution) statements we have already discussed.

### 6.1. <a name='case-statements'></a>Case Statements

These are the same as `switch-case` statements in other languages.

### Case Statement Synax Example
https://www.geeksforgeeks.org/bash-scripting-case-statement/

```bash
# Display the available options
echo -e "You can choose from the following options:"
echo -e "\t1) Find the network range for the specified domain."
echo -e "\t2) Ping the hosts that were found."
echo -e "\t3) Perform all checks."
echo -e "\t*) Exit the script.\n"

read -p "Please choose an option: " opt

case $opt in
	"1") network_range ;;
	"2") ping_host ;;
	"3") network_range && ping_host ;;
	"*") exit 0 ;;
esac
```

## 7. <a name='functions'></a>Functions
### 7.1. <a name='function-syntax-examples'></a>Function Syntax Examples
#### Method 1
```bash
function name {
	<commands>
}
```
#### Method 2
```bash
name() {
        <commands>
}
```

### 7.2. <a name='parameter-passing'></a>Parameter Passing
https://www.geeksforgeeks.org/how-to-pass-and-parse-linux-bash-script-arguments-and-parameters/

`$1 - $9 (${n})`, or `$variable` as we have already seen.

An important difference between bash scripts and other programming languages is that all defined variables are always processed `globally` unless otherwise declared by `local`. 

```bash
#!/bin/bash

function print_pars {
	echo $1 $2 $3
}

one="First parameter"
two="Second parameter"
three="Third parameter"

print_pars "$one" "$two" "$three"
```

```
output:

First parameter Second parameter Third parameter
```

To retrieve the value from a function, we can use various methods such as `return`, `echo`, or assigning the result to a variable. 

We can use `$?` to read the `return code`

```bash
#!/bin/bash

function check_args {
    if [ $# -lt 1 ]; then
        echo -e "Num of args: $#"
        return 1
    else
        echo -e "Num of args: $#"
        return 0
    fi
}

# Calling the function with no arguments
check_args
echo -e "Function exit status: $?\n"

# Calling the function with one argument
check_args "argument"
echo -e "Function exit status: $?\n"

# Storing the function's output in a variable
output=$(check_args "argument")

echo -e "Variable content: \n\t$output"
```

```
output:

Num of args: 0 
Function exit status: 1

Num of args: 1
Function exit status: 0

Variable content::
Function exit status: 1
```

### 7.3. <a name='return-codes'></a>Return Codes:
https://www.geeksforgeeks.org/how-to-use-exit-code-to-read-from-terminal-from-script-and-with-logical-operators/

## 8. <a name='debugging'></a>Debugging

Bash allows us to debug our code by using the `-x (xtrace)` and `-v` options.

### 8.1. <a name='debugging-x'></a>Debugging -x

> bash -x for-loop-exercise.sh

```
output: 

+ salt=34071
+ [[ ! -z 34071 ]]
+ decrypt
++ echo VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ sed s/988sn1/83unasa/g
+ MzSaas7k=VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ echo VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ sed s/4d298d/9999/g
+ Mzns7293sk=VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ echo VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ sed s/3i8dqos82/873h4d/g
+ MzSaas7k=VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ echo VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ sed s/4n9Ls/20X/g
+ Mzns7293sk=VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ echo VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ sed s/912oijs01/i7gg/g
[...]
```

### 8.2. <a name='verbose-debugging'></a>Verbose Debugging
(More detailed)

> bash -x for-loop-exercise.sh

```
+ salt=34071

# Check if $salt is empty
if [[ ! -z "$salt" ]]
then
        decrypt
        echo $flag
else
        exit 1
fi
+ [[ ! -z 34071 ]]
+ decrypt
++ echo VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ sed s/988sn1/83unasa/g
+ MzSaas7k=VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ echo VTJGc2RHVmtYMTl2ZnYyNTdUeERVRnBtQWVGNmFWWVUySG1wTXNmRi9rQT0K
++ sed s/4d298d/9999/g
[...]
```

### Finally something interesting was mentioned:

"...we can try to cause errors using different input types and track their handling in the CPU through the assembler, which may provide a way to manipulate the handling of these errors to insert our own code and force the system to execute it."