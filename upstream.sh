for asu in 20210824/neutrino-phantasm-254-A 20210824/neutrino-phantasm-254-B
do
    git checkout $asu
    git pull . 20210824/neutrino-phantasm-254 --signoff || break
    git pull . 20210824/neutrino-phantasm-254-upstream --signoff || break
    [[ "$asu" == "20210824/neutrino-phantasm-254-A" ]] && git pull . 20210824/neutrino-phantasm-254-upstream-caf --signoff || break
    git checkout ${asu}-muv && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
    git checkout ${asu}-muv-oc && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
    git checkout ${asu}-muv-uc && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
    git checkout ${asu}-stock && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
    git checkout ${asu}-stock-oc && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
    git checkout ${asu}-stock-uc && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
    git checkout ${asu}-uv && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
    git checkout ${asu}-uv-oc && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
    git checkout ${asu}-uv-uc && git reset --hard HEAD~1 && git pull . $asu --no-commit && git commit -sm "Merge latest changes from $asu"
done
git checkout 20210824/neutrino-phantasm-254