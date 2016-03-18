rev=aa6c58ad3781c442beff9b3fd1774cb882382456
git checkout -f RC && \
git branch -D ba3dpeuchanges && \
git branch ba3dpeuchanges $rev && \
git checkout ba3dpeuchanges && \
rm -rf Marlin && \
cp -a ../../builda3dprinter.eu/Marlin . && \
# missing files
git checkout $rev Marlin/COPYING \
	Marlin/example_configurations \
	Marlin/ConfigurationStore.cpp \
	Marlin/ConfigurationStore.h \
	Marlin/DOGMbitmaps.h \
	Marlin/LiquidCrystalRus.cpp \
	Marlin/LiquidCrystalRus.h \
	Marlin/createTemperatureLookupMarlin.py \
	Marlin/create_speed_lookuptable.py \
	Marlin/dogm_font_data_marlin.h \
	Marlin/LCD\ Menu\ Tree.pdf \
	Marlin/Menu\ Plans.xlsx \
	Marlin/Makefile && \
# moved files
#cp Marlin/Configuration.h Marlin/example_configurations/delta/Configuration.h && \
#cp Marlin/Configuration_adv.h Marlin/example_configurations/delta/Configuration_adv.h && \
# restore stock files
#git checkout $rev Marlin/Configuration.h Marlin/Configuration_adv.h && \
# renamed files
mv Marlin/Marlin.ino Marlin/Marlin.pde && \
# file name case lost
mv Marlin/servo.cpp Marlin/Servo2.cpp && \
mv Marlin/Servo2.cpp Marlin/Servo.cpp && \
mv Marlin/servo.h Marlin/Servo2.h && \
mv Marlin/Servo2.h Marlin/Servo.h && \
# files with screwed up line-endings
git checkout $rev Marlin/stepper.h && \
# fix permissions
chmod 0644 Marlin/MarlinSerial.cpp \
	Marlin/Configuration.h \
	Marlin/Configuration_adv.h \
	Marlin/MarlinSerial.h \
	Marlin/Marlin.pde \
	Marlin/language.h \
	Marlin/Marlin_main.cpp \
	Marlin/fastio.h \
	Marlin/watchdog.h \
	Marlin/watchdog.cpp \
	Marlin/ultralcd_st7920_u8glib_rrd.h \
	Marlin/ultralcd_implementation_hitachi_HD44780.h \
	Marlin/ultralcd.h \
	Marlin/ultralcd.cpp \
	Marlin/thermistortables.h \
	Marlin/temperature.h \
	Marlin/temperature.cpp \
	Marlin/stepper.h \
	Marlin/stepper.cpp \
	Marlin/speed_lookuptable.h \
	Marlin/planner.h \
	Marlin/planner.cpp \
	Marlin/SdFatUtil.h \
	Marlin/SdFatUtil.cpp \
	Marlin/SdFatStructs.h \
	Marlin/SdFatConfig.h \
	Marlin/SdFile.cpp \
	Marlin/SdFile.h \
	Marlin/SdVolume.h \
	Marlin/SdVolume.cpp \
	Marlin/Sd2Card.h \
	Marlin/Sd2Card.cpp \
	Marlin/Sd2PinMap.h \
	Marlin/SdInfo.h \
	Marlin/motion_control.cpp \
	Marlin/motion_control.h \
	Marlin/cardreader.cpp \
	Marlin/cardreader.h \
	Marlin/pins.h \
	Marlin/Servo.cpp \
	Marlin/Servo.h \
	Marlin/dogm_lcd_implementation.h \
	Marlin/Marlin.h \
	Marlin/SdBaseFile.h \
	Marlin/SdBaseFile.cpp && \
# files with converted line-endings
recode latin1..dos Marlin/Sd2Card.cpp \
	Marlin/Sd2Card.h \
	Marlin/ultralcd_implementation_hitachi_HD44780.h \
	Marlin/SdFatUtil.h \
	Marlin/SdVolume.cpp \
	Marlin/SdInfo.h \
	Marlin/SdFile.cpp \
	Marlin/Sd2PinMap.h && \
# Re-Remove newlines added by recode
perl -i -pe 'chomp if eof' Marlin/SdVolume.h \
	Marlin/SdFile.h && \
perl -i -pe 'if (eof) { chop ; chop }' Marlin/SdVolume.cpp \
	Marlin/Sd2Card.h \
	Marlin/Sd2PinMap.h \
	Marlin/SdFatUtil.h \
	Marlin/SdInfo.h && \
perl -i -pe 'if (eof) { s/\r// }' Marlin/Sd2Card.cpp && \
cp $0 ba3dpeuchanges.sh && \
git add ba3dpeuchanges.sh && \
cp ../../ba3dpeuchanges-whitespace.patch ba3dpeuchanges-whitespace.patch && \
git add ba3dpeuchanges-whitespace.patch && \
patch -p0 < ba3dpeuchanges-whitespace.patch && \
git commit -am "Make changes by builda3dprinter.eu visible"
