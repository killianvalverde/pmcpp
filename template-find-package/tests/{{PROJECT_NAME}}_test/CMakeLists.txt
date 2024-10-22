find_package(GTest REQUIRED)

set({{PROJECT_NAME_UPPER_CASE}}_TEST_SOURCE_FILES
    program_test.cpp
)

add_executable({{PROJECT_NAME}}_test
    main.cpp
    ${{{PROJECT_NAME_UPPER_CASE}}_TEST_SOURCE_FILES}
)

target_link_libraries({{PROJECT_NAME}}_test PRIVATE {{PROJECT_NAME}} GTest::gtest GTest::gtest_main)
