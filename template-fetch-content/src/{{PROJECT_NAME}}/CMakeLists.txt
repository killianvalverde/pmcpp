include(FetchContent)

FetchContent_Declare(
    speed
    GIT_REPOSITORY https://github.com/killianvalverde/speed.git
    GIT_TAG develop
)

FetchContent_MakeAvailable(speed)

set({{PROJECT_NAME_UPPER_CASE}}_SOURCE_FILES
    exception.hpp
    program.cpp
    program.hpp
    program_args.hpp
    {{PROJECT_NAME}}.hpp
)

add_library({{PROJECT_NAME}} STATIC ${{{PROJECT_NAME_UPPER_CASE}}_SOURCE_FILES})

set_target_properties({{PROJECT_NAME}} PROPERTIES OUTPUT_NAME "{{PROJECT_NAME}}$<IF:$<CONFIG:Debug>,d,>")

target_link_libraries({{PROJECT_NAME}} PUBLIC speed)

target_include_directories({{PROJECT_NAME}} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/..)
