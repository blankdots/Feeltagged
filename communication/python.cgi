#Distributed under the MIT License :
 
#Copyright (c) 2009 <http://blankdots.com>
 
#Permission is hereby granted, free of charge, to any person
#obtaining a copy of this software and associated documentation
#files (the "Software"), to deal in the Software without
#restriction, including without limitation the rights to use,
#copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the
#Software is furnished to do so, subject to the following
#conditions:
 
#The above copyright notice and this permission notice shall be
#included in all copies or substantial portions of the Software.
 
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
#HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#OTHER DEALINGS IN THE SOFTWARE.
 
#!C:\Python25\python.exe - because of windows - change to os
import serial
import time
import pytwitter
import cgi, cgitb
 
client = pytwitter.pytwitter(username='***************', password='***************')
ser = serial.Serial('COM3',9600) #windows COM3 port ... change to os port
 
form = cgi.FieldStorage()
 
# Get data from fields
wl = form.getvalue('wl')
bd = form.getvalue('bd')
 
 
val = "#arduino"
 
if (wl == 'yes') and (bd == 'yes'):
    ser.open()
    if ser.isOpen():
        ser.write('N')
        time.sleep(10)
        ser1 = ser.readline()
        client.statuses_update(status= ser1 + val)
    ser.close()
    ser.open()
    ser.write('B')
    ser.close()
else:
    if (wl == 'no' ) and (bd == 'no'):
        ser.open()
        if ser.isOpen():
            ser.write('M')
            time.sleep(10)
            ser1 = ser.readline()
            client.statuses_update(status= ser1 + val)
        ser.close()
        ser.open()
        ser.write('B')
        ser.close()
    else:
        if ( wl == 'yes') and ( bd == 'no'):
            ser.open()
            if ser.isOpen():
                ser.write('O')
                time.sleep(10)
                ser1 = ser.readline()
                client.statuses_update(status= ser1 + val)
            ser.close()
            ser.open()
            ser.write('B')
            ser.close()
        else:
            if ( wl == 'yes') and ( bd == 'not'):
                ser.open()
                if ser.isOpen():
                    ser.write('P')
                    time.sleep(10)
                    ser1 = ser.readline()
                    client.statuses_update(status= ser1 + val)
                ser.close()
                ser.open()
                ser.write('B')
                ser.close()
            else:
                if ( wl == 'no') and ( bd == 'wrk'):
                    ser.open()
                    if ser.isOpen():
                        ser.write('Q')
                        time.sleep(10)
                        ser1 = ser.readline()
                        client.statuses_update(status= ser1 + val)
                    ser.close()
                    ser.open()
                    ser.write('B')
                    ser.close()
                else:
                    ser.open()
                    if ser.isOpen():
                        ser.write('R')
                        time.sleep(10)
                        ser1 = ser.readline()
                        client.statuses_update(status= ser1 + val)
                    ser.close()
                    ser.open()
                    ser.write('B')
                    ser.close()
            
print "Content-type:text/html\r\n\r\n"
print "<html>"
print "<link rel='stylesheet' type='text/css' href='css/all_css.css' />"
print "<head>"
print "<title>Feeltagged - Arduino Project</title>"
print "</head>"
print "<body>"
print "<div id='wrapper'>"
print "<h2>Your answer to the weather question: %s</h2>" % wl
print "<h2>Your answer to the boredom question: %s</h2>" % bd
print "<h2>Btw i tweet this ;)</h2>"
print "</div>"
print "</body>"
print "</html>"