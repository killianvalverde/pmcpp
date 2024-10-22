set(MAIN_SOURCE_FILES
    main.cpp
)

add_executable(main ${MAIN_SOURCE_FILES})

set_target_properties(main PROPERTIES OUTPUT_NAME "{{PROJECT_NAME}}$<IF:$<CONFIG:Debug>,d,>")

target_link_libraries(main PRIVATE {{PROJECT_NAME}})

install(TARGETS main DESTINATION bin)
