for device in $(cat $(gettop)/vendor/pearl/pearl.devices | sed -e 's/#.*$//' | awk '{printf "pearl_%s-userdebug\n", $1}'); do
    add_lunch_combo $device;
done;
