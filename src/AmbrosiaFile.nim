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

import os
import std/json
import config
import console

const configDir = ".ambrosia"
const configFile = "config.json"

proc main(home: string) =
  var jsonConfig: JsonNode
  jsonConfig = config.readJsonConfig(readFile(getHomeDir()&"/"&configDir&"/"&configFile))
  if not jsonConfig{"license"}.getBool():
    var a = console.license()
    echo a


  

if isMainModule:
  main(getHomeDir())
