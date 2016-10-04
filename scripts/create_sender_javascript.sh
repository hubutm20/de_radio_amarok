#!/bin/bash

#/***************************************************************************
# create_sender_javascript.sh - script to create javascript sender list
#                             -------------------                            
#    begin                : Feb 2009                                         
#    copyright            : (C) 2009-2011 by Andreas Wuest
#                         :     2016 by Sebastian Rettenberger
#    email                : andreaswuest@gmx.de
#    email                : develop@rettich.bayern
# ***************************************************************************/                 

#/***************************************************************************
# *                                                                         *
# *   This program is free software; you can redistribute it and/or modify  *
# *   it under the terms of the GNU General Public License as published by  *
# *   the Free Software Foundation; either version 2 of the License, or     *
# *   (at your option) any later version.                                   *
# *                                                                         *
# ***************************************************************************/

# set -x

echo "// do not edit this file - edit sender.txt and run create_sender_javascript.sh" > $2
echo "var stationArray = new Array (" >> $2
cat $1 | grep -v '^#' | awk -F, '{ printf "new Station(\"%s\",\"%s\",\"%s\",\"%s\"),\n",$1,$2,$3,$4}' | sort >> $2
echo "new Station(\"\", \"\", \"\", \"\"));" >> $2

