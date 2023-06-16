git reset --hard
stop="n"
ChangeStop()
{
    stop="y"
}
for auah in 20220412/Flata 20220412/RutuF
do
    [[ "${stop}" == "y" ]] && break
    git checkout $auah
    # git fetch origin $auah && git reset --hard FETCH_HEAD
    if [[ "$auah" == "20220412/Flata" ]];then
        git pull . 20220412/main-caf --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main-caf' into ${auah}"
    fi
    # git pull . 20220412/main-f2fs --signoff --no-commit || ChangeStop
    # git commit -sm "Merge Branch '20220412/main-f2fs' into ${auah}"
    git pull . 20220412/main-upstream --signoff --no-commit || ChangeStop
    git commit -sm "Merge Branch '20220412/main-upstream' into ${auah}"
    [[ "${stop}" == "y" ]] && break
    git checkout ${auah}+
    # git fetch origin ${auah}+ && git reset --hard FETCH_HEAD
    # git reset --hard HEAD~1
    git pull . 20220412/main --signoff --no-commit || ChangeStop
    git commit -sm "Merge Branch '20220412/main' into ${auah}+"
    if [[ "$auah" == "20220412/Flata" ]];then
        git pull . 20220412/main-caf --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main-caf' into ${auah}+"
    fi
    # git pull . 20220412/main-f2fs --signoff --no-commit || ChangeStop
    # git commit -sm "Merge Branch '20220412/main-f2fs' into ${auah}+"
    git pull . 20220412/main-upstream --signoff --no-commit || ChangeStop
    git commit -sm "Merge Branch '20220412/main-upstream' into ${auah}+"
    [[ "${stop}" == "y" ]] && break
    for lcom in 38c09508b4815ff2ee97a99f315495dc7363ef94 ba448e07d23eb1ef050ab465619d3c5e071adaff 9fe470d22e25a2c5b481e3f9f4f8cf5a79b703b7 9b2b7311d1f010e47ecdfeafd8946dae5461d707 5eb71436520dbf5ff3d28b8885605e37a838842e 81aa247026d21162e7cb132fdf2f7c03215144d4 1a040ccc67b42b8f3f559231308cd4f2de80a575 81722bc5649a604a84ebc6b617289241d5056450 62e5911d4997b2fc5637c027e324fb26a7a260ac
    do
        git fetch origin $lcom
    done
    for ezAf in ${auah}+-muv:6852676d0175cf9ae7a2a8649d7da207cd781e62..38c09508b4815ff2ee97a99f315495dc7363ef94 ${auah}+-muv-oc:6852676d0175cf9ae7a2a8649d7da207cd781e62..ba448e07d23eb1ef050ab465619d3c5e071adaff ${auah}+-muv-uc:6852676d0175cf9ae7a2a8649d7da207cd781e62..9fe470d22e25a2c5b481e3f9f4f8cf5a79b703b7 ${auah}+-stock:6852676d0175cf9ae7a2a8649d7da207cd781e62..9b2b7311d1f010e47ecdfeafd8946dae5461d707 ${auah}+-stock-oc:6852676d0175cf9ae7a2a8649d7da207cd781e62..5eb71436520dbf5ff3d28b8885605e37a838842e ${auah}+-stock-uc:6852676d0175cf9ae7a2a8649d7da207cd781e62..81aa247026d21162e7cb132fdf2f7c03215144d4 ${auah}+-uv:6852676d0175cf9ae7a2a8649d7da207cd781e62..1a040ccc67b42b8f3f559231308cd4f2de80a575 ${auah}+-uv-oc:6852676d0175cf9ae7a2a8649d7da207cd781e62..81722bc5649a604a84ebc6b617289241d5056450 ${auah}+-uv-uc:6852676d0175cf9ae7a2a8649d7da207cd781e62..62e5911d4997b2fc5637c027e324fb26a7a260ac
    do
        dbranch="$(echo "$ezAf" | awk -F ':' '{print $1}')"
        commits="$(echo "$ezAf" | awk -F ':' '{print $2}')"
        git checkout ${auah}+
        git branch -D $dbranch
        git checkout -b $dbranch
        git cherry-pick $commits || ChangeStop
        [[ "${stop}" == "y" ]] && break
    done
done

if [[ "${stop}" == "n" ]];then
    for aelah in 20220412/main-x 20220412/main-y
    do
        [[ "${stop}" == "y" ]] && break
        git checkout $aelah
        # git fetch origin ${aelah} && git reset --hard FETCH_HEAD
        # git reset --hard HEAD~1
        git pull . 20220412/main-uksm --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main-uksm' into ${aelah}"
        git pull . 20220412/main --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main' into ${aelah}"
        [[ "${stop}" == "y" ]] && break
        git checkout $aelah-up
        # git fetch origin ${aelah}-up && git reset --hard FETCH_HEAD
        # git reset --hard HEAD~1
        git pull . $aelah --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '${aelah}' into ${aelah}-up"
        git pull . 20220412/main-upstream-2 --signoff --no-commit || ChangeStop
        git commit -sm "Merge Branch '20220412/main-upstream-2' into ${aelah}-up"
        for ezAf in ${aelah}-up-muv:6852676d0175cf9ae7a2a8649d7da207cd781e62..38c09508b4815ff2ee97a99f315495dc7363ef94 ${aelah}-up-muv-oc:6852676d0175cf9ae7a2a8649d7da207cd781e62..ba448e07d23eb1ef050ab465619d3c5e071adaff ${aelah}-up-muv-uc:6852676d0175cf9ae7a2a8649d7da207cd781e62..9fe470d22e25a2c5b481e3f9f4f8cf5a79b703b7 ${aelah}-up-stock:6852676d0175cf9ae7a2a8649d7da207cd781e62..9b2b7311d1f010e47ecdfeafd8946dae5461d707 ${aelah}-up-stock-oc:6852676d0175cf9ae7a2a8649d7da207cd781e62..5eb71436520dbf5ff3d28b8885605e37a838842e ${aelah}-up-stock-uc:6852676d0175cf9ae7a2a8649d7da207cd781e62..81aa247026d21162e7cb132fdf2f7c03215144d4 ${aelah}-up-uv:6852676d0175cf9ae7a2a8649d7da207cd781e62..1a040ccc67b42b8f3f559231308cd4f2de80a575 ${aelah}-up-uv-oc:6852676d0175cf9ae7a2a8649d7da207cd781e62..81722bc5649a604a84ebc6b617289241d5056450 ${aelah}-up-uv-uc:6852676d0175cf9ae7a2a8649d7da207cd781e62..62e5911d4997b2fc5637c027e324fb26a7a260ac
        do
            dbranch="$(echo "$ezAf" | awk -F ':' '{print $1}')"
            commits="$(echo "$ezAf" | awk -F ':' '{print $2}')"
            git checkout $aelah-up
            git branch -D $dbranch
            git checkout -b $dbranch
            git cherry-pick $commits || ChangeStop
            [[ "${stop}" == "y" ]] && break
        done
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