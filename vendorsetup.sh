for device in $(curl -s https://raw.githubusercontent.com/pearlos/platform_vendor_pearl/pie/pearl.devices | sed -e 's/#.*$//' | awk '{printf "pearl_%s-%s\n", $1, $2}')
do
add_lunch_combo $device
done
