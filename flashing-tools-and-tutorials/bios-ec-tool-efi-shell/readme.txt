Disclaimer: 
flashing BIOS is risky, improper operation may cause serious problems such as failure to boot.
	Changing CPU is risky, improper operation may cause permanent hardware damage that can not be repaired.
	BIOS is not 100% compatible with all computers, there is a possibility that the computer will not boot up after flashing, it is not recommended to try it without a programmer.
	Please read the tutorials carefully and at your own risk, I and the posters and forums do not take any responsibility for the failure of flashing the BIOS or dismantling the computer.
	There is a risk of losing system activation and serial number by flashing a modified BIOS, so please think twice before doing so.
	There is a very small chance that after flashing the BIOS in normal operation, you may not be able to boot up your computer, but it is normal to use the programmer to re-flash the same file and it will be fine.
	I don't own the copyright of BIOS and its software, please use it legally for research and study purpose.
	If you have fixed some bugs based on this BIOS, and have suggestions for improvement, please continue to publicize and share the results of your work.
	I hereby disclaim any warranty for the use of the BIOS, the suitability of the BIOS for any user, and the absence of any warranty of freedom from malfunction, and shall not be liable to any user for any theoretical or actual damages arising from the use of the BIOS.
	By using this BIOS, you are accepting this agreement by default.

Note: 
Updating the BIOS is risky, please do not turn off the power or reboot the computer during the update process, otherwise the update will fail.
	After the BIOS update, the PIN code of the system may be invalid. Bitlocker and other functions that rely on TPM may also be invalid, and there is a risk of data loss.
	Please make sure you have the right model, you can judge by the video card (onboard or MXM), CPU socket is LGA1151 or not, chipset (use the latest version of CPU-Z to check in the "motherboard" page), and other information, 
Please make sure to plug in the AC power supply at all times when you are operating.
	If the model is wrong, it will lead to serious problems including but not limited to failure to boot.
	Please be sure to read all the content below before starting the operation, don't read one step and do one step.

0. Frequently Asked Questions: 
What is MSDM: 
MSDM table is a piece of data in the BIOS, record the serial number of your computer pre-installed genuine Windows, if you lose the computer may lose the genuine system, lost can not be recovered.
	What will happen if you don't deal with the MSDM table: Windows may become inactive and nothing may happen because some computers don't have the MSDM table.

	Which part do I need to flush in:
		0. The complete BIOS is divided into three parts, Flash Descriptor/ME Region/BIOS Region, and you can choose which part to flush when you do it.
		1. The NIC loss problem is caused by incorrect parameters in the Flash Descriptor/ME Region.
		2. Higher versions of ME will reject 8th/9th generation CPUs to boot on old PCH(100/200 series), while lower versions of ME will reject 6th/7th generation CPUs to boot on new PCH(300 series), which will be manifested by the power light being on for a while and then powering off immediately.
		3. If the parameter in Flash Descriptor is not modified, it can't light up the CPU of U0/P0/R0 step of 8/9 generation, which is shown as power off immediately after the power light is on. 
To sum up, when you brush in the BIOS provided by me, please brush in the whole BIOS, and when you do DIY by yourself, you can just brush in the part you modified. 
If you have brushed in the BIOS of me before, and can't start up the system after you change CPU, please do it again in full. If you have flashed my BIOS before and can't boot up after changing CPU, you should flash it again. 
The BIOSes I provide here are all full BIOSes with ME and Flash Descriptor, and can be flashed directly with a programmer.

1. Preparation: 
will be unzipped, get the EFI folder, and then you want to brush the BIOS file renamed BIOS.BIN (other names can be, they know on the line, for the sake of convenience, do not take the space and Chinese, the following command in the BIOS.BIN their discretion to replace the EC is the same) into the EFI \BOOT folder 
blue sky models, you want to brush the Main EC file renamed EC.BIN, 2nd EC file renamed EC2.BIN (many models do not have 2nd EC, normal) into the EFI\BOOT folder, do not want to brush the EC, do not put 
Copy the EFI folder to the root directory of a FAT32 partition, make sure that you can boot from the FAT32 partition in UEFI mode.

	Go to BIOS and change the following options and save them, if you can't find them, don't change them, if you can find them, change them according to the requirements 
Changing the boot method may lead to not being able to boot the current system, e.g., the current system is booting in Legacy mode 
Changing the boot method may lead to not being able to illuminate the screen, e.g., the graphics card doesn't support UEFI (in this case, it is recommended that you use the programmer to brush the BIOS directly) 
Make sure that you have a means to recover the normalcy from the above situation, otherwise, it will not be possible to recover from the above situation. Please make sure you have the means to recover from the above situation, otherwise do not continue 
One of the two options: 
BIOS main interface->Boot at the top->UEFI Settings->UEFI Boot->Enabled 
BIOS main interface->Boot at the top->Boot mode select->UEFI 
Three of the three options, or none: 
BIOS main interface->Top Security->Secure Boot->Disabled 
BIOS main interface->Top Security->Secure Boot->Attempt Secure Boot->Disabled 
BIOS main interface->Top Security->Secure Boot menu->Secure Boot->Disabled Secure Boot->Disabled 
Microelectronics choose one, Blue Sky does not: 
BIOS main interface->Top Advanced->PCH-IO Configuration->BIOS Security Configuration->BIOS Lock->Disabled 
BIOS main interface->Top Advanced->PCH-IO Configuration->BIOS Lock->Disabled BIOS main interface->top Advanced->PCH-IO Configuration->Security Configuration->BIOS Lock->Disabled

	After booting from the above FAT32 partition, you will see the following prompt 
Press ESC in 5 seconds to skip startup.nsh, any other key to continue. 
and 5 is counting down, at this time you can press any key to continue, or wait until the end of the readout to continue automatically, both are fine, but you can't press ESC to skip 
Next you can see the yellow color “PCHIO Configuration”, “PCHIO Configuration”, “Security Configuration”, “BIOS Lock->Disabled”. You can see the yellow "Shell> _", which means that you have successfully booted into the EFI Shell 
All the following commands are case insensitive 
Observe the line similar to "fs1:\EFI\BOOT\startup.nsh> ver" in the screen, and memorize the content before the first "\" (backslash), for example, "fs1:" 
Execute the content that you memorized in the previous step, for example, "fs1:". For example, "fs1:", "Shell> _" should change to "fs1:\> _" (actually what you got in the previous step, it will show the corresponding content, the same below) 
Then execute "cd efi\boot", "fs1:\> _" should change to "fs1:\EFI\BOOT\> _" 
At this point, the preparations are complete!

2. Operation introduction: 
Unlock Flash Descriptor read/write restriction on Flash Descriptor and ME Region settings 
MICROALLIAN execute OPEN, BLUE SKY execute MESET, after the execution of the general will be automatically rebooted, if there is no automatic reboot, please press the boot key to manually shut down the computer, and wait for 3 seconds before pressing the boot key to boot 
Therefore, the operation will only take effect for a boot, if you reboot again, it will be effective for one time, and the operation will be effective for another time. If you reboot again, it will be restored automatically, so please follow the above to boot from FAT32 partition.

2. Operation introduction: 
Unlock Flash Descriptor within the Flash Descriptor and ME Region settings of the read and write restrictions 
Micro Alliance implementation of open, blue sky implementation of meset, after the implementation of the general will be automatically restarted, if not automatically restarted, please long press the boot button to manually shut down the computer, and so on for 3 seconds, and then press the boot button to start 
Therefore, the operation will only take effect for a boot, if reboot, it will automatically restore, so please follow the above from the FAT32 partition boot, to perform the subsequent backup and write operations If you directly into the Windows reboot this time, it will be automatically recovered. If you reboot again, it will be restored automatically, so please follow the above to boot from the FAT32 partition to perform the subsequent backup and write operations 
If you reboot this time directly into the Windows system, then you reboot to the EFI Shell environment, it is still not unlocked the state of the 
This time, the reboot may be slower, it is a normal phenomenon, please wait patiently 
The fan of the Blue Sky model may run at full speed, it is normal. The fan of the Blue Sky model may run at full speed, which is normal, and it will be restored after reboot. 
There are 3 cases of this restriction on ME Region, which are as follows:
	1.ME Region can not read or write
	2.ME Region can read and cannot write
	3.ME Region can read and write 
There are 2 cases for Flash Descriptor:
	1.Flash Descriptor readable and unwritable
	2.Flash Descriptor can be read and written 
So, you can follow the instructions below, read and then write to the same file to confirm the existence of write protection 
If there is no error, i.e., there is no write protection, then there is no need for this step.

Backup the current Flash Descriptor 
fpt -desc -d bak_desc.bin 
will backup the Flash Descriptor in bak_desc.bin file, you can fill in the file name by yourself, don't include space.

Backup current ME Region 
fpt -me -d bak_me.bin 
will backup ME Region in bak_me.bin file, the file name can be filled in by yourself without spaces.

Backup current BIOS Region 
fpt -bios -d bak_bios.bin 
will backup the BIOS Region in bak_bios.bin file, the file name can be filled in by yourself without spaces.

Backup the current full BIOS (including all Regions) 
fpt -d bak_full.bin 
will backup the full BIOS in bak_full.bin file, the file name can be filled in by yourself without spaces 
This full BIOS can be flashed by programmer directly.

Note, if there is a file with the same name, fpt will ask you whether to overwrite it or not, please be careful with it.

Write Flash Descriptor 
fpt -desc -f BIOS.BIN -rewrite -y 
will write the Flash Descriptor in BIOS.BIN to the device.

Write ME Region 
fpt -me -f BIOS.BIN -rewrite -y 
will write ME Region in BIOS.BIN to the chassis.

Write BIOS Region 
fpt -bios -f BIOS.BIN -rewrite -y 
will write the BIOS Region in BIOS.BIN to the chassis.

Write full BIOS (including all regions) 
fpt -f BIOS.BIN -rewrite -y 
will write the whole BIOS.BIN to the chassis.

Note, if the BIOS.BIN you put in is incomplete, e.g. only the BIOS Region is included, please don't write other Regions. 
If you write the BIOS Region as the full BIOS, you will not be able to boot the machine.

Backup MSDM table 
gmsdmx64 
Please do this before flashing the new BIOS, it will save the MSDM table in the msdm.bin file 
If you are prompted "Search MSDM Table...", please do not write the MSDM table to other regions. . If "Search MSDM Table... Not Found" is prompted, it means that the MSDM table is not included in the current BIOS, so there is no need to recover it.

Recover MSDM Table 
oaidefix64 msdm.bin /oa 
Please do this after flashing a new BIOS and rebooting, it will write the MSDM table in msdm.bin file to the BIOS.

Blue Sky flashing Main EC 
uEcFlash EC.BIN /AD /F2 
to update the firmware of Main EC with EC.BIN.

Blue Sky flashing 2nd EC 
uEcFlash EC2.BIN /AD /O2 
to update the firmware of 2nd EC with EC2.BIN.

3. Troubleshooting: 
FPT prompts Error 368 
BIOS Lock is not disabled.

	FPT prompts Error 451 
The read/write restrictions in the Flash Descriptor have not been lifted.

	FPT prompts yellow "GbE Region does not exist." 
is normal, because the quasi-system BIOS originally does not have "GbE Region", ignore it!


4. Operation steps:
	1. Prepare to brush the BIOS file, to determine whether the BIOS file is complete
	2. Make preparations to ensure that you have the ability to deal with a variety of emergency situations
	3. According to their own needs to determine what needs to be written into the Region, the first backup, and then brush, if you are not sure what you need to brush all of them!
	4. After the operation is completed, reboot according to your favorite method, after reboot and boot, modify the options in the BIOS as required
	5.EC brush when you want, no order, follow the prompts to operate can be

5.Special Notes 
Blue Sky's Z170 motherboard, the official BIOS structure is Flash Descriptor + ME Region = 3MB, BIOS Region = 5MB 
and Blue Sky's Z370 motherboard, the official BIOS structure is Flash Descriptor + ME Region = 2MB, BIOS Region = 6MB. Region = 6MB 
When flashing the BIOS ported from the Z370 to the Z170 (or flashing back), you can't flash a region alone, you must flash the whole thing, and after flashing, you can't shut down or reboot, you must force the power to go off. 
That is, you don't connect the main battery during the operation, but only the AC power supply, and after the operation is finished, you directly disconnect the AC power supply. 
The reason is that, during a normal shutdown or reboot, the NVRAM in the BIOS will not be able to be used in a normal way. The reason is that, during normal shutdown or reboot, the NVRAM part of the BIOS will be written, because we have flashed a new BIOS, the storage area of this part has been changed 
But when writing, it will still be written according to the original area, and the content stored in the original area is no longer NVRAM, after being overwritten, the BIOS content will be corrupted, and cannot be booted up. 
At this time, you can only use the programmer to recover, if you want to be safe, we recommend that you use a programmer to recover the contents of the BIOS directly in this case. Programmer
