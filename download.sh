function completed(){
    echo Status: Completed > ../info.txt
    mv * ../output
}

function failed(){
    echo Status: Failed > ../info.txt
    touch ../output/failed
}
cd download

aria2c $1 -x 16

if [ "$?" -eq "0" ]
then
    completed
else
    failed
fi

cd ..
echo File name: $(ls output) >> info.txt
