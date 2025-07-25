# other-clevo-modded-bios

Clevo modded/unlocked BIOS mirror collection by dsanke

- ✅ Use up to 9900KS processor.
- ✅ BIOS fully unlocked.
- ⚠️ Have a **chip flasher** handy like a rpi with clip!
- ⚠️ You **should only flash this using spi programmer** meaning clip!
- ⚠️ Guides are provided as is!
- ⚠️ You may **brick** or **short your board** if done incorrectly! (..if you don't know what you're doing, just be careful)
- ⚠️ **You're on your own**.
- ⚠️ Make sure you're flashing the **right chip**! Don't flash other controllers and stuff..
- ⚠️ Make sure the **clip** is in the **right position**! Position 1 is usually marked with a small ball.
- ⚠️ You might need to pin mod the processor (when using 8th/9th gen processors on 6th/7th gen boards). [Needed on one to work by my tests] [Reference Link](https://www.techpowerup.com/forums/threads/adventure-running-8-9th-gen-coffee-lake-cpus-on-z170-motherboard-asus-maximus-viii-ranger.284375/) [Archive.ph mirror link](https://archive.ph/MCi5O)
- ⚠️ You might be able to upgrade from GTX 10 series to RTX 20 series based on this thread. [Reference Link](https://linustechtips.com/topic/1610000-chipped-corner-on-mobile-rtx-2080-mxm/), citing `Danmaq`, "i installed a Dsanke bios mod and now the GPU seems to work. it managed to get into windows but i still have to do more testing until i get the proper cooler."
- 🤓 You **SHOULD read** the whole readme and some threads before proceeding with anything.
- 🪞 Not the maker, just a mirror.

[[Download this repository]](https://codeload.github.com/supermarsx/other-clevo-modded-bios/zip/refs/heads/main)


[**[Go to flash guide using Raspberry Pi and clip >>]**](#flash-guide-using-raspberry-pi-and-clip)

[**[Go to flash guide using USB drive >>]**](#flash-guide-using-usb-drive)

## Supported Clevo models

- N9xKP [[0506]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/N9xKP-0506.7z) [[0712]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/N9xKP-0712.7z)
- N9xTP [[0506]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/N9xTP-0506.7z) [[0712]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/N9xTP-0712.7z) 
- P7xxDMx [[0511-9900KS]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P7xxDMx-0511-9900KS.7z) [[0729-9900KS]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P7xxDMx-0729-9900KS.7z) [[0729-TBT-Legacy]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P7xxDMx-0729-TBT-Legacy.7z) 
- P7xxTM1 [[0511-9900KS]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P7xxTM1-0511-9900KS.7z) [[0729-9900KS]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P7xxTM1-0729-9900KS.7z)
- P870KM [[0511-9900KS]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P870KM-0511-9900KS.7z) [[0716-9900KS]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P870KM-0716-9900KS.7z)
- P870TM [[0511-9900KS]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P870TM-0511-9900KS.7z) [[0716-9900KS]](https://raw.githubusercontent.com/supermarsx/other-clevo-modded-bios/main/P870TM-0716-9900KS.7z)

## Things you might want to read before proceeding

### Thread on notebooktalk about flashing

Original link: [https://notebooktalk.net/topic/2302-help-w-flashing-dsanke-bios-for-p775-dm3/](https://notebooktalk.net/topic/2302-help-w-flashing-dsanke-bios-for-p775-dm3/)

Archive.ph mirror link: [https://archive.ph/QQeMq](https://archive.ph/QQeMq)

Thread citation, `taiyang` wrote: 

> Posted August 15, 2024
> Well. That 0729 BIOS from Dsanke was migrated from TM machine with Z370. To flash it using fpt in OS on a DM machine with Z170, you need to
>
> 1. flash without your battery using only the power cord, and
> 2. unplug the power cord after the flashing. DO NOT restart with power.
> 3. connect the battery and power cord back and boot the machine.
>
> According to Dsanke, this is an issue with different BIOS structures. In Z170, it is "3MB Flash Descriptor + ME Region" and "5MB BIOS Region", while in Z370, it is "2MB Flash Descriptor + ME Region" and "6MB BIOS Region". If the system reboots or turns off with power, the NVRAM part in the BIOS will be messed up. Dsanke has a very detailed "readme" in Chinese about how to flash this BIOS, which the repository on GitHub doesn't have. For reference,
>
> http://www.smxdiy.com/thread-3097-1-1.html
>
> I confirmed this last week (in a hard way). Flash it with a ch341a programmer, or flash it in OS and then cut the power.😉

Google translated original post: [smx-dsanke-guide-gt.md](https://github.com/supermarsx/other-clevo-modded-bios/blob/main/smx-dsanke-guide-gt.md)

### Reddit thread about the 9900ks

Original post link: [https://www.reddit.com/r/Clevo/comments/10lefie/trying_to_upgrade_p775tm1g_to_9900ks_but_cant_boot/](https://www.reddit.com/r/Clevo/comments/10lefie/trying_to_upgrade_p775tm1g_to_9900ks_but_cant_boot/)

Archive.ph mirror link: [https://archive.ph/X0n3E](https://archive.ph/X0n3E)

### Linus Tech Tips thread about upgrading from GTX 10 series to RTX 20 series

Original post link: [https://linustechtips.com/topic/1610000-chipped-corner-on-mobile-rtx-2080-mxm/](https://linustechtips.com/topic/1610000-chipped-corner-on-mobile-rtx-2080-mxm/)

Archive.ph mirror link: [https://archive.ph/xVQMj](https://archive.ph/xVQMj)

### Older P751DM2 Stock BIOS Obsidian-PC branded

[https://github.com/supermarsx/other-p751dm2-bios-565352sio](https://github.com/supermarsx/other-p751dm2-bios-565352sio)

### Ukranian Overclockers thread about flashing

Original post link: [https://forum.overclockers.ua/viewtopic.php?t=60195&start=3880](https://forum.overclockers.ua/viewtopic.php?t=60195&start=3880)

Archive.ph mirror link: [https://archive.ph/bNPMY](https://archive.ph/bNPMY)


## Flash guide using Raspberry Pi and clip

```Note: This is a rectified generated guide for reference```

### Tools and Materials Required

Hardware:
- Raspberry Pi (any model with GPIO pins)
- SOIC/pomona clip (compatible with your EEPROM)
- Connecting wires or a breadboard
- Optional, Resistors (for pull-ups if needed, 4.7kΩ is common)

Software:
- Raspbian OS (or similar Linux distribution)
- flashrom (for SPI-based EEPROMs)

### Step 1: Prepare the Raspberry Pi
- Install the OS:
- Flash Raspberry Pi OS onto an SD card.
- Boot up the RPi and configure it using sudo raspi-config.
- Enable Interfaces, go to Interface Options in raspi-config and enable SPI (for SPI EEPROMs) 
- Update the System, `sudo apt update && sudo apt upgrade -y`
- Install Required Tools, `sudo apt install flashrom python3 python3-pip -y`

### Step 2: Wiring the SOIC Clip

- Pin Mapping, match the SOIC clip pins to the EEPROM pins (refer to the datasheet for pinout).
- Connect to Raspberry Pi: For SPI (e.g., 25 series):
  - MISO → Pin 21 (GPIO 9);
  - MOSI → Pin 19 (GPIO 10)
  - CLK → Pin 23 (GPIO 11)
  - CS → Pin 24 (GPIO 8)
  - GND → Pin 6
  - VCC → Pin 1 (3.3V)
- Double-Check Connections, ensure the SOIC clip aligns correctly with the chip pins.

### Step 3: Test the Connection

- For SPI EEPROMs, use `flashrom` to detect the chip `sudo flashrom -p linux_spi:dev=/dev/spidev0.0`
- If detected, note the chip model.

### Step 4: Backup the EEPROM

- For SPI EEPROMs, `sudo flashrom -p linux_spi:dev=/dev/spidev0.0 -r backup_rom.bin`, this reads the EEPROM contents into backup.bin.

### Step 5: Flash New Firmware

- For SPI EEPROMs, `sudo flashrom -p linux_spi:dev=/dev/spidev0.0 -w new_rom.bin`

### Step 6: Verify the Flashing

- Read the EEPROM Again, Dump the EEPROM content after writing, `sudo flashrom -p linux_spi:dev=/dev/spidev0.0 -r flashed_rom.bin`
- Compare the new dump with the original firmware, use diff to verify `diff flashed_rom.bin new_rom.bin`
- If no differences are found, flashing is successful.

### Step 7: Clean Up

- Disconnect the SOIC clip.
- Restore any configurations on the Raspberry Pi.
- Safely store backups of the original firmware.

## Flash guide using USB drive

```Didn't use this guide, just providing for reference. Thanks to reddit user LenoVW_Nut```

Original reference: [https://www.reddit.com/r/Clevo/comments/1ew3iqa/clevo_p_series_dsanke_mod_bios_no_programmer/](https://www.reddit.com/r/Clevo/comments/1ew3iqa/clevo_p_series_dsanke_mod_bios_no_programmer/)

Archive.ph mirror link: [https://archive.ph/kUPhX](https://archive.ph/kUPhX)

### Instructions
Flash the USB method as listed below: 

0) TAKE OUT THE BATTERY FROM YOUR LAPTOP!
1) Plug in your charger, enter the BIOS, change 2 values.
   a) Setup->Boot->UEFI Settings->UEFI Boot->Enabled
   b) Setup->Security->Secure Boot->Disabled (If you can not find this then you don't need to change it)
2) Unplug all your drives including any SSD's and HDD's
3) Put the EFI folder into your FAT32 formatted USB Flash Disk, now put the bios file into the EFI->Boot folder and boot your laptop through the USB.
4) Wait for startup.nsh to execute, and then type "meset", press enter.
5) Your laptop will auto reboot and the fan will run at high speed, THIS IS NORMAL, boot to the USB Flash Disk again.
6) Wait for startup.nsh to execute, and then type "`fpt -d backup.bin`", press enter to backup your bios.
7) Now type "`fpt -f BIOS.bin -rewrite -y`", press enter to flash new the cannon lake bios .
8) Wait for the flash to finish (you will see color text "(...) successful (...)" info printed on screen by fpt).
9) Just unplug power cord, without battery it will hard shut off computer.
10) Then insert battery again, plug in charger
11) Turn computer on.

### Notes:
1) After executing step 4 (MESET) and the fans ramp up you may have to wait a couple minutes for the screen to come back. don't freak out, just give it some time.
2) Also after it finishes flashing (step 8) the first boot might take 5 minutes (probably not the whole 5 minutes, but leave it and let it train the memory? Not sure what it's doing, but 9/10 times it works great, if you leave it booting). Anything over 15 minutes maybe try a single stick of 2133 or 2400 ram and see if it will boot that way. 
3) If something goes wrong you can opt to flash with rpi and a clip anyway
4) No warranties, support or anything is included in this.
