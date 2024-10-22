/* {{PROJECT_NAME}}
 * Copyright (C) {{YEAR}} {{AUTHOR}}.
 *
 * This file is part of {{PROJECT_NAME}}.
 *
 * {{PROJECT_NAME}} is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * {{PROJECT_NAME}} is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with {{PROJECT_NAME}}. If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * @file        main.cpp
 * @brief       main entry point.
 * @author      {{AUTHOR}}
 * @date        {{DATE}}
 */

#include <speed/speed.hpp>

#include "../{{PROJECT_NAME}}/{{PROJECT_NAME}}.hpp"

/**
 * @brief       Entry point of the program.
 * @param       argc : Number of command-line arguments, including the program name.
 * @param       argv : Array of C-style strings representing the command-line arguments.
 * @return      Zero on successful execution, or a non-zero value on error.
 */
int main(int argc, char* argv[])
{
    try 
    {
        {{PROJECT_NAME}}::program_args prog_args;
        spd::ap::arg_parser ap("{{PROJECT_NAME}}");
        
        ap.add_help_menu()
                .description("{{DESCRIPTION}}.");
                
        ap.add_help_arg("--help", "-h")
                .description("Display this help and exit.");
                
        ap.add_version_arg("--version", "-v")
                .description("Output version information and exit.")
                .gplv3_version_information("0.0.0", "{{YEAR}}", "{{AUTHOR}}");

        ap.parse_args(argc, argv);
        
        {{PROJECT_NAME}}::program prog(prog_args);
        return prog.execute();
    }
    catch (const std::exception& e)
    {
        spd::ios::print_error_and_exit(std::cerr, "{{PROJECT_NAME}}", e.what(), 1);
    }
    catch (...)
    {
        spd::ios::print_error_and_exit(std::cerr, "{{PROJECT_NAME}}", "Unknown error", 1);
    }
}
