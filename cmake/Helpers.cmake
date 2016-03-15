function(install_python_executables SOURCES DESTINATION)
    foreach(FILE ${SOURCES})
        get_filename_component(FILE_STRIPPED ${FILE} NAME_WE)
        install(
            FILES ${FILE}
            DESTINATION ${DESTINATION}
            PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
            GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
            RENAME ${FILE_STRIPPED}
            )
    endforeach()
endfunction(install_python_executables)
