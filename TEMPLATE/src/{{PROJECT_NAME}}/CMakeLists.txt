set({{PROJECT_NAME_UPPER_CASE}}_SOURCE_FILES
        exception.hpp
        program.cpp
        program.hpp
        program_args.hpp
)

add_library({{PROJECT_NAME}} STATIC ${{{PROJECT_NAME_UPPER_CASE}}_SOURCE_FILES})

set(suffix "$<IF:$<CONFIG:Debug>,d,>")
target_link_libraries({{PROJECT_NAME}} speed${suffix})
