filename="Data.txt"

if [ -f "$filename" ]
then
	echo "file exists"
else
	echo "file doesn't exists"
fi
