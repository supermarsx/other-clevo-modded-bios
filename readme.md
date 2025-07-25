
Skip to content
Navigation Menu
supermarsx
other-clevo-modded-bios

Code
Issues
Pull requests
Actions
Security
Insights

    Settings

    other-clevo-modded-bios

/
in
main

Indent mode
Indent size
Line wrap mode
Editing readme.md file contents
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174


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

Use Control + Shift + m to toggle the tab key moving focus. Alternatively, use esc then tab to move to the next interactive element on the page.
Attach files by dragging & dropping, selecting or pasting them.
Editing other-clevo-modded-bios/readme.md at main · supermarsx/other-clevo-modded-bios
