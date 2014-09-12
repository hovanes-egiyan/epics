## Example vxWorks startup file

## The following is needed if your board support package doesn't at boot time
## automatically cd to the directory containing its startup script
cd "/home/levon/controls/R3.14.12.3/apps/iocBoot/iocclassc6"

< cdCommands
#< ../nfsCommands
< ../network
#< ../users

cd topbin

## You may have to change classc6 to something else
## everywhere it appears in this file
ld 0,0, "classc6.munch"

## Register all support components
cd top
dbLoadDatabase "dbd/classc6.dbd"
classc6_registerRecordDeviceDriver pdbbase

## Load record instances
##dbLoadTemplate "db/user.substitutions"
##dbLoadRecords "db/dbSubExample.db", "user=levon"


dbLoadRecords("db/bta_suppl.db","hall=B,ioc=classc6")

dbLoadRecords("db/sixty_hz_common.db", "FIFO=4096, HALF_FIFO=2048")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=0")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=1")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=2")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=3")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=4")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=5")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=6")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=7")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=8")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=9")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=10")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=11")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=12")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=13")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=14")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=15")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=16")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=17")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=18")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=19")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=20")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=21")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=22")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=23")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=24")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=25")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=26")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=27")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=28")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=29")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=30")
dbLoadRecords("db/sixty_hz_macro.db", "FIFO=4096, HALF_FIFO=2048, CHAN=31")


# SIS 8201/7201 scaler (STRUCK scaler) setup parameters:
#     (1)cards, (2)base address(ext, 256-byte boundary),
#     (3)interrupt vector (0=disable or  64 - 255)
devSTR7201Debug = 0
drvSTR7201Debug = 0
#ppc
STR7201Setup(5, 0x08000000, 221, 6)
STR7201Config(0,32,4096)
STR7201Config(4,32,16)
###

#
# OMS stepper motor driver
#
##recMotordebug = 11
##devOMSdebug   = 11
#
# OMS VME driver setup parameters: 
#     (1)cards, (2)base address(short, 16-byte boundary), 
#     (3)interrupt vector (0=disable or  64 - 255), (4)interrupt level (1 - 6),
#     (5)motor task polling rate (min=1Hz,max=60Hz)
omsSetup(2, 0x8000, 180, 5, 60)
#omsSetup(1, 0x2000, 180, 5, 10)

## Set this to see messages from mySub
#mySubDebug = 1

#recScalerdebug=0
#devScalerdebug=0
devScaler_VSDebug=0
devScalerDebug=0
# Joerger VSC setup parameters:
#     (1)cards, (2)base address(ext, 256-byte boundary),
#     (3)interrupt vector (0=disable or  64 - 255)
#mv162
#VSCSetup(2, 0x02000000, 200)
#ppc
VSCSetup(3, 0x0a000000, 200)


## Run this to trace the stages of iocInit
#traceIocInit

cd startup
iocInit

## Start any sequence programs
#seq &sncExample, "user=levon"

# sequencers
#
#seq &bta, "hall=B,ioc=classc6" 
seq &sixtyHz
#
# startup.all done
#

