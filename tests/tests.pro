TEMPLATE = app

TARGET = tst_Mixpanel

CONFIG += qmltestcase

# IMPORTPATH += /Users/artem/projects/Mixpanel/src
# I failed to figure out how to adjust imports dir from .pro, so just use the following argument line
# in the Creator's Run Configuration
# -import %{sourceDir}/src
#
# Or just run in command line something like the following:
# ./tst_Mixpanel -import ../Mixpanel/src


QML_IMPORT_PATH += $$PWD/../src
message("Import path:")
message($$IMPORTPATH)

SOURCES += tst_mixpanel.cpp

OTHER_FILES += \
    tst_Mixpanel.qml \
    ../src/Mixpanel/Mixpanel.qml \
    ../src/Mixpanel/qmldir \
    ../src/Mixpanel/plugins.qmltypes
