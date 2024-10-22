project({{PROJECT_NAME}}_test)

include_directories(${PROJECT_SOURCE_DIR}/../../src)

set(GTEST_LIBRARIES gtest gtest_main)

set({{PROJECT_NAME_UPPER_CASE}}_TEST_SOURCE_FILES
        program_test.cpp
)

add_executable({{PROJECT_NAME}}_test
        main.cpp
        ${{{PROJECT_NAME_UPPER_CASE}}_TEST_SOURCE_FILES}
)

target_link_libraries({{PROJECT_NAME}}_test {{PROJECT_NAME}} ${GTEST_LIBRARIES})
