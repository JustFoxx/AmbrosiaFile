
# AmbrosiaFile, Make your files be immortal!
# Copyright (C) 2022  JustFoxx

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

import commands

const licenseNotice = """
AmbrosiaFile  Copyright (C) 2022  JustFoxx
    This program comes with ABSOLUTELY NO WARRANTY;
    This is free software, and you are welcome to redistribute it
    under certain conditions;
"""

const licenseFull* = readFile("LICENSE")

proc license*(): bool = 
    echo licenseNotice
    proc choose(): bool = 
        write(stdout, "Do you accept license? (y: yes, n: no, r: read details): ")
        let input = readLine(stdin)
        case input:
        of "y":
            return true
        of "n":
            return false
        of "r":
            echo licenseFull
            return choose()
        else:
            return choose()
    return choose()

proc start*() =
  echo "Welcome to AmbrosiaFile!"
  echo "Use `help` for list of commands"
  commands.register()
  proc cmd() =
    write(stdout, ">> ")
    let input = readLine(stdin)
    let command = commands.findCmdByName(input)
    command.run()
    cmd()
  cmd()