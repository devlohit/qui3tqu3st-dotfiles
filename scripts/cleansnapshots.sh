echo "--- BTRFS SNAPPER SNAPSHOT CLEANING ---"

TOTAL=$(sudo snapper list | awk 'NR>2 && $1!=0' | wc -l)
echo "--- CURRENT SNAPSHOT COUNT : $TOTAL ---"

KEEP=4
if [ $TOTAL -gt $KEEP ]; then
  DELETE_COUNT=$((TOTAL - KEEP))
  FIRST=$(sudo snapper list | awk 'NR>2 && $1!=0 {print $1}' | head -n 1)
  LAST=$((FIRST + DELETE_COUNT - 1))

  echo "--- DELETING SNAPSHOTS $FIRST TO $LAST ---"
  sudo snapper delete $FIRST-$LAST
  echo "--- SNAPSHOT COUNT NOW: $(sudo snapper list | awk 'NR>2 && $1!=0' | wc -l) ---"
  echo "--- OPERATION COMPLETE ---"
fi

echo "--- RECONFIGUTING GRUB ---"
sudo grub-mkconfig -o /boot/grub/grub.cfg
