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
 * @file        {{PROJECT_NAME}}/program.cpp
 * @brief       program class implementation.
 * @author      {{AUTHOR}}
 * @date        {{DATE}}
 */

#include "program.hpp"


namespace {{PROJECT_NAME}} {


program::program(program_args&& prog_args) 
        : prog_args_(std::move(prog_args))
{
}


int program::execute()
{
    std::cout << "hello, world" << std::endl;
    
    return 0;
}


}
