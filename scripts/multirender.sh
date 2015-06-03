filename='bbox'
width='1200'
height='630'
factor='1'
path=$width

mkdir path
while read col1 col2 col3 col4 id
do
    echo "producing $path/$id.png"
    nik4.py -b $col1 $col2 $col3 $col4 --size-px $width $height --factor $factor toner-lite.xml $width/$id.png -v
    echo "optimizing $path/$id.png"
    optipng $path/$id.png
done < $filename