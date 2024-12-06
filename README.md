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
- ⚠️ You might need to pin mod the processor (when using 8th/9th gen processors on 6th/7th gen boards). [Needed on one to work by my tests] [Reference Link](https://www.techpowerup.com/forums/threads/adventure-running-8-9th-gen-coffee-lake-cpus-on-z170-motherboard-asus-maximus-viii-ranger.284375/)
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

Original reference: https://www.reddit.com/r/Clevo/comments/1ew3iqa/clevo_p_series_dsanke_mod_bios_no_programmer/

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
