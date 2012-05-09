ZENGL_PATH     = <Put here the path to ZenGL SDK>

MAINFILE       = CareApp.pas
OUTPUT         = ..
TMP            = ../tmp

CARE_OPTIONS  = $(MAINFILE) -Fu$(ZENGL_PATH)/headers -Fu../$(LIBS)libs -FU$(TMP) $(FLAGS)
FLAGS          = -O3 -XsX -CX -Sd

TARGET_WIN32   = care.exe

# Targets
win32:
	fpc $(CARE_OPTIONS) -o$(OUTPUT)/$(TARGET_WIN32) -TWIN32 -Pi386 -WC

clean:
	rm -f -R ../tmp/*
