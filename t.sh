#date time stamp
dts() { date +%Y-%m-%d-%H-%M-%S; }

dmkdir() { local newdir="$@/$(dts)"; mkdir $newdir && echo $newdir; }

newdir="$(dmkdir results)"

echo $newdir
