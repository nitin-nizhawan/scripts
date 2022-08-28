# save this file to /etc/bashrc
# install powerline-fonts

get_branch_name(){
wdir=$(pwd)

count=1
while [ $wdir != "/" ] || [ $count -lt 250 ] ; 
do

  if [ -e "$wdir/.git/HEAD" ]; 
  then 
    branch_ref=$(cat $wdir/.git/HEAD)
    echo "${branch_ref##ref: refs/heads/}"
    break
  fi
  count=$((count+1)) 
  wdir="$(dirname "$wdir")"
done

}

endColor="\e[m"
magentaBack="\e[30;45m"
greenBack="\e[30;42m"
magenta="\e[35m"
green="\e[32m"
blue="\e[34m"
blueBack="\e[30;44m"
endChar=$(echo -e "\ue0b0")
branchChar=$(echo -e "\ue0a0")





git_branch_name()
{

branch_name=$(get_branch_name)
# concat current git branch
if [ ${#branch_name} -gt 0 ] ; then
	echo "$magentaBack$endChar$branchChar$branch_name$endColor$magenta$endChar$endColor"
fi
}


set_bash_prompt(){
# user name
PS1="$blueBack$endChar\u$endColor$blue$endChar$endColor"
#concat working dir
PS1="$PS1$greenBack$endChar\W$endColor$green$endChar$endColor"
PS1="$PS1$(git_branch_name) \n\$ "
}

export PROMPT_COMMAND=set_bash_prompt
