alias new_topic="mkdir ~/fso/$1; cd ~/fso/$1; mkdir ./bin; mkdir ./src;"
alias compile="gcc -o bin/$1 src/$1;"
alias run="bin/$1;"

# Then we load the common aliases
source ~/.my_configs/common/.common_aliases