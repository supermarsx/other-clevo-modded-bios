Disclaimer: 
flashing BIOS is risky, improper operation may cause serious problems such as failure to boot.
	Changing CPU is risky, improper operation may cause permanent hardware damage that can not be repaired.
	BIOS is not 100% compatible with all computers, there is a possibility that the computer will not boot up after flashing, it is not recommended to try it without a programmer.
	Please read the tutorials carefully and at your own risk, I and the posters and forums do not take any responsibility for the failure of flashing the BIOS or dismantling the computer.
	There is a risk of losing system activation and serial number by flashing a modified BIOS, so please think twice before doing so.
	There is a very small chance that after flashing the BIOS in normal operation, you may not be able to boot up your computer, but it is normal to use the programmer to re-flash the same file and it will be fine.
	I don't own the copyright of BIOS and its software, please use it legally for research and study purpose.
	If you have fixed some bugs based on this BIOS, and have suggestions for improvement, please continue to publicize and share the results of your work.
	I hereby disclaim any warranty for the use of the BIOS, and I do not warrant that the BIOS will be suitable for any user, that it will be trouble-free, or that it will be liable for any theoretical or practical damages that may be incurred by any user as a result of using the BIOS.
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
The MSDM table is a piece of data in the BIOS that records the serial number of your computer's pre-installed version of Windows, and if it is lost, the computer may lose the original system, which cannot be recovered after it is lost.
	What will happen if you don't deal with the MSDM table: Windows may become inactive and nothing may happen because some computers don't have the MSDM table.

	Which part do I need to flush in:
		0. The complete BIOS is divided into three parts, Flash Descriptor/ME Region/BIOS Region, and you can choose which part to flush when you do it.
		1. The NIC loss problem is caused by incorrect parameters in the Flash Descriptor/ME Region.
		2. Higher versions of ME will reject 8th/9th generation CPUs to boot on old PCH(100/200 series), while lower versions of ME will reject 6th/7th generation CPUs to boot on new PCH(300 series), which will be manifested by the power light being on for a while and then powering off immediately.
		3. If the parameter in Flash Descriptor is not modified, it can't light up the CPU of U0/P0/R0 step of generation 8/9, which is manifested as power off immediately after the power light is on. 
To sum up, when you brush in the BIOS provided by me, please brush in the whole BIOS, and when you do DIY by yourself, you can just brush in the part you modified. 
If you have brushed in the BIOS of me before, and can't start up the system after you change CPU, please do it again in full. If you have flashed my BIOS before and can't boot up after changing CPU, you should flash the whole BIOS again. 
The BIOSes I provide here are all full BIOSes with ME and Flash Descriptor, and can be flashed directly by programmer.

1. Preparation: 
will be unzipped, get DOS folder, and then you want to brush the BIOS file renamed BIOS.BIN (other names can be, they know on the line, for the sake of convenience, do not bring spaces and Chinese, the following command in the BIOS.BIN their discretion to replace the EC, the same reason) into the DOS folder 
Blue Sky model, you want to brush the Main EC file renamed EC. BIN, 2nd EC file renamed EC2.BIN (many models do not have 2nd EC, normal) into the DOS folder.



1. Preparation: 
will be unzipped, get DOS folder, and then you want to brush the BIOS file renamed BIOS.BIN (other names can be, they know on the line, for the sake of convenience, do not take the space and Chinese, the following command in the BIOS.BIN their own discretion to replace the EC, the same thing) into the DOS folder 
Blue Sky models, you want to brush the Main EC file renamed EC.BIN, 2nd EC file renamed EC2.BIN (many models do not have the 2nd EC, normal) into the DOS folder. file to EC.BIN, 2nd EC file to EC2.BIN (many models do not have 2nd EC, normal) into the DOS folder, if you do not want to brush the EC, do not put 
rufus to create a FreeDOS boot USB flash drive, the DOS folder of all the contents of the copied to the root directory of this USB disk

	Enter the BIOS and modify the following options and save them, if you can't find them, don't change them, if you can find them, change them according to the requirements 
Modifying the boot method may cause the current system can't be booted, for example, the current system is booted by UEFI 
Modifying the boot method may cause the screen can't be illuminated, for example, the graphic card only supports UEFI (in this case we recommend to use the BIOS under the EFI Shell) 
Make sure that you have a means to recover the normalcy from the above situation, otherwise, you will not be able to recover the normalcy from the above situation. Please make sure you have the means to recover from the above situation, otherwise do not continue 
One of the two options: 
BIOS main interface->Boot at the top->UEFI Settings->UEFI Boot->Disabled 
BIOS main interface->Boot at the top->Boot mode select->Legacy 
Three of the three options, or none: 
BIOS main interface->Top Security->Secure Boot->Disabled 
BIOS main interface->Top Security->Secure Boot->Attempt Secure Boot->Disabled 
BIOS main interface->Top Security->Secure Boot menu->Secure Boot->Disabled Secure Boot->Disabled 
Microelectronics choose one, Blue Sky does not: 
BIOS main interface->Top Advanced->PCH-IO Configuration->BIOS Security Configuration->BIOS Lock->Disabled 
BIOS main interface->Top Advanced->PCH-IO Configuration->BIOS Lock->Disabled BIOS main interface->top Advanced->PCH-IO Configuration->Security Configuration->BIOS Lock->Disabled

	After booting FreeDOS from USB flash disk, you will see "C:\>_", then the preparation work is finished.

2. Operation introduction: 
Unlock the read/write restriction of Flash Descriptor and ME Region settings in Flash Descriptor 
MICROS can not perform this operation under DOS, Blue Sky performs "meset", and it will reboot automatically after the execution, if it doesn't reboot automatically, please press and hold down the boot key to shut down the computer manually, then press the boot key to boot the computer after 3 seconds. 
Therefore, this operation is only effective for one boot, if it is not effective, it is only effective for one boot, if it is not effective for one boot, it is only effective for one boot, and it is only effective for one boot. Therefore, the operation will only take effect once, if you reboot again, it will be automatically restored, so please follow the above to boot FreeDOS from the USB flash drive to perform the subsequent backup and write operations 
If you reboot this time directly into the Windows system, then you reboot to the FreeDOS, it is still not lifted the restriction of the state of the 
This time the reboot may be slower, it is a normal phenomenon, please wait patiently 
Blue Sky models of the The fan may run at full speed, it is normal, after all the operations are finished, it will be restored after reboot 
There are 3 cases of this restriction on ME Region, they are:
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
will backup the Flash Descriptor in bak_desc.bin file, you can fill in the filename by yourself, don't include space.

Backup current ME Region 
fpt -me -d bak_me.bin 
will backup ME Region in bak_me.bin file, the file name can be filled in by yourself without spaces.

Backup the current BIOS Region 
fpt -bios -d bak_bios.bin 
will backup the BIOS Region in bak_bios.bin file, the file name can be filled in by yourself without spaces.

Backup the current full BIOS (including all Regions) 
fpt -d bak_full.bin 
will backup the full BIOS in bak_full.bin file, the file name can be filled in by yourself without spaces 
This full BIOS can be flashed by programmer directly.

Note, if there is a file with the same name, fpt will prompt you to overwrite it, please be careful.

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

Note, if the BIOS.BIN you put in is incomplete, for example, it only contains the BIOS Region, please don't perform the operation of writing other Regions. 
If you write the BIOS Region as a complete BIOS, you will not be able to boot up the computer.

Blue Sky flashed Main EC 
ELASH15 EC.BIN /AD /F2 /M 
to update the firmware of Main EC with EC.BIN.

Blue Sky flashing 2nd EC 
EF2ND10C EC2.BIN /AD /M 
to update the firmware of 2nd EC with EC2.

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