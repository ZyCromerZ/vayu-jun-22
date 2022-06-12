git reset --hard
for auah in 20220412/Flata 20220412/RutuF
do
    git checkout $auah
    # git reset --hard HEAD~1
    if [[ "$auah" == "20220412/Flata" ]];then
        git pull . 20220412/main-caf --signoff --no-commit || break
        git commit -sm "Merge Branch '${auah}' into 20220412/main-caf"
    fi
    git pull . 20220412/main-f2fs --signoff --no-commit || break
    git commit -sm "Merge Branch '${auah}' into 20220412/main-f2fs"
    git pull . 20220412/main-upstream --signoff --no-commit || break
    git commit -sm "Merge Branch '${auah}' into 20220412/main-upstream"
    git checkout ${auah}+
    # git reset --hard HEAD~1
    git pull . 20220412/main --signoff --no-commit || break
    git commit -sm "Merge Branch '${auah}+' into 20220412/main"
    if [[ "$auah" == "20220412/Flata" ]];then
        git pull . 20220412/main-caf --signoff --no-commit || break
        git commit -sm "Merge Branch '${auah}+' into 20220412/main-caf"
    fi
    git pull . 20220412/main-f2fs --signoff --no-commit || break
    git commit -sm "Merge Branch '${auah}+' into 20220412/main-f2fs"
    git pull . 20220412/main-upstream --signoff --no-commit || break
    git commit -sm "Merge Branch '${auah}+' into 20220412/main-upstream"
    for ezAf in ${auah}+-muv ${auah}+-muv-uc ${auah}+-muv-oc ${auah}+-stock ${auah}+-stock-uc ${auah}+-stock-oc ${auah}+-uv ${auah}+-uv-uc ${auah}+-uv-oc
    do
        git checkout "$ezAf"
        # git reset --hard HEAD~1
        git pull . ${auah}+ --signoff --no-commit || break
        git commit -sm "Merge branch '${auah}+' into $ezAf"
    done
done

GogoPush(){
    git push --all origin -f || GogoPush
}
GogoPush