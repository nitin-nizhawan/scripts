# save this file to /etc/bashrc
# install powerline-fonts

endColor="\e[m"
greenBack="\e[30;42m"
green="\e[32m"
blue="\e[34m"
blueBack="\e[30;44m"
endChar=$(echo -e "\ue0b0")
export PS1="$blueBack$endChar\u$endColor$blue$endChar$endColor$greenBack$endChar\W$endColor$green$endChar$endColor \n\$ "

