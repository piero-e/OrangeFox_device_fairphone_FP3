
<img width="1500" height="500" alt="image" src="https://github.com/user-attachments/assets/53b955ae-b9ae-49f2-854c-fc6e964526cb" />


===================================================================


# orangefox_device_fairphone_FP3  

  
a "Work in Progress" device-tree to build OrangeFox-Recovery for the Fairphone 3  



===================================================================


## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core 1.8 GHz Cortex-A53
CHIPSET | Qualcomm SDM632 Snapdragon 632
GPU     | Adreno 506
Memory  | 4GB
Shipped Android Version | 9.0 (Pie)
Internal Storage | 64GB
microSD | Up to 400GB (dedicated slot)
Battery | 3000 mAh
Dimensions | 158 x 71.8 x 9.89 mm
Display | 2270 x 1080 pixels, 5.65-inch IPS LCD
Rear Camera  | 12 MP (f/1.8, 1/2.55", PDAF)
Front Camera | 8 MP (f/2.0, 1/4", HDR)

.

### Kernel Source
https://github.com/LineageOS/android_kernel_fairphone_sdm632

.

### vendor source
https://github.com/TheMuppets/proprietary_vendor_fairphone_FP3

.

### How to compile
https://wiki.orangefox.tech/en/dev/building

init the repo and sync
```
mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git # (or, using ssh, "git clone git@gitlab.com:OrangeFox/sync.git")
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
```
add your specific device tree
```
# These are example commands
cd ~/fox_12.1 # (or whichever directory hosts the synced manifest)
git clone https://gitlab.com/OrangeFox/device/vendorname/devicename.git device/vendorname/devicename
```
or use my local_manifests



build OrangeFox for your device
```
cd ~/OrangeFox # (or whichever directory has the synced manifest)
  /bin/bash # if your Linux shell isn't bash
  export ALLOW_MISSING_DEPENDENCIES=true
  export FOX_BUILD_DEVICE=<device>
  export LC_ALL="C"

# for all brances
  source build/envsetup.sh

# for the 12.1 branch, if the device has a separate recovery partition
  lunch twrp_<device>-eng && mka adbd recoveryimage

# for the 12.1 branch, with A/B partitioning, and no separate recovery partition
  lunch twrp_<device>-eng && mka adbd bootimage

# for the 12.1 branch, vendor_boot-as-recovery builds [this is highly experimental and unsupported!]
  lunch twrp_<device>-eng && mka adbd vendorbootimage

# for the 14.1 branch, with A/B partitioning, and no separate recovery partition
  lunch twrp_<device>-ap2a-eng && mka adbd bootimage

# for the 14.1 branch, vendor_boot-as-recovery builds [this is highly experimental and unsupported!]
  lunch twrp_<device>-ap2a-eng && mka adbd vendorbootimagee
```

.

### Copyright

```
# Copyright (C) 2013-2019 The OmniROM Project
# Copyright (C) 2019-2025 OrangeFox Recovery Project
# 
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

.

### XDA thread

https://xdaforums.com/t/recovery-wip-orangefox-for-fairphone.4777728/

.

