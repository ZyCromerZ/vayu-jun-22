for auah in 20220412/Flata 20220412/RutuF
do
    git checkout $auah
    if [[ "$auah" == "20220412/Flata" ]];then
        git pull . 20220412/main-caf --signoff || break
    fi
    git pull . 20220412/main-f2fs --signoff || break
    git pull . 20220412/main-upstream --signoff || break
    git checkout ${auah}+
    git pull . 20220412/main --signoff || break
    if [[ "$auah" == "20220412/Flata" ]];then
        git pull . 20220412/main-caf --signoff || break
    fi
    git pull . 20220412/main-f2fs --signoff || break
    git pull . 20220412/main-upstream --signoff || break
    for ezAf in ${auah}+-muv ${auah}+-muv-uc ${auah}+-muv-oc ${auah}+-stock ${auah}+-stock-uc ${auah}+-stock-oc ${auah}+-uv ${auah}+-uv-uc ${auah}+-uv-oc
    do
        git checkout "$ezAf"
        git pull . ${auah}+ --signoff || break
    done
done