QT       += core gui
QT += core websockets
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
QMAKE_LFLAGS_DEBUG += /INCREMENTAL:NO
# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    mainwindow2.cpp

HEADERS += \
    mainwindow.h \
    mainwindow2.h

FORMS += \
    mainwindow.ui \
    mainwindow2.ui

LIBS += -lws2_32

TRANSLATIONS += \
    untitled1_yue_CN.ts

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    图标资源1/access.ico \
    图标资源1/acroread.ico \
    图标资源1/akregator.ico \
    图标资源1/aktion.ico \
    图标资源1/applixware.ico \
    图标资源1/ark.ico \
    图标资源1/arts.ico \
    图标资源1/artsbuilder.ico \
    图标资源1/artscontrol.ico \
    图标资源1/artsmidimanager.ico \
    图标资源1/background.ico \
    图标资源1/browser.ico \
    图标资源1/bug.ico \
    图标资源1/cache.ico \
    图标资源1/chat.ico \
    图标资源1/clanbomber.ico \
    图标资源1/clock.ico \
    图标资源1/colors.ico \
    图标资源1/cookie.ico \
    图标资源1/core.ico \
    图标资源1/date.ico \
    图标资源1/digikam.ico \
    图标资源1/display.ico \
    图标资源1/download_manager.ico \
    图标资源1/edu_languages.ico \
    图标资源1/edu_mathematics.ico \
    图标资源1/edu_miscellaneous.ico \
    图标资源1/edu_science.ico \
    图标资源1/email.ico \
    图标资源1/energy.ico \
    图标资源1/enhanced_browsing.ico \
    图标资源1/error.ico \
    图标资源1/file-manager.ico \
    图标资源1/filetypes.ico \
    图标资源1/flashkard.ico \
    图标资源1/fonts.ico \
    图标资源1/fsview.ico \
    图标资源1/go.ico \
    图标资源1/help_index.ico \
    图标资源1/hwinfo.ico \
    图标资源1/icons.ico \
    图标资源1/iconthemes.ico \
    图标资源1/important.ico \
    图标资源1/indeximg.ico \
    图标资源1/input_devices_settings.ico \
    图标资源1/irkick.ico \
    图标资源1/kaddressbook.ico \
    图标资源1/kalarm.ico \
    图标资源1/kappfinder.ico \
    图标资源1/karm.ico \
    图标资源1/kate.ico \
    图标资源1/kaudiocreator.ico \
    图标资源1/kblackbox.ico \
    图标资源1/kbrunch.ico \
    图标资源1/kcalc.ico \
    图标资源1/kcharselect.ico \
    图标资源1/kchart.ico \
    图标资源1/kcmdevice.ico \
    图标资源1/kcmdevices.ico \
    图标资源1/kcmdf.ico \
    图标资源1/kcmfontinst.ico \
    图标资源1/kcmkicker.ico \
    图标资源1/kcmkwm.ico \
    图标资源1/kcmmemory.ico \
    图标资源1/kcmmidi.ico \
    图标资源1/kcmpartitions.ico \
    图标资源1/kcmpci.ico \
    图标资源1/kcmprocessor.ico \
    图标资源1/kcmsystem.ico \
    图标资源1/kcmx.ico \
    图标资源1/kcolorchooser.ico \
    图标资源1/kcoloredit.ico \
    图标资源1/kcontrol.ico \
    图标资源1/kdf.ico \
    图标资源1/kdict.ico \
    图标资源1/kdisknav.ico \
    图标资源1/kdmconfig.ico \
    图标资源1/kedit.ico \
    图标资源1/keditbookmarks.ico \
    图标资源1/key_bindings.ico \
    图标资源1/keybindings.ico \
    图标资源1/keyboard.ico \
    图标资源1/keyboard_layout.ico \
    图标资源1/kfig.ico \
    图标资源1/kfind.ico \
    图标资源1/kfloppy.ico \
    图标资源1/kfm.ico \
    图标资源1/kfm_home.ico \
    图标资源1/kget.ico \
    图标资源1/kghostview.ico \
    图标资源1/kgpg.ico \
    图标资源1/khelpcenter.ico \
    图标资源1/khexedit.ico \
    图标资源1/khotkeys.ico \
    图标资源1/kig.ico \
    图标资源1/kjobviewer.ico \
    图标资源1/kjots.ico \
    图标资源1/klipper.ico \
    图标资源1/klpq.ico \
    图标资源1/kmag.ico \
    图标资源1/kmail.ico \
    图标资源1/kmenu.ico \
    图标资源1/kmenuedit.ico \
    图标资源1/kmid.ico \
    图标资源1/kmix.ico \
    图标资源1/kmousetool.ico \
    图标资源1/knewsletter.ico \
    图标资源1/knewsticker.ico \
    图标资源1/knode.ico \
    图标资源1/knotes.ico \
    图标资源1/knotify.ico \
    图标资源1/kolourpaint.ico \
    图标资源1/konqsidebar_mediaplayer.ico \
    图标资源1/konqueror.ico \
    图标资源1/konsole.ico \
    图标资源1/kontact.ico \
    图标资源1/korganizer.ico \
    图标资源1/korganizer_todo.ico \
    图标资源1/korn.ico \
    图标资源1/kpackage.ico \
    图标资源1/kpager.ico \
    图标资源1/kpaint.ico \
    图标资源1/kpdf.ico \
    图标资源1/kpilot.ico \
    图标资源1/kppp.ico \
    图标资源1/kpresenter.ico \
    图标资源1/krdc.ico \
    图标资源1/krec.ico \
    图标资源1/krfb.ico \
    图标资源1/kscd.ico \
    图标资源1/kscreensaver.ico \
    图标资源1/kservices.ico \
    图标资源1/ksig.ico \
    图标资源1/ksim.ico \
    图标资源1/ksirc.ico \
    图标资源1/ksnapshot.ico \
    图标资源1/ksplash.ico \
    图标资源1/ksysguard.ico \
    图标资源1/ktalkd.ico \
    图标资源1/kthememgr.ico \
    图标资源1/ktimer.ico \
    图标资源1/ktip.ico \
    图标资源1/ktouch.ico \
    图标资源1/kuser.ico \
    图标资源1/kview.ico \
    图标资源1/kwikdisk.ico \
    图标资源1/kwin.ico \
    图标资源1/kword.ico \
    图标资源1/kworldclock.ico \
    图标资源1/kwrite.ico \
    图标资源1/kxkb.ico \
    图标资源1/laptop_battery.ico \
    图标资源1/laptop_pcmcia.ico \
    图标资源1/license.txt \
    图标资源1/linuxconf.ico \
    图标资源1/locale.ico \
    图标资源1/looknfeel.ico \
    图标资源1/multimedia.ico \
    图标资源1/mycomputer.ico \
    图标资源1/network.ico \
    图标资源1/ooo_gulls.ico \
    图标资源1/ooo_setup.ico \
    图标资源1/package.ico \
    图标资源1/package_applications.ico \
    图标资源1/package_development.ico \
    图标资源1/package_editors.ico \
    图标资源1/package_edutainment.ico \
    图标资源1/package_favorite.ico \
    图标资源1/package_favourite.ico \
    图标资源1/package_games.ico \
    图标资源1/package_graphics.ico \
    图标资源1/package_multimedia.ico \
    图标资源1/package_network.ico \
    图标资源1/package_settings.ico \
    图标资源1/package_system.ico \
    图标资源1/package_toys.ico \
    图标资源1/package_utilities.ico \
    图标资源1/package_wordprocessing.ico \
    图标资源1/password.ico \
    图标资源1/penguin.ico \
    图标资源1/personal.ico \
    图标资源1/phppg.ico \
    图标资源1/pisi-kga.ico \
    图标资源1/printmgr.ico \
    图标资源1/proxy.ico \
    图标资源1/randr.ico \
    图标资源1/remote.ico \
    图标资源1/samba.ico \
    图标资源1/style.ico \
    图标资源1/stylesheet.ico \
    图标资源1/superkaramba.ico \
    图标资源1/systemtray.ico \
    图标资源1/taskbar.ico \
    图标资源1/tasma.ico \
    图标资源1/terminal.ico \
    图标资源1/tux.ico \
    图标资源1/usb.ico \
    图标资源1/window_list.ico \
    图标资源1/winprops.ico \
    图标资源1/wp.ico \
    图标资源1/x.ico \
    图标资源1/xapp.ico \
    图标资源1/xcalc.ico \
    图标资源1/xclock.ico \
    图标资源1/xconfig.ico \
    图标资源1/xfmail.ico \
    图标资源1/xmag.ico
