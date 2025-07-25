# Google translated guide from smx dsanke original post


ORIGINAL LINK: 

[http://www.smxdiy.com/thread-3097-1-1.html](http://www.smxdiy.com/thread-3097-1-1.html)

GOOGLE TRANSLATE LINK: 

[https://www-smxdiy-com.translate.goog/thread-3097-1-1.html?_x_tr_sch=http&_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=pt-PT&_x_tr_pto=wapp](https://www-smxdiy-com.translate.goog/thread-3097-1-1.html?_x_tr_sch=http&_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=pt-PT&_x_tr_pto=wapp)

POST CONTENTS:

This BIOS is only for sharing and communication between players. 
It is strictly prohibited to use it for commercial purposes..

## Disclaimer:

- Flashing BIOS is risky, and improper operation may cause serious problems such as failure to boot.
- Replacing the CPU is risky, and improper operation may cause permanent hardware damage that cannot be repaired.
- BIOS is not 100% compatible with all computers. There is a possibility that the computer may not boot after flashing. It is not recommended to try without a programmer.
- Please read the relevant tutorials carefully and take all the risks yourself. I, the forum and the post bar will not take any responsibility for the failure of flashing BIOS and disassembling the machine.
- Flashing a modified BIOS may cause the risk of losing system activation and serial number, so please think twice before doing so.
- There is a very small possibility that the computer cannot boot after flashing the BIOS normally, but it can be fixed by re-flashing the same file with a programmer. This is normal.
- I do not hold the copyright to the BIOS and the software in it. Please use it legally for research and learning purposes.
- If you have fixed some undiscovered bugs based on this BIOS and made suggestions for improvements, we recommend that you continue to make your work public and share it.
- I hereby declare that I do not provide any guarantee for the use of BIOS, do not guarantee the applicability of this BIOS to any user, and do not guarantee that there will be no problems; nor will I be responsible for any theoretical or actual losses encountered by any user when using this BIOS.
- If you use this BIOS, it means you have accepted this agreement by default.

The BIOS here only supports Z170. It is a modified version of Z370 BIOS transplanted to the Z170 mold.

## The following modifications are made based on Z370:

- Downgrade ME FW to version 11.7.0.1261
- Modify PCH related parameters in BIOS to adapt to Z170
- Downgrade the BIOS built-in RST Dxe Driver/Option ROM to version 15.8.0.3109
- Replace the EC FW built into the BIOS with P775DM3 1.06.06 version
- All the information not mentioned is consistent with the base BIOS (such as supported CPU, graphics card and maximum memory capacity, etc.)


## Base BIOS:

- Clevo P7xx P870 Z370 series revised BIOS

[http://www.smxdiy.com/thread-3090-1-1.html](http://www.smxdiy.com/thread-3090-1-1.html)
- Clevo P7xx P870 Z370 series revised BIOS ②

[http://www.smxdiy.com/thread-3091-1-1.html](http://www.smxdiy.com/thread-3091-1-1.html)

- Compared with Z370, the BIOS here additionally supports 6th/7th generation official version and 7th generation ES CPU

## flashing method:

- It is recommended to flash with a programmer. There are also tutorials for flashing without a programmer in the network disk.
- Note that porting the Z370 BIOS requires a graphics card GOP version that is high enough to light up.
- When the original Z370 BIOS is used for porting, when it is paired with a Pascal architecture graphics card (the common one is the 10 series graphics card 『1060/1070/1080』), it must ensure that the GOP version of the graphics card is not less than 0x30006, otherwise it will not boot normally.
- Unzip the "Flashing tool included, Clevo 10 series MXM graphics card vBIOS collection.7z" provided in the network disk, and you can get the official vBIOS file that has been pre-updated with GOP, the nvflash flashing tool, and the instruction document written by me.
- The document details how to determine the current vBIOS and GOP versions, and what to do when the GOP version is low.
- If the current GOP version is too low, please follow my instructions and flash the vBIOS with pre-updated GOP, or manually update the GOP separately using your favorite method, but if you don't know how to update, then use the file I provide.
- This GOP version is in hexadecimal. If you have flashed the file I gave you, the version should be 0x30012. If your GOP version is not lower than 0x30006, then you don't need to flash the vBIOS file I gave you.
- If you cannot boot up and detect the GOP version, but want to flash the appropriate vBIOS, back it up before flashing it with a programmer, then find the same version of vBIOS as on your graphics card label and flash it (if you have hard-coded G-Sync support, don't judge by the label).
- If the label is lost, you can select the corresponding vBIOS file to flash it according to whether it supports SLI, whether it supports G-Sync, and the model of the graphics card.
- Note that the vBIOS chip of the Pascal graphics card is 1.8v voltage. Please confirm in advance whether your programmer supports it. If not, please add an adapter board or replace a high-end programmer. If you operate directly with 3.3v or 5v, there is a risk of damaging the graphics card, and in severe cases, it will cause the GPU core to burn out.

# Download address:

Link: [https://pan.baidu.com/s/1ZXEB81PAGRSOZibZ4IjRlw](https://pan.baidu.com/s/1ZXEB81PAGRSOZibZ4IjRlw)

Extraction code: xp56

If the ThunderBolt/Type-C interface is invalid, you can try to modify Advanced->Intel(R) Thunderbolt->Thunderbolt(TM) Enumeration Mode->Legacy in the BIOS.

## 2021/06/03 Update:

- A modified version with some ME disabled is provided. The file name has an additional "128G" suffix. On the basis of the modifications mentioned above, by disabling ME, additional support is provided for Xeon and BGA1440 CPUs with rotating pins, and a maximum of 128G memory is supported.
- Due to their own limitations (including native and rotating pins, the reason is that the IMC is locked or the signal quality of the adapter board is poor), some CPUs cannot use high frequencies or large-capacity memory. This is not a BIOS problem, so please do not report it here.
- Problems when using the CPU with a transfer pin, including but not limited to PCIE not being recognized, PCIE speed reduction, low memory frequency, single memory channel, unusable core display eDP/VGA, etc., are not related to this BIOS. Do not seek solutions on the BIOS. These are all hardware problems of the transfer board.
- After ME is disabled, functions that rely on ME cannot be used (including but not limited to HDCP, Intel TXT, Intel SGX, Hackintosh core display sleep wakeup, external frequency adjustment when there is no external clock generator, etc.). I cannot solve these bugs, and please do not report them.
- When using 128GB of memory, there may be an error prompt of PciOutOfResource when booting up. You can press Esc to exit and then boot normally. There is no solution yet.
