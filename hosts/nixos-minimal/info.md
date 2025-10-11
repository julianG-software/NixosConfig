# nixos

This is the config for a minimal tty only enviroment

## Hardware
this hardware is mainly run on my Asus Zenbook.

### dmidecode output
the output of running `dmidecode | grep -A3 '^System Information'` is

```shell
System Information
	Manufacturer: ASUSTeK COMPUTER INC.
	Product Name: ZenBook UX431DA_RM431DA
	Version: 1.0
```

### hwinfo output
the output of running `hwinfo --short` is

```shell
cpu:                                                            
                       AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx, 1366 MHz
                       AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx, 1362 MHz
                       AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx, 3412 MHz
                       AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx, 3142 MHz
                       AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx, 1375 MHz
                       AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx, 1459 MHz
                       AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx, 1363 MHz
                       AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx, 1341 MHz
keyboard:
  /dev/input/event13   WootingOne
  /dev/input/event0    AT Translated Set 2 keyboard
mouse:
  /dev/input/mice      Logitech Gaming Mouse G502
  /dev/input/mice      WootingOne
  /dev/input/mice      ELAN1301:00 04F3:3115 Mouse
  /dev/input/mice      ELAN1301:00 04F3:3115 Touchpad
monitor:
                       VIEWSONIC XG270
                       CEC PA LCD Monitor
graphics card:
                       ATI VGA compatible controller
sound:
                       ATI Multimedia controller
                       AMD Multimedia controller
storage:
                       Mass storage controller
                       AMD Mass storage controller
network:
  wlp1s0               Intel WLAN controller
network interface:
  wlp1s0               Ethernet network interface
  lo                   Loopback network interface
disk:
  /dev/nvme0n1         HFM512GDJTNG-8310A
partition:
  /dev/nvme0n1p1       Partition
  /dev/nvme0n1p2       Partition
  /dev/nvme0n1p3       Partition
usb controller:
                       AMD USB Controller
                       AMD USB Controller
bios:
                       BIOS
bridge:
                       AMD Host bridge
                       AMD Host bridge
                       AMD PCI bridge
                       AMD Host bridge
                       AMD Host bridge
                       AMD ISA bridge
                       AMD Host bridge
                       AMD Host bridge
                       AMD PCI bridge
                       AMD Host bridge
                       AMD PCI bridge
                       AMD Host bridge
                       AMD Host bridge
                       AMD Host bridge
                       AMD PCI bridge
                       AMD Host bridge
hub:
                       Linux 6.12.46 xhci-hcd xHCI Host Controller
                       Linux 6.12.46 xhci-hcd xHCI Host Controller
                       Linux 6.12.46 xhci-hcd xHCI Host Controller
                       Generic 4-Port USB 2.0 Hub
                       USB2.0 Hub
                       Linux 6.12.46 xhci-hcd xHCI Host Controller
memory:
                       Main Memory
bluetooth:
                       Bluetooth Device
                       Bluetooth Device
unknown:
                       FPU
                       DMA controller
                       PIC
                       Keyboard controller
                       AMD Multimedia controller
                       AMD Generic system peripheral
                       AMD Encryption controller
                       AMD SMBus
  /dev/input/event17   Winbond Electronics HID Transfer
  /dev/input/event12   Logitech Gaming Mouse G502
                       Azurewave USB2.0 HD UVC WebCam
                       WootingOne
                       Elan Microelectronics Corportation ELAN:Fingerprint
                       WootingOne
                       WootingOne
                       Azurewave USB2.0 HD UVC WebCam
```
