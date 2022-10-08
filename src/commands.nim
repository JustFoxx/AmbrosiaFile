
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

type 
    Command* = object
        name: string
        description: string
        run*: proc()

var cmds* = newSeq[Command]()

proc error() =
    echo "Unknown command!"

proc help() =
    echo "List of commands!"
    for cmd in cmds:
        echo cmd.name&": "&cmd.description
        

proc register*() =
    cmds.add(Command(name: "hello", description: "help", run: help))

proc findCmdByName*(name: string): Command =
    for cmd in cmds:
        if cmd.name == name:
            return cmd
        else:
            return Command(name: "error", description: "error", run: error)
