alias new_topic="mkdir ~/fso/$1; cd ~/fso/$1; mkdir ./bin; mkdir ./src;"
alias compile="gcc -o bin/$1 src/$1;"
alias run="bin/$1;"

# Then we load the common aliases
if [ -f ~/.my_configs/common/.bash_aliases ]; then
    . ~/.my_configs/common/.bash_aliases
fi