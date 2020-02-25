
origin="assets-internal-accessoticketing/htmlTicket/"
destinationMainFolder="assets-internal-accessoticketing/assets/"
destinationSubFolder="images/"
count=0
for path in $(aws s3 ls $origin);
do
  if [[ "$path" == *\/* ]]; then
    copyFolder=${path%/}
    destination="$destinationMainFolder$path$destinationSubFolder"   
    aws s3 cp "s3://$origin$path" "s3://$destination" --recursive 
  fi
done
