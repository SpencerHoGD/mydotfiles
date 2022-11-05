Wishlist:

- show Menmory Used/Total
free -h | awk '/^Mem:/ {print $3 "/" $2}'

- show CPU temp
sensors | awk '/^temp1/ {print $2}'

- Show most memory intensive processes
ps axch -o cmd,%mem --sort=%mem

- Show most CPU intensive processes




