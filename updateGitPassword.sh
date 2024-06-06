directory="directory"
oldPassword="oldPassword"
newPassword="newPassword"

echo "Updating git passwords in the folder:"
echo $directory

if [ ! -d "$directory" ]; then
  exit 1
fi

for d in $directory
do
  if [ -d "$d" ]
  then
    for dir in $d/*   #Per ogni sottocartella
      do
        echo "Processing folder ${dir}"
        cd ${dir}/.git
        echo "Previous url: "
        cat config | grep url
        sed -i '' 's/'${oldPassword}'/'${newPassword}'/g' ${dir}/.git/config
        echo "New url: "
        cat config | grep url
      done
  else                
    echo "Processing file $d"
  fi
done