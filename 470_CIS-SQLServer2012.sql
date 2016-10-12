select "***CIS Ref: SQLServer 2012 – CIS Benchmark***" from table;
select "--------------------------------------------------------------------------------------" from table;



select "***CIS Ref: 1 Installation, Updates and Patches***" from table;

select "***CIS Ref: 1.1 Install the Latest SQL Server Service Packs and Hotfixes (Not Scored)***" from table;
SELECT SERVERPROPERTY('ProductLevel') as SP_installed, SERVERPROPERTY('ProductVersion') as Version;
select "******Expect: Compare against published build levels." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 1.2 Install on dedicated single-function member servers (Not Scored)***" from table;
--Visual Review
select "******Expect: Ensure that no other roles are enabled for the underlying operating system and that no excess tooling is installed, per enterprise policy." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2 Surface Area Reduction***" from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.1 Set the 'Ad Hoc Distributed Queries' Server Configuration Option to 0 (Scored)***" from table;
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'ad hoc distributed queries';
select "******Expect: Both value columns must show 0." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.2 Set the 'CLR Enabled' Server Configuration Option to 0 (Scored)***" from table;
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'clr enabled';
select "******Expect: Both value columns must show 0." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.3 Set the 'Cross DB Ownership Chaining' Server Configuration Option to 0 (Scored)***" from table;
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'Cross db ownership chaining';
select "******Expect: Both value columns must show 0." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.4 Set the 'Database Mail XPs' Server Configuration Option to 0 (Scored)***" from table;
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'Database Mail XPs';
select "******Expect: Both value columns must show 0." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.5 Set the 'Ole Automation Procedures' Server Configuration Option to 0 (Scored)***" from table;
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'Ole Automation Procedures';
select "******Expect: Both value columns must show 0." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.6 Set the 'Remote Access' Server Configuration Option to 0 (Scored)***" from table;
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'Remote access';
select "******Expect: Both value columns must show 0." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.7 Set the 'Remote Admin Connections' Server Configuration Option to 0 (Scored)***" from table;
USE master; GO SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'Remote admin connections' AND SERVERPROPERTY('IsClustered') = 0;
select "******Expect: If no data is returned, the instance is a cluster and this recommendation is not applicable. If data is returned, then both the value columns must show 0." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.8 Set the 'Scan For Startup Procs' Server Configuration Option to 0 (Scored)***" from table;
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'Scan for startup procs';
select "******Expect: Both value columns must show 0." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.9 Set the 'Trustworthy' Database Property to Off (Scored)***" from table;
SELECT name FROM sys.databases WHERE is_trustworthy_on = 1 AND name != 'msdb' AND state = 0;
select "******Expect: No rows should be returned." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.10 Disable Unnecessary SQL Server Protocols (Not Scored)***" from table;
--Visual Review
select "******Expect: Open SQL Server Configuration Manager; go to the SQL Server Network Configuration. Ensure that only required protocols are enabled." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.11 Configure SQL Server to use non-standard ports (Not Scored)***" from table;
-- Powershell > netstat -ano|select-string 1433.+listening
select "******Expect: No rows should be returned." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.12 Set the 'Hide Instance' option to 'Yes' for Production SQL Server instances(Scored)***" from table;
--visual Review
select "******Expect: In SQL Server Configuration Manager, expand SQL Server Network Configuration, right-click Protocols for <server instance>, and then select Properties.
2. On the Flags tab, in the Hide Instance box, select Yes, and then click OK to close the dialog box. The change takes effect immediately for new connections." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.13 Disable the 'sa' Login Account (Scored)***" from table;
SELECT name, is_disabled FROM sys.server_principals WHERE sid = 0x01;
select "******Expect: " from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.14 Rename the 'sa' Login Account (Scored)***" from table;
SELECT name FROM sys.server_principals WHERE sid = 0x01;
select "******Expect: A name of sa indicates the account has not been renamed." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 2.15 Set the 'xp_cmdshell' Server Configuration Option to 0 (Scored)***" from table;
EXECUTE sp_configure 'show advanced options',1; RECONFIGURE WITH OVERRIDE; EXECUTE sp_configure 'xp_cmdshell';
select "******Expect: " from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 3 Authentication and Authorization***" from table;

select "***CIS Ref: 3.1 Set The 'Server Authentication' Property To Windows Authentication mode (Scored)***" from table;
xp_loginconfig 'login mode';
select "******Expect: A config_value of Windows NT Authentication indicates the Server Authentication property is set to Windows Authentication mode" from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 3.2 Revoke CONNECT permissions on the 'guest user' within all SQLServer databases excluding the master, msdb and tempdb (Scored)***" from table;
USE [database_name]; GO SELECT DB_NAME() AS DBName, dpr.name, dpe.permission_name FROM sys.database_permissions dpe JOIN sys.database_principals dpr ON dpe.grantee_principal_id=dpr.principal_id WHERE dpr.name='guest' AND dpe.permission_name='CONNECT';
select "******Expect: No rows should be returned." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 3.3 Drop Orphaned Users From SQL Server Databases (Scored)***" from table;
EXEC sp_change_users_login @Action='Report';
select "******Expect: No rows should be returned." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 4 Password Policies***" from table;

select "***CIS Ref: 4.1 Set the 'MUST_CHANGE' Option to ON for All SQL Authenticated Logins (Not Scored)***" from table;
--Visual Review
select "******Expect: 1. Open SQL Server Management Studio.
2. Open Object Explorer and connect to the target instance.
3. Navigate to the Logins tab in Object Explorer and expand. Right click on the desired login and select Properties.
4. Verify the User must change password at next login checkbox is checked" from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 4.2 Set the 'CHECK_EXPIRATION' Option to ON for All SQL Authenticated Logins Within the Sysadmin Role (Scored)***" from table;
SELECT l.[name], 'sysadmin membership' AS 'Access_Method' FROM sys.sql_logins AS l WHERE IS_SRVROLEMEMBER('sysadmin',name) = 1 AND l.is_expiration_checked <> 1 UNION ALL SELECT l.[name], 'CONTROL SERVER' AS 'Access_Method' FROM sys.sql_logins AS l JOIN sys.server_permissions AS p ON l.principal_id = p.grantee_principal_id WHERE p.type = 'CL' AND p.state IN ('G', 'W') AND l.is_expiration_checked <> 1;
select "******Expect: No rows should be returned." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 4.3 Set the 'CHECK_POLICY' Option to ON for All SQL Authenticated Logins (Scored)***" from table;
SELECT name, is_disabled FROM sys.sql_logins WHERE is_policy_checked = 0;
select "******Expect: If no rows are returned then either no SQL Authenticated logins exist or they all have 'CHECK_POLICY' ON." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 5 Auditing and Logging***" from table;


select "***CIS Ref: 5.1 Set the 'Maximum number of error log files' setting to greater than or equal to 12 (Not Scored)***" from table;
--Visual
select "******Expect: 1. Open SQL Server Management Studio.
2. Open Object Explorer and connect to the target instance.
3. Navigate to the Management tab in Object Explorer and expand. Right click on the SQL Server Logs file and select Configure.
4. Verify the Limit the number of error log files before they are recycled checkbox is checked
5. Verify the Maximum number of error log files is greater than or equal to 12" from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 5.2 Set the 'Default Trace Enabled' Server Configuration Option to 1 (Scored)***" from table;
SELECT name, CAST(value as int) as value_configured, CAST(value_in_use as int) as value_in_use FROM sys.configurations WHERE name = 'Default trace enabled';
select "******Expect: Both value columns must show 1." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 5.3 Set 'Login Auditing' to failed logins (Not Scored)***" from table;
XP_loginconfig 'audit level';
select "******Expect: A config_value of 'failure' indicates a server login auditing setting of 'Failed logins only'." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 5.4 Use SQL Server Audit to capture both failed and successful logins (Not Scored)***" from table;
SELECT S.name AS 'Audit Name' , CASE S.is_state_enabled WHEN 1 THEN 'Y' WHEN 0 THEN 'N' END AS 'Audit Enabled' , S.type_desc AS 'Write Location' , SA.name AS 'Audit Specification Name' , CASE SA.is_state_enabled WHEN 1 THEN 'Y' WHEN 0 THEN 'N' END AS 'Audit Specification Enabled' , SAD.audit_action_name , SAD.audited_result FROM sys.server_audit_specification_details AS SAD JOIN sys.server_audit_specifications AS SA ON SAD.server_specification_id = SA.server_specification_id JOIN sys.server_audits AS S ON SA.audit_guid = S.audit_guid WHERE SAD.audit_action_id IN ('CNAU', 'LGFL', 'LGSD');
select "******Expect: The result set should contain 3 rows, one for the following audit_action_names: 1) AUDIT_CHANGE_GROUP, 2) FAILED_LOGIN_GROUP, 3) SUCCESSFUL_LOGIN_GROUP
Both the Audit and Audit specification should be enabled and the audited_result should include both success and failure." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 6 Application Development***" from table;

select "***CIS Ref: 6.1 Sanitize Database and Application User Input (Not Scored)***" from table;
--Interview
select "******Expect: Check with the application teams to ensure any database interaction is through the use of stored procedures and not dynamic SQL. Revoke any INSERT, UPDATE, or DELETE privileges to users so that modifications to data must be done through stored procedures. Verify that there's no SQL query in the application code produced by string concatenation." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 6.2 Set the 'CLR Assembly Permission Set' to SAFE_ACCESS for All CLR Assemblies (Scored)***" from table;
SELECT name, permission_set_desc FROM sys.assemblies where is_user_defined = 1;
select "******Expect: All the returned assemblies should show SAFE_ACCESS in the permission_set_desc column." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 7 Encryption***" from table;


select "***CIS Ref: 7.1 Ensure Symmetric Key encryption algorithm is AES_128 or higher in non-system databases (Scored)***" from table;
USE [dbname] GO SELECT db_name() AS Database_Name, name AS Key_Name FROM sys.symmetric_keys WHERE algorithm_desc NOT IN ('AES_128','AES_192','AES_256') AND db_id() > 4; GO
select "******Expect: No rows returned" from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 7.2 Ensure asymmetric key size is greater than or equal to 2048 in non-system databases (Scored)***" from table;
USE [dbname] GO SELECT db_name() AS Database_Name, name AS Key_Name FROM sys.asymmetric_keys WHERE key_length < 2048 AND db_id() > 4; GO
select "******Expect: For compliance, no rows should be returned." from table;
select "--------------------------------------------------------------------------------------" from table;




select "***CIS Ref: 8 Appendix: Additional Considerations***" from table;


select "***CIS Ref: 8.1 SQL Server Browser Service (Not Scored)***" from table;
--No Audit
select "******Expect: " from table;
select "--------------------------------------------------------------------------------------" from table;




