git reset --hard
stop="n"
ChangeStop()
{
    stop="y"
    break
}
for auah in 20220412/Flata 20220412/RutuF
do
    git checkout $auah
    # git reset --hard HEAD~1
    if [[ "$auah" == "20220412/Flata" ]];then
        git pull . 20220412/main-caf --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main-caf' into ${auah}"
    fi
    git pull . 20220412/main-f2fs --signoff --no-commit || ChangeStop
    git commit -sm "Merge Branch '20220412/main-f2fs' into ${auah}"
    git pull . 20220412/main-upstream --signoff --no-commit || ChangeStop
    git commit -sm "Merge Branch '20220412/main-upstream' into ${auah}"
    git checkout ${auah}+
    # git reset --hard HEAD~1
    git pull . 20220412/main --signoff --no-commit || ChangeStop
    git commit -sm "Merge Branch '20220412/main' into ${auah}+"
    if [[ "$auah" == "20220412/Flata" ]];then
        git pull . 20220412/main-caf --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main-caf' into ${auah}+"
    fi
    git pull . 20220412/main-f2fs --signoff --no-commit || ChangeStop
    git commit -sm "Merge Branch '20220412/main-f2fs' into ${auah}+"
    git pull . 20220412/main-upstream --signoff --no-commit || ChangeStop
    git commit -sm "Merge Branch '20220412/main-upstream' into ${auah}+"
    # for ezAf in ${auah}+-muv ${auah}+-muv-uc ${auah}+-muv-oc ${auah}+-stock ${auah}+-stock-uc ${auah}+-stock-oc ${auah}+-uv ${auah}+-uv-uc ${auah}+-uv-oc
    # do
    #     git checkout "$ezAf"
    #     # git reset --hard HEAD~1
    #     git pull . ${auah}+ --signoff --no-commit || ChangeStop
    #     git commit -sm "Merge branch '${auah}+' into $ezAf"
    # done
done

if [[ "${stop}" == "n" ]];then
    for aelah in 20220412/main-x 20220412/main-y
    do
        git checkout $aelah
        # git reset --hard HEAD~1
        git pull . 20220412/main-uksm --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main-uksm' into ${aelah}"
        git pull . 20220412/main --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main' into ${aelah}"
        git checkout $aelah-up
        # git reset --hard HEAD~1
        git pull . $aelah --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '${aelah}' into ${aelah}-up"
        git pull . 20220412/main-upstream-2 --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main-upstream-2' into ${aelah}-up"
    done
fi

GogoPush(){
    get=${@}
    git push --all $get -f || GogoPush $get
}
if [[ "${stop}" == "n" ]];then
    GogoPush origin
fi
# GogoPush public