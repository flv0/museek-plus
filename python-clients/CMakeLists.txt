project(Clients)

set(CLIENT_SOURCES
    mulog.py
    museekchat.py
    musirc.py
    museekcontrol.py
    )

install_python_executables("${CLIENT_SOURCES}" bin)

set(MANPAGES
    mulog.1
    museekcontrol.1
    )
install(
    FILES ${MANPAGES}
    DESTINATION "${CMAKE_INSTALL_MANDIR}/man1"
    )

message("--> mulog, museekchat, museekcontrol, musirc.py will be installed.")
