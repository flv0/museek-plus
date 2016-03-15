project(Murmur)

set(MURMUR_SOURCES
    murmur.py
    )

project(Pymurmur)

file(GLOB_RECURSE PYMURMUR_FILES pymurmur/*.py)

set(PYMURMUR_SOURCES
    ${PYMURMUR_FILES}
    )

EXECUTE_PROCESS(COMMAND python ${CMAKE_SOURCE_DIR}/cmake/get_python_lib.py museek OUTPUT_VARIABLE sitepackages OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_VARIABLE error)

if(NOT sitepackages OR error)
    message(FATAL_ERROR "Failed to find Python's site-packages directory" ${sitepackages} ${error})
endif()

install(
    FILES ${PYMURMUR_SOURCES}
    DESTINATION ${CMAKE_INSTALL_PREFIX}/${sitepackages}/pymurmur
    )

install_python_executables("${MURMUR_SOURCES}" bin)

set(MANPAGES
    murmur.1
    )
install(
    FILES ${MANPAGES}
    DESTINATION "${CMAKE_INSTALL_MANDIR}/man1"
    )

set(ICONS
    images/murmur-96px.png
    images/murmur-64px.png
    images/murmur-32px.png
    images/murmur-16px.png
    )
install(
    FILES ${ICONS}
    DESTINATION "share/pixmaps"
    )

set(DESKTOP
    files/murmur.desktop
    )
install(
    FILES ${DESKTOP}
    DESTINATION "share/applications"
    )

message("--> Murmur will be installed.")
