
#if blocked run "get-ExecutionPolicy" take a note and then change to "set-executionpolicy unrestricted"
$outFile = get-content env:computername 
$outFile = $outfile +"-CIS-IIS_Benchmark.txt"
Set-PSDebug -trace 0


function showAndRun($cmd){
  echo "***Command: $cmd";  
  Invoke-Expression -Command "$cmd"
}

function printTestSeparator($testName){
  echo "`n`n-----------------------------------`n`n"
  echo "$testname`n"
}

Start-Transcript -path $outFile -append -IncludeInvocationHeader



printTestSeparator "1 Account Policies"
printTestSeparator "1.1 Password Policy"

printTestSeparator "1.1.1 Set 'Enforce password history' to '24 or more password(s)' (Scored L1)"
printTestSeparator "1.1.2 Set 'Maximum password age' to 60 or fewer days, but not 0 (Scored L1)"
printTestSeparator "1.1.3 Set 'Minimum password age' to '1 or more day(s)' (Scored L1)"
printTestSeparator "1.1.4 Set 'Minimum password length' to '14 or more character(s)' (Scored L1)"
printTestSeparator "1.1.5 Set 'Password must meet complexity requirements' to 'Enabled' (Scored L1)"
printTestSeparator "1.1.6 Set 'Store passwords using reversible encryption' to 'Disabled' (Scored L1)"


printTestSeparator "1.2 Account Lockout Policy"
printTestSeparator "1.2.1 Set 'Account lockout duration' to '15 or more minute(s)' (Scored L1)"
printTestSeparator "1.2.2 Set 'Account lockout threshold' to 10 or fewer invalid logon attempt(s), but not 0 (Scored L1)"
printTestSeparator "1.2.3 Set 'Reset account lockout counter after' to '15 or more minute(s)' (Scored L1)"



printTestSeparator "2 Local Policies"
printTestSeparator "2.1 Audit Policy"
echo "NA"

printTestSeparator "2.2 User Rights Assignment"


printTestSeparator "2.2.1 Set 'Access Credential Manager as a trusted caller' to 'No One' (Scored L1)"
printTestSeparator "2.2.2 Set 'Access this computer from the network' (Scored L1)"
printTestSeparator "2.2.2 Set 'Access this computer from the network' (Scored L1)"
printTestSeparator "2.2.3 Set 'Act as part of the operating system' to 'No One' (Scored L1)"
printTestSeparator "2.2.4 Set 'Add workstations to domain' to 'Administrators' (Scored L1 -DC Only)"
printTestSeparator "2.2.5 Set 'Adjust memory quotas for a process' to 'Administrators, LOCAL SERVICE, NETWORK SERVICE' (Scored L1)"
printTestSeparator "2.2.6 Set 'Allow log on locally' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.7 Configure 'Allow log on through Remote Desktop Services' (Scored L1)"
printTestSeparator "2.2.8 Set 'Back up files and directories' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.9 Set 'Change the system time' to 'Administrators, LOCAL SERVICE' (Scored L1)"
printTestSeparator "2.2.10 Set 'Change the time zone' to 'Administrators, LOCAL SERVICE' (Scored L1)"
printTestSeparator "2.2.11 Set 'Create a pagefile' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.12 Set 'Create a token object' to 'No One' (Scored L1)"
printTestSeparator "2.2.14 Set 'Create permanent shared objects' to 'No One' (Scored L1)"
printTestSeparator "2.2.15 Set 'Create symbolic links' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.16 Set 'Debug programs' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.16 Set 'Debug programs' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.17 Set 'Deny access to this computer from the network' (Scored L1)"
printTestSeparator "2.2.18 Set 'Deny log on as a batch job' to include 'Guests' (Scored L1)"
printTestSeparator "2.2.19 Set 'Deny log on as a service' to include 'Guests' (Scored L1)"
printTestSeparator "2.2.20 Set 'Deny log on locally' to include 'Guests' (Scored L1)"
printTestSeparator "2.2.21 Set 'Deny log on through Remote Desktop Services' to include 'Guests, Local account' (Scored L1)"
printTestSeparator "2.2.22 Set 'Enable computer and user accounts to be trusted for delegation' (Scored L1)"
printTestSeparator "2.2.23 Set 'Force shutdown from a remote system' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.24 Set 'Generate security audits' to 'LOCAL SERVICE, NETWORK SERVICE' (Scored L1)"
printTestSeparator "2.2.25 Set 'Impersonate a client after authentication' to 'Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE' (Scored L1)"
printTestSeparator "2.2.26 Set 'Increase scheduling priority' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.27 Set 'Load and unload device drivers' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.28 Set 'Lock pages in memory' to 'No One' (Scored L1)"
printTestSeparator "2.2.29 Set 'Manage auditing and security log' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.30 Set 'Modify an object label' to 'No One' (Scored L1)"
printTestSeparator "2.2.31 Set 'Modify firmware environment values' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.32 Set 'Perform volume maintenance tasks' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.33 Set 'Profile single process' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.34 Set 'Profile system performance' to 'Administrators, NT SERVICE\WdiServiceHost' (Scored L1)"
printTestSeparator "2.2.35 Set 'Replace a process level token' to 'LOCAL SERVICE, NETWORK SERVICE' (Scored L1)"
printTestSeparator "2.2.36 Set 'Restore files and directories' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.37 Set 'Shut down the system' to 'Administrators' (Scored L1)"
printTestSeparator "2.2.38 Set 'Synchronize directory service data' to 'No One' (Scored L1)"
printTestSeparator "2.2.39 Set 'Take ownership of files or other objects' to 'Administrators' (Scored L1)"


printTestSeparator "2.3 Security Options"
printTestSeparator "2.3.1 Accounts"
printTestSeparator "2.3.1.1 Set 'Accounts: Block Microsoft accounts' to 'Users can't add or log on with Microsoft accounts' (Scored L1)"
printTestSeparator "2.3.1.2 Set 'Accounts: Guest account status' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.1.3 Set 'Accounts: Limit local account use of blank passwords to console logon only' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.1.4 Configure 'Accounts: Rename administrator account' (Scored L1)"
printTestSeparator "2.3.1.5 Configure 'Accounts: Rename guest account' (Scored L1)"

printTestSeparator "2.3.2 Audit"
printTestSeparator "2.3.2.1 Set 'Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.2.2 Set 'Audit: Shut down system immediately if unable to log security audits' to 'Disabled' (Scored L1)"

printTestSeparator "2.3.3 DCOM"
echo "NA"

printTestSeparator "2.3.4 Devices"
printTestSeparator "2.3.4.1 Set 'Devices: Allowed to format and eject removable media' to 'Administrators' (Scored L1)"
printTestSeparator "2.3.4.2 Set 'Devices: Prevent users from installing printer drivers' to 'Enabled' (Scored L1)"

printTestSeparator "2.3.5 Domain controller"
printTestSeparator "2.3.5.1 Set 'Domain controller: Allow server operators to schedule tasks' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.5.2 Set 'Domain controller: LDAP server signing requirements' to 'Require signing' (Scored L1)"
printTestSeparator "2.3.5.3 Set 'Domain controller: Refuse machine account password changes' to 'Disabled' (Scored L1)"

printTestSeparator "2.3.6 Domain member"
printTestSeparator "2.3.6.1 Set 'Domain member: Digitally encrypt or sign secure channel data (always)' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.6.2 Set 'Domain member: Digitally encrypt secure channel data (when possible)' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.6.3 Set 'Domain member: Digitally sign secure channel data (when possible)' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.6.4 Set 'Domain member: Disable machine account password changes' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.6.5 Set 'Domain member: Maximum machine account password age' to 30 or fewer days, but not 0 (Scored L1)"
printTestSeparator "2.3.6.6 Set 'Domain member: Require strong (Windows 2000 or later) session key' to 'Enabled' (Scored L1)"

printTestSeparator "2.3.7 Interactive logon"
printTestSeparator "2.3.7.1 Set 'Interactive logon: Do not display last user name' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.7.2 Set 'Interactive logon: Do not require CTRL+ALT+DEL' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.7.3 Set 'Interactive logon: Machine inactivity limit' to 900 or fewer second(s), but not 0 (Scored L1)"
printTestSeparator "2.3.7.4 Configure 'Interactive logon: Message text for users attempting to log on' (Scored L1)"
printTestSeparator "2.3.7.5 Configure 'Interactive logon: Message title for users attempting to log on' (Scored L1)"
printTestSeparator "2.3.7.6 Set 'Interactive logon: Number of previous logons to cache (in case domain controller is not available)' to '4 or fewer logon(s)' (Scored L1)"
printTestSeparator "2.3.7.7 Set 'Interactive logon: Prompt user to change password before expiration' to 'between 5 and 14 days' (Scored L1)"
printTestSeparator "2.3.7.8 Set 'Interactive logon: Smart card removal behavior' to 'Lock Workstation' (Scored L1)"

printTestSeparator "2.3.8 Microsoft network client"
printTestSeparator "2.3.8.1 Set 'Microsoft network client: Digitally sign communications (always)' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.8.2 Set 'Microsoft network client: Digitally sign communications (if server agrees)' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.8.3 Set 'Microsoft network client: Send unencrypted password to third-party SMB servers' to 'Disabled' (Scored L1)"

printTestSeparator "2.3.9 Microsoft network server"
printTestSeparator "2.3.9.1 Set 'Microsoft network server: Amount of idle time required before suspending session' to '15 or fewer minute(s)' (Scored)"
printTestSeparator "2.3.9.2 Set 'Microsoft network server: Digitally sign communications (always)' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.9.3 Set 'Microsoft network server: Digitally sign communications (if client agrees)' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.9.4 Set 'Microsoft network server: Disconnect clients when logon hours expire' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.9.5 Set 'Microsoft network server: Server SPN target name validation level' to 'Accept if provided by client' (Scored L1)"

printTestSeparator "2.3.10 MSS"
printTestSeparator "2.3.10.1 Set 'MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.10.2 Set 'MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)' to 'Highest protection, source routing is completely disabled' (Scored L1)"
printTestSeparator "2.3.10.3 Set 'MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)' to 'Highest protection, source routing is completely disabled' (Scored L1)"
printTestSeparator "2.3.10.4 Set 'MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.10.5 Set 'MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)' to '5 or fewer seconds' (Scored L1)"
printTestSeparator "2.3.10.6 Set 'MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning' to '90% or less' (Scored L1)"

printTestSeparator "2.3.11 Network access"
printTestSeparator "2.3.11.1 Set 'Network access: Allow anonymous SID/Name translation' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.11.2 Set 'Network access: Do not allow anonymous enumeration of SAM accounts' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.11.3 Set 'Network access: Do not allow anonymous enumeration of SAM accounts and shares' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.11.4 Set 'Network access: Let Everyone permissions apply to anonymous users' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.11.5 Configure 'Network Access: Named Pipes that can be accessed anonymously' (Scored L1)"
printTestSeparator "2.3.11.6 Set 'Network access: Remotely accessible registry paths' (Scored L1)"
printTestSeparator "2.3.11.7 Set 'Network access: Remotely accessible registry paths and sub-paths' (Scored L1)"
printTestSeparator "2.3.11.8 Set 'Network access: Restrict anonymous access to Named Pipes and Shares' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.11.9 Set 'Network access: Shares that can be accessed anonymously' to 'None' (Scored L1)"
printTestSeparator "2.3.11.10 Set 'Network access: Sharing and security model for local accounts' to 'Classic - local users authenticate as themselves' (Scored L1)"

printTestSeparator "2.3.12 Network security"
printTestSeparator "2.3.12.1 Set 'Network security: Allow Local System to use computer identity for NTLM' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.12.2 Set 'Network security: Allow LocalSystem NULL session fallback' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.12.3 Set 'Network Security: Allow PKU2U authentication requests to this computer to use online identities' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.12.4 Set 'Network Security: Configure encryption types allowed for Kerberos' to 'RC4\AES128\AES256\Future types' (Scored L1)"
printTestSeparator "2.3.12.5 Set 'Network security: Do not store LAN Manager hash value on next password change' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.12.6 Set 'Network security: Force logoff when logon hours expire' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.12.7 Set 'Network security: LAN Manager authentication level' to 'Send NTLMv2 response only. Refuse LM & NTLM' (Scored L1)"
printTestSeparator "2.3.12.8 Set 'Network security: LDAP client signing requirements' to 'Negotiate signing' or higher (Scored L1)"
printTestSeparator "2.3.12.9 Set 'Network security: Minimum session security for NTLM SSP based (including secure RPC) clients' to 'Require NTLMv2 session security,Require 128-bit encryption' (Scored L1)"
printTestSeparator "2.3.12.10 Set 'Network security: Minimum session security for NTLM SSP based (including secure RPC) servers' to 'Require NTLMv2 session security,Require 128-bit encryption' (Scored L1)"

printTestSeparator "2.3.13 Recovery console"
printTestSeparator "2.3.13.1 Set 'Recovery console: Allow automatic administrative logon' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.13.2 Set 'Recovery console: Allow floppy copy and access to all drives and all folders' to 'Disabled' (Scored L1)"

printTestSeparator "2.3.14 Shutdown"
printTestSeparator "2.3.14.1 Set 'Shutdown: Allow system to be shut down without having to log on' to 'Disabled' (Scored L1)"

printTestSeparator "2.3.15 System cryptography"
echo "NA"

printTestSeparator "2.3.16 System objects"
printTestSeparator "2.3.16.1 Set 'System objects: Require case insensitivity for non-Windows subsystems' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.16.2 Set 'System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)' to 'Enabled' (Scored L1)"

printTestSeparator "2.3.17 System settings"
echo "NA"

printTestSeparator "2.3.18 User Account Control"
printTestSeparator "2.3.18.1 Set 'User Account Control: Admin Approval Mode for the Built-in Administrator account' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.18.2 Set 'User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop' to 'Disabled' (Scored L1)"
printTestSeparator "2.3.18.3 Set 'User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode' to 'Prompt for consent on the secure desktop' (Scored L1)"
printTestSeparator "2.3.18.4 Set 'User Account Control: Behavior of the elevation prompt for standard users' to 'Automatically deny elevation requests' (Scored L1)"
printTestSeparator "2.3.18.5 Set 'User Account Control: Detect application installations and prompt for elevation' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.18.6 Set 'User Account Control: Only elevate UIAccess applications that are installed in secure locations' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.18.7 Set 'User Account Control: Run all administrators in Admin Approval Mode' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.18.8 Set 'User Account Control: Switch to the secure desktop when prompting for elevation' to 'Enabled' (Scored L1)"
printTestSeparator "2.3.18.9 Set 'User Account Control: Virtualize file and registry write failures to per-user locations' to 'Enabled' (Scored L1)"

printTestSeparator "3-8"
echo "NA"

printTestSeparator "9 Windows Firewall With Advanced Security"
printTestSeparator "9.1 Domain Profile"
printTestSeparator "9.1.1 Set 'Windows Firewall: Domain: Firewall state' to 'On (recommended)' (Scored L1)"
printTestSeparator "9.1.2 Set 'Windows Firewall: Domain: Inbound connections' to 'Block (default)' (Scored L1)"
printTestSeparator "9.1.3 Set 'Windows Firewall: Domain: Outbound connections' to 'Allow (default)' (Scored L1)"
printTestSeparator "9.1.4 Set 'Windows Firewall: Domain: Display a notification' to 'Yes (default)' (Scored L1)"
printTestSeparator "9.1.5 Set 'Windows Firewall: Domain: Allow unicast response' to 'No' (Scored L1)"
printTestSeparator "9.1.6 Set 'Windows Firewall: Domain: Apply local firewall rules' to 'Yes (default)' (Scored L1)"
printTestSeparator "9.1.7 Set 'Windows Firewall: Domain: Apply local connection security rules' to 'Yes (default)' (Scored L1)"
printTestSeparator "9.1.8 Set 'Windows Firewall: Domain: Logging: Name' to '%SYSTEMROOT%\System32\logfiles\firewall\domainfw.log' (Scored)"
printTestSeparator "9.1.9 Set 'Windows Firewall: Domain: Logging: Size limit (KB)' to '16,384 KB or greater ' (Scored L1)"
printTestSeparator "9.1.10 Set 'Windows Firewall: Domain: Logging: Log dropped packets' to 'Yes' (Scored L1)"
printTestSeparator "9.1.11 Set 'Windows Firewall: Domain: Logging: Log successful connections' to 'Yes' (Scored L1)"

printTestSeparator "9.2 Private Profile"
printTestSeparator "9.2.1 Set 'Windows Firewall: Private: Firewall state' to 'On (recommended)' (Scored L1)"
printTestSeparator "9.2.2 Set 'Windows Firewall: Private: Inbound connections' to 'Block (default)' (Scored L1)"
printTestSeparator "9.2.3 Set 'Windows Firewall: Private: Outbound connections' to 'Allow (default)' (Scored L1)"
printTestSeparator "9.2.4 Set 'Windows Firewall: Private: Display a notification' to 'Yes (default)' (Scored L1)"
printTestSeparator "9.2.5 Set 'Windows Firewall: Private: Allow unicast response' to 'No' (Scored L1)"
printTestSeparator "9.2.6 Set 'Windows Firewall: Private: Apply local firewall rules' to 'Yes (default)' (Scored L1)"
printTestSeparator "9.2.7 Set 'Windows Firewall: Private: Apply local connection security rules' to 'Yes (default)' (Scored L1)"
printTestSeparator "9.2.8 Set 'Windows Firewall: Private: Logging: Name' to '%SYSTEMROOT%\System32\logfiles\firewall\privatefw.log' (Scored L1)"
printTestSeparator "9.2.9 Set 'Windows Firewall: Private: Logging: Size limit (KB)' to '16,384 KB or greater' (Scored L1)"
printTestSeparator "9.2.10 Set 'Windows Firewall: Private: Logging: Log dropped packets' to 'Yes' (Scored L1)"
printTestSeparator "9.2.11 Set 'Windows Firewall: Private: Logging: Log successful connections' to 'Yes' (Scored L1)"

printTestSeparator "9.3 Public Profile"
printTestSeparator "9.3.1 Set 'Windows Firewall: Public: Firewall state' to 'On (recommended)' (Scored L1)"
printTestSeparator "9.3.2 Set 'Windows Firewall: Public: Inbound connections' to 'Block (default)' (Scored L1)"
printTestSeparator "9.3.3 Set 'Windows Firewall: Public: Outbound connections' to 'Allow (default)' (Scored L1)"
printTestSeparator "9.3.4 Set 'Windows Firewall: Public: Display a notification' to 'Yes' (Scored L1)"
printTestSeparator "9.3.5 Set 'Windows Firewall: Public: Allow unicast response' to 'No' (Scored L1)"
printTestSeparator "9.3.6 Set 'Windows Firewall: Public: Apply local firewall rules' to 'Yes (default)' (Scored L1)"
printTestSeparator "9.3.7 Set 'Windows Firewall: Public: Apply local connection security rules' to 'No' (Scored L1)"
printTestSeparator "9.3.8 Set 'Windows Firewall: Public: Logging: Name' to '%SYSTEMROOT%\System32\logfiles\firewall\publicfw.log' (Scored L1)"
printTestSeparator "9.3.9 Set 'Windows Firewall: Public: Logging: Size limit (KB)' to '16,384 KB or greater' (Scored L1)"
printTestSeparator "9.3.10 Set 'Windows Firewall: Public: Logging: Log dropped packets' to 'Yes' (Scored L1)"
printTestSeparator "9.3.11 Set 'Windows Firewall: Public: Logging: Log successful connections' to 'Yes' (Scored L1)"

printTestSeparator "10-16"
echo "NA"

printTestSeparator "17 Advanced Audit Policy Configuration"
printTestSeparator "17.1 Account Logon"
printTestSeparator "17.1.1 Set 'Audit Credential Validation' to 'Success and Failure' (Scored L1)"

printTestSeparator "17.2 Account Management"
printTestSeparator "17.2.1 Set 'Audit Computer Account Management' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.2.2 Set 'Audit Distribution Group Management' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.2.3 Set 'Audit Other Account Management Events' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.2.4 Set 'Audit Security Group Management' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.2.5 Set 'Audit User Account Management' to 'Success and Failure' (Scored L1)"

printTestSeparator "17.3 Detailed Tracking"
printTestSeparator "17.3.1 Set 'Audit Process Creation' to 'Success' (Scored L1)"

printTestSeparator "17.4 DS Access"
printTestSeparator "17.4.1 Set 'Audit Directory Service Access' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.4.2 Set 'Audit Directory Service Changes' to 'Success and Failure' (Scored L1)"

printTestSeparator "17.5 Logon/Logoff"
printTestSeparator "17.5.1 Set 'Audit Account Lockout' to 'Success' (Scored L1)"
printTestSeparator "17.5.2 Set 'Audit Logoff' to 'Success' (Scored L1)"
printTestSeparator "17.5.3 Set 'Audit Logon' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.5.4 Set 'Audit Other Logon/Logoff Events' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.5.5 Set 'Audit Special Logon' to 'Success' (Scored L1)"

printTestSeparator "17.6 Object Access"
printTestSeparator "17.6.1 Set 'Audit Removable Storage' to 'Success and Failure' (Scored L1)"

printTestSeparator "17.7 Policy Change"
printTestSeparator "17.7.1 Set 'Audit Audit Policy Change' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.7.2 Set 'Audit Authentication Policy Change' to 'Success' (Scored L1)"

printTestSeparator "17.8 Privilege Use"
printTestSeparator "17.8.1 Set 'Audit Sensitive Privilege Use' to 'Success and Failure' (Scored L1)"

printTestSeparator "17.9 System"
printTestSeparator "17.9.1 Set 'Audit IPsec Driver' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.9.2 Set 'Audit Other System Events' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.9.3 Set 'Audit Security State Change' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.9.4 Set 'Audit Security System Extension' to 'Success and Failure' (Scored L1)"
printTestSeparator "17.9.5 Set 'Audit System Integrity' to 'Success and Failure' (Scored L1)"

printTestSeparator "18 Administrative Templates (Computer)"
printTestSeparator "18.1 Control Panel"
printTestSeparator "18.1.1 Personalization"
printTestSeparator "18.1.1.1 Set 'Prevent enabling lock screen camera' to 'Enabled' (Scored L1)"
printTestSeparator "18.1.1.2 Set 'Prevent enabling lock screen slide show' to 'Enabled' (Scored L1)"

printTestSeparator "18.2 Network"
echo "NA"

printTestSeparator "18.3 Printers"
echo "NA"

printTestSeparator "18.4 SCM: Pass the Hash Mitigations"
printTestSeparator "18.4.1 Set 'Apply UAC restrictions to local accounts on network logons' to 'Enabled' (Scored L1)"
printTestSeparator "18.4.2 Set 'WDigest Authentication' to 'Disabled' (Scored L1)"

printTestSeparator "18.5 Start Menu and Taskbar"
echo "NA"

printTestSeparator "18.6 System"
printTestSeparator "18.6.1-9"
echo "NA"

printTestSeparator "18.6.10 Early Launch Antimalware"
printTestSeparator "18.6.10.1 Set 'Boot-Start Driver Initialization Policy' to 'Enabled:Good, unknown and bad but critical' (Scored L1)"

printTestSeparator "18.6.11 -16"
echo "NA"


printTestSeparator "18.6.17 Group Policy"
printTestSeparator "18.6.17.1 Logging and tracing"
printTestSeparator "18.6.17.2 Set 'Configure registry policy processing: Do not apply during periodic background processing' to 'False' (Scored L1)"
printTestSeparator "18.6.17.3 Set 'Configure registry policy processing: Process even if the Group Policy objects have not changed' to 'True' (Scored L1)"

printTestSeparator "18.6.18 Internet Communication Management"
printTestSeparator "18.6.18.1 Internet Communication settings"
printTestSeparator "18.6.18.1.1 Set 'Turn off downloading of print drivers over HTTP' to 'Enabled' (Scored L1)"
printTestSeparator "18.6.18.1.2 Set 'Turn off Internet download for Web publishing and online ordering wizards' to 'Enabled' (Scored L1)"
printTestSeparator "18.6.18.1.3 Set 'Turn off printing over HTTP' to 'Enabled' (Scored L1)"
printTestSeparator "18.6.18.1.4 Set 'Turn off Search Companion content file updates' to 'Enabled' (Scored L1)"
printTestSeparator "18.6.18.1.5 Set 'Turn off the "Publish to Web" task for files and folders' to 'Enabled' (Scored L1)"
printTestSeparator "18.6.18.1.6 Set 'Turn off the Windows Messenger Customer Experience Improvement Program' to 'Enabled' (Scored L1)"

printTestSeparator "18.6.19 iSCSI"
echo "NA"

printTestSeparator "18.6.20 KDC"
echo "NA"

printTestSeparator "18.6.21 Kerberos"
echo "NA"

printTestSeparator "18.6.22 Locale Services"
echo "NA"

printTestSeparator "18.6.23 Logon"
printTestSeparator "18.6.23.1 Set 'Do not display network selection UI' to 'Enabled' (Scored)"


printTestSeparator "18.6.24 Net Logon"
echo "NA"

printTestSeparator "18.6.25 Performance Control Panel"
echo "NA"

printTestSeparator "18.6.26 Power Managment"
echo "NA"

printTestSeparator "18.6.27 Recovery"
echo "NA"

printTestSeparator "18.6.28 Remote Assistance"
printTestSeparator "18.6.28.1 Set 'Configure Offer Remote Assistance' to 'Disabled' (Scored L1)"
printTestSeparator "18.6.28.2 Set 'Configure Solicited Remote Assistance' to 'Disabled' (Scored L1)"

printTestSeparator "18.6.29 Remote Procedure Call"
printTestSeparator "18.6.29.1 Set 'Enable RPC Endpoint Mapper Client Authentication' to 'Enabled' (Scored L1)"

printTestSeparator "18.7 Windows Components"
printTestSeparator "18.7.1 -4"
echo "NA"

printTestSeparator "18.7.5 App runtime"
printTestSeparator "18.7.5.1 Set 'Allow Microsoft accounts to be optional' to 'Enabled' (Scored)"

printTestSeparator "18.7.6 Application Compatibility"
echo "NA"

printTestSeparator "18.7.7 AutoPlay Policies"
printTestSeparator "18.7.7.1 Set 'Turn off Autoplay' to 'Enabled:All drives' (Scored L1)"

printTestSeparator "18.7.8 -16"
echo "NA"


printTestSeparator "18.7.17 EMET"
printTestSeparator "18.7.17.1 Ensure EMET is installed (Scored)"
printTestSeparator "18.7.17.2 Set 'Default Protections for Internet Explorer' to 'Enabled' (Scored)"
printTestSeparator "18.7.17.3 Set 'Default Protections for Popular Software' to 'Enabled' (Scored)"
printTestSeparator "18.7.17.4 Set 'Default Protections for Recommended Software' to 'Enabled' (Scored L1)"
printTestSeparator "18.7.17.5 Set 'System ASLR' to 'Enabled:Application Opt-In' (Scored L1)"
printTestSeparator "18.7.17.6 Set 'System DEP' to 'Enabled:Application Opt-Out' (Scored L1)"
printTestSeparator "18.7.17.7 Set 'System SEHOP' to 'Enabled:Application Opt-Out' (Scored L1)"

printTestSeparator "18.7.18 Event Forwarding"
echo "NA"

printTestSeparator "18.7.19 Event Log Service"
echo "NA"

printTestSeparator "18.7.19.1 Application"
printTestSeparator "18.7.19.1.1 Set 'Application: Control Event Log behavior when the log file reaches its maximum size' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.19.1.2 Set 'Application: Maximum Log Size (KB)' to 'Enabled:32,768 or greater' (Scored L1)"

printTestSeparator "18.7.19.2 Security"
printTestSeparator "18.7.19.2.1 Set 'Security: Control Event Log behavior when the log file reaches its maximum size' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.19.2.2 Set 'Security: Maximum Log Size (KB)' to 'Enabled:196,608 or greater' (Scored L1)"

printTestSeparator "18.7.19.3 Setup"
printTestSeparator "18.7.19.3.1 Set 'Setup: Control Event Log behavior when the log file reaches its maximum size' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.19.3.2 Set 'Setup: Maximum Log Size (KB)' to 'Enabled:32,768 or greater' (Scored L1)"

printTestSeparator "18.7.19.4 System"
printTestSeparator "18.7.19.4.1 Set 'System: Control Event Log behavior when the log file reaches its maximum size' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.19.4.2 Set 'System: Maximum Log Size (KB)' to 'Enabled:32,768 or greater' (Scored L1)"

printTestSeparator "18.7.20 -38"
echo "NA"

printTestSeparator "18.7.39 Remote Desktop Services (formerly Terminal Services)"
printTestSeparator "18.7.39.1 RD Licensing"
echo "NA"

printTestSeparator "18.7.39.2 Remote Desktop Connection Client"
echo "NA"

printTestSeparator "18.7.39.2.1 RemoteFX USB Device Redirection"
printTestSeparator "18.7.39.2.2 Set 'Do not allow passwords to be saved' to 'Enabled' (Scored L1)"

printTestSeparator "18.7.39.3 Remote Desktop Session Host"
printTestSeparator "18.7.39.3.1 Application Compatibility"
echo "NA"

printTestSeparator "18.7.39.3.2 Connections"
echo "NA"

printTestSeparator "18.7.39.3.3 Device and Resource Redirection"
printTestSeparator "18.7.39.3.3.1 Set 'Do not allow drive redirection' to 'Enabled' (Scored L1)"

printTestSeparator "18.7.39.3.4 -8"
echo "NA"

printTestSeparator "18.7.39.3.9 Security"
printTestSeparator "18.7.39.3.9.1 Set 'Always prompt for password upon connection' to 'Enabled' (Scored L1)"
printTestSeparator "18.7.39.3.9.2 Set 'Set client connection encryption level: Encryption Level' to 'Enabled: High Level' (Scored L1)"

printTestSeparator "18.7.40 RSS Feeds"
echo "NA"

printTestSeparator "18.7.41 Search"
echo "NA"

printTestSeparator "18.7.41.1 OCR"
printTestSeparator "18.7.41.2 Set 'Allow indexing of encrypted files' to 'Disabled' (Scored L1)"

printTestSeparator "18.7.42 -55"
echo "NA"

printTestSeparator "18.7.56 Windows Installer"
printTestSeparator "18.7.56.1 Set 'Always install with elevated privileges' to 'Disabled' (Scored L1)"

printTestSeparator "18.7.57 Windows Logon Options"
printTestSeparator "18.7.57.1 Set 'Sign-in last interactive user automatically after a system-initiated restart' to 'Disabled' (Scored L1)"

printTestSeparator "18.7.58 Windows Mail"
echo "NA"

printTestSeparator "18.7.59 - 66 NA"

printTestSeparator "18.7.67 Windows Remote Management (WinRM)"
printTestSeparator "18.7.67.1 WinRM Client"
printTestSeparator "18.7.67.1.1 Set 'Allow Basic authentication' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.67.1.2 Set 'Allow unencrypted traffic' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.67.1.3 Set 'Disallow Digest authentication' to 'Enabled' (Scored L1)"

printTestSeparator "18.7.67.2 WinRM Service"
printTestSeparator "18.7.67.2.1 Set 'Allow Basic authentication' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.67.2.2 Set 'Allow unencrypted traffic' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.67.2.3 Set 'Disallow WinRM from storing RunAs credentials' to 'Enabled' (Scored L1)"

printTestSeparator "18.7.68 - 70 NA"

printTestSeparator "18.7.71 Windows Update"
printTestSeparator "18.7.71.1 Set 'Configure Automatic Updates' to 'Enabled' (Scored L1)"
printTestSeparator "18.7.71.2 Set 'Configure Automatic Updates: Scheduled install day' to '0 - Every day' (Scored L1)"
printTestSeparator "18.7.71.3 Set 'Do not adjust default option to 'Install Updates and Shut Down' in Shut Down Windows dialog box' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.71.4 Set 'Do not display 'Install Updates and Shut Down' option in Shut Down Windows dialog box' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.71.5 Set 'No auto-restart with logged on users for scheduled automatic updates installations' to 'Disabled' (Scored L1)"
printTestSeparator "18.7.71.6 Set 'Reschedule Automatic Updates scheduled installations' to 'Enabled:1 minute' (Scored L1)"

printTestSeparator "19 Administrative Templates (User)"
printTestSeparator "19.1 Control Panel"
printTestSeparator "19.1.1 Add or Remove Programs"
echo "NA"

printTestSeparator "19.1.2 Display"
echo "NA"

printTestSeparator "19.1.3 Personalization"
printTestSeparator "19.1.3.1 Set 'Enable screen saver' to 'Enabled' (Scored L1)"
printTestSeparator "19.1.3.2 Set 'Force specific screen saver: Screen saver executable name' to 'Enabled:scrnsave.scr' (Scored L1)"
printTestSeparator "19.1.3.3 Set 'Password protect the screen saver' to 'Enabled' (Scored L1)"
printTestSeparator "19.1.3.4 Set 'Screen saver timeout' to 'Enabled:900 seconds or fewer ', but not 0 (Scored L1)"

printTestSeparator "19.2 - 6"
echo "NA"

printTestSeparator "19.7.1 Add features to Windows 8.1"
echo "NA"

printTestSeparator "19.7.2 App runtime"
echo "NA"

printTestSeparator "19.7.3 Application Compatibility"
echo "NA"

printTestSeparator "19.7.4 Attachment Manager"
printTestSeparator "19.7.4.1 Set 'Do not preserve zone information in file attachments' to 'Disabled' (Scored L1)"
printTestSeparator "19.7.4.2 Set 'Notify antivirus programs when opening attachments' to 'Enabled' (Scored L1)"

printTestSeparator "19.7.5 AutoPlay Policies"
echo "NA"


printTestSeparator "19.7.6-34 NA"

printTestSeparator "19.7.35 Windows Installer"
printTestSeparator "19.7.35.1 Set 'Always install with elevated privileges' to 'Disabled' (Scored L1)"
Stop-Transcript
