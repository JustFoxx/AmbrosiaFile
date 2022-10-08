
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

import std/strutils
import system
import config
import std/json
import places

type 
    Command* = object
        name: string
        description: string
        run*: proc()

var cmds* = newSeq[Command]()

# commands

proc error() =
    echo "Unknown command!"

proc help() =
    echo "List of commands!"
    for cmd in cmds:
        echo cmd.name&": "&cmd.description

proc exit() =
    echo "Exit!"
    system.quit(1)

proc license() =
    echo readFile("LICENSE")

proc configServer() =
    let config: JsonNode = getConfig()
    var inputHost: string
    
    echo "Server Configuration"

    proc hostname() =
        write(stdout,"Hostname ("&config{"hostname"}.getStr()&"): ")
        inputHost = readLine(stdin).toLower().replaceWord(" ","")
        if inputHost == "": hostname()
        else:
            config.add("hostname", newJString(inputHost))
            writeJsonConfig(configPlace, config)

    hostname()
    


        
    

# commands
        

proc register*() =
    cmds.add(Command(name: "help", description: "List of commands", run: help))
    cmds.add(Command(name: "exit", description: "Exits app", run: exit))
    cmds.add(Command(name: "license", description: "License which app uses", run: license))
    cmds.add(Command(name: "configserver", description: "Configuration of basic stuff in server", run: configServer))

proc findCmdByName*(name: string): Command =
    for cmd in cmds:
        if cmd.name.toLower().replaceWord(" ","") == name:
            return cmd
    return Command(name: "error", description: "error", run: error)
