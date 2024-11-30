#include-once

#Region AutoIt3Wrapper Directives Section
;===============================================================================================================
; Tidy Settings
;===============================================================================================================
;#AutoIt3Wrapper_Run_Tidy=Y										 ;~ (Y/N) Run Tidy before compilation. Default=N
;#AutoIt3Wrapper_Tidy_Stop_OnError=Y								 ;~ (Y/N) Continue when only Warnings. Default=Y

#EndRegion AutoIt3Wrapper Directives Section


; #INDEX# =======================================================================================================================
; Title .........: Localization (Custom)
; AutoIt Version : 3.3.15.0
; Language ......: English
; Description ...: Localization Functions.
; Author(s) .....: Derick Payne (Rizonesoft)
; ===============================================================================================================================


; #CONSTANTS# ===================================================================================================================
Global Const $LNG_COUNTABOUT = 23
Global Const $LNG_COUNTDONATE = 10
Global Const $LNG_COUNTFILE = 25
Global Const $LNG_COUNTLOGGING = 99
Global Const $LNG_COUNTMESSAGES = 50
Global Const $LNG_COUNTUPDATE = 12
Global Const $LNG_COUNTVERSIONING = 4
Global Const $LNG_COUNTCUSTOM = 102
Global Const $LNG_COUNTMENUS = 102
Global Const $LNG_COUNTMESSAGES2 = 10
Global Const $LNG_COUNTPREFERENCES = 102
; ===============================================================================================================================

; #VARIABLES# ===================================================================================================================
If Not IsDeclared("g_sLanguageFile") Then Global $g_sLanguageFile
If Not IsDeclared("g_sCompanyName") Then Global $g_sCompanyName
If Not IsDeclared("g_sProgShortName") Then Global $g_sProgShortName
If Not IsDeclared("g_sProgShortName_X64") Then Global $g_sProgShortName_X64
If Not IsDeclared("g_sProgName") Then Global $g_sProgName
If Not IsDeclared("g_aLangAbout") Then Global $g_aLangAbout[$LNG_COUNTABOUT]
If Not IsDeclared("g_aLangDonate") Then Global $g_aLangDonate[$LNG_COUNTDONATE]
If Not IsDeclared("g_aLangFile") Then Global $g_aLangFile[$LNG_COUNTFILE]
If Not IsDeclared("g_aLangLogging") Then Global $g_aLangLogging[$LNG_COUNTLOGGING]
If Not IsDeclared("g_aLangMessages") Then Global $g_aLangMessages[$LNG_COUNTMESSAGES]
If Not IsDeclared("g_aLangUpdate") Then Global $g_aLangUpdate[$LNG_COUNTUPDATE]
If Not IsDeclared("g_aLangVersioning") Then Global $g_aLangVersioning[$LNG_COUNTVERSIONING]
If Not IsDeclared("g_sLanguageFile") Then Global $g_sLanguageFile
If Not IsDeclared("g_aLangCustom") Then Global $g_aLangCustom[$LNG_COUNTCUSTOM]
If Not IsDeclared("g_aLangMenus") Then Global $g_aLangMenus[$LNG_COUNTMENUS]
If Not IsDeclared("g_aLangMessages2") Then Global $g_aLangMessages2[$LNG_COUNTMESSAGES2]
If Not IsDeclared("g_aLangPreferences") Then Global $g_aLangPreferences[$LNG_COUNTPREFERENCES]

; Cache for replaced variables
Global $g_aLocalizationCache[1][3]  ; [key][section, original, replaced]
Global $g_iLocalizationCacheSize = 0
Global $g_sLocalizationCacheKey = ""
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
; ===============================================================================================================================

Func _Localization_About()

	;~ Check if the language strings is already loaded. Because we do not want to load the language strings twice.
	If StringLen($g_aLangAbout[0]) > 0 Then
		Return
	EndIf

	$g_aLangAbout[0]  = _Localization_Load("About", "Window_Title", "About %{Program.Name}")
	$g_aLangAbout[1]  = _Localization_Load("About", "Label_Version", "Version")
	$g_aLangAbout[2]  = _Localization_Load("About", "Label_AutoIt", "Build with AutoIt version")
	$g_aLangAbout[3]  = _Localization_Load("About", "Label_Copyright", "Copyright")
	$g_aLangAbout[4]  = _Localization_Load("About", "Tip_Title_Donate", "Donate")
	$g_aLangAbout[5]  = _Localization_Load("About", "Tip_Message_Donate", "Would you consider a small gift of $10 to help us\rnkeep the lights on and make quality free software? Click here to donate.")
	$g_aLangAbout[6]  = _Localization_Load("About", "Label_Home", "Homepage")
	$g_aLangAbout[7]  = _Localization_Load("About", "Label_License", "License")
	$g_aLangAbout[8]  = _Localization_Load("About", "Label_Support", "Get Support")
	$g_aLangAbout[9]  = _Localization_Load("About", "Tip_Title_Country", "Made in South Africa")
	$g_aLangAbout[10] = _Localization_Load("About", "Tip_Message_Country", "%{Program.Name} was born in South Africa.")
	$g_aLangAbout[11] = _Localization_Load("About", "Label_Contributors", "Contributors")
	$g_aLangAbout[12] = _Localization_Load("About", "Tip_Twitter", "Follow us on Twitter.")
	$g_aLangAbout[13] = _Localization_Load("About", "Tip_Facebook", "Like us on Facebook.")
	$g_aLangAbout[14] = _Localization_Load("About", "Tip_Reddit", "Read about us on Reddit.")
	$g_aLangAbout[15] = _Localization_Load("About", "Tip_LinkedIn", "Connect with us on LinkedIn.")
	$g_aLangAbout[16] = _Localization_Load("About", "Tip_GitHub", "%{Program.Name} on GitHub.")
	$g_aLangAbout[17] = _Localization_Load("About", "Tip_WhatsApp", "Chat with us on WhatsApp.")
	$g_aLangAbout[18] = _Localization_Load("About", "Button_Ok", "Ok")
	$g_aLangAbout[19] = _Localization_Load("About", "Label_RAM", "(RAM) %d MB FREE OF %d MB (%d%)")
	$g_aLangAbout[20] = _Localization_Load("About", "Label_HDD", "(%s) %.2f GB FREE OF %.2f GB (%d%)")

EndFunc   ;==>_Localization_About


Func _Localization_Donate()

	If StringLen($g_aLangDonate[0]) > 0 Then
		Return
	EndIf

	$g_aLangDonate[0] = _Localization_Load("Donate", "Label_Heading", "%{Program.Name} has been serving you for over %d hours. Now, how about a small donation?")
	$g_aLangDonate[1] = _Localization_Load("Donate", "Label_Message", "Click on the PayPal button below, choose an amount, and send us the donation. Your donation will be used to improve our software and keep everything free on Rizonesoft. A $20 donation will keep us going for at least a month.")
	$g_aLangDonate[2] = _Localization_Load("Donate", "Label_Donate", "Would you consider a small gift of $10 to help us improve %{Program.Name} and keep the lights on?")

EndFunc


Func _Localization_File()

	If StringLen($g_aLangFile[0]) > 0 Then
		Return
	EndIf

	$g_aLangFile[0]  = _Localization_Load("File", "Backup_Saving", "Saving '%s'.")
	$g_aLangFile[1]  = _Localization_Load("File", "Backup_Success", "The directory was successfully saved to '%s'.")
	$g_aLangFile[2]  = _Localization_Load("File", "Backup_Continue", "We will now continue with removing it.")
	$g_aLangFile[3]  = _Localization_Load("File", "Backup_Error_01", "'%s' could not be saved.")
	$g_aLangFile[4]  = _Localization_Load("File", "Backup_Error_02", "To avoid data loss, this directory will not be removed.")
	$g_aLangFile[5]  = _Localization_Load("File", "CleanDir_Clearing", "Clearing '%s'.")
	$g_aLangFile[6]  = _Localization_Load("File", "CleanDir_Error_01", "Directory Path")
	$g_aLangFile[7]  = _Localization_Load("File", "CleanDir_Error_02", "Nothing Here '%s'")
	$g_aLangFile[8]  = _Localization_Load("File", "CleanDir_Error_03", "'%s' could not be removed.")
	$g_aLangFile[9]  = _Localization_Load("File", "CleanDir_Attributes", "Setting attributes for '%s'.")
	$g_aLangFile[10] = _Localization_Load("File", "CleanDir_Success", "Successfully removed '%s'.")
	$g_aLangFile[11] = _Localization_Load("File", "Delete_Removing", "Removing '%s'.")
	$g_aLangFile[12] = _Localization_Load("File", "Delete_Success", "The file was successfully deleted.")
	$g_aLangFile[13] = _Localization_Load("File", "Delete_Error", "An error occurred whilst deleting the file.")
	$g_aLangFile[14] = _Localization_Load("File", "OpenText_Opening", "Opening '%s'")
	$g_aLangFile[15] = _Localization_Load("File", "OpenText_Success", "Showing '%s' file.")
	$g_aLangFile[16] = _Localization_Load("File", "OpenText_Error", "Could not find the '%s' file.")

EndFunc


Func _Localization_Logging()

	If StringLen($g_aLangLogging[0]) > 0 Then
		Return
	EndIf

	$g_aLangLogging[0]  = _Localization_Load("Logging", "Finished", "Finished")
	$g_aLangLogging[1]  = _Localization_Load("Logging", "success", "success")
	$g_aLangLogging[2]  = _Localization_Load("Logging", "Response_Received", "Response Received")
	$g_aLangLogging[3]  = _Localization_Load("Logging", "Successfully", "Successfully")
	$g_aLangLogging[4]  = _Localization_Load("Logging", "OK", "OK!")
	$g_aLangLogging[5]  = _Localization_Load("Logging", "Registration_succeeded", "Registration succeeded")
	$g_aLangLogging[6]  = _Localization_Load("Logging", "Initiated", "Initiated")
	$g_aLangLogging[7]  = _Localization_Load("Logging", "Error", "error")
	$g_aLangLogging[8]  = _Localization_Load("Logging", "Failed", "failed")
	$g_aLangLogging[9]  = _Localization_Load("Logging", "Access_Denied", "Access is denied")
	$g_aLangLogging[10] = _Localization_Load("Logging", "No_Operation_Performed", "No operation can be performed")
	$g_aLangLogging[11] = _Localization_Load("Logging", "VERSION", "VERSION")
	$g_aLangLogging[12] = _Localization_Load("Logging", "File_Not_Found", "Could not find the '%s' log File")
	$g_aLangLogging[13] = _Localization_Load("Logging", "Showing_File", "Showing '%s' log File.")
	$g_aLangLogging[14] = _Localization_Load("Logging", "Showing_Error", "Something went wrong: Process ID: %s")
	$g_aLangLogging[15] = _Localization_Load("Logging", "Opening_File", "Opening the log File")
	$g_aLangLogging[16] = _Localization_Load("Logging", "Opening_Directory", "Opening the log Folder...")
	$g_aLangLogging[17] = _Localization_Load("Logging", "Directory_Not_Found", "Could not find the '%s' log Directory")
	$g_aLangLogging[18] = _Localization_Load("Logging", "Showing_Directory", "Showing '%s' log Directory")
	$g_aLangLogging[19] = _Localization_Load("Logging", "Bool_Yes", "Yes")
	$g_aLangLogging[20] = _Localization_Load("Logging", "Bool_No", "No")
	$g_aLangLogging[21] = _Localization_Load("Logging", "Info_Date", "Date:")
	$g_aLangLogging[22] = _Localization_Load("Logging", "Info_Program", "Program:")
	$g_aLangLogging[23] = _Localization_Load("Logging", "Info_Program_Path", "Program Path:")
	$g_aLangLogging[24] = _Localization_Load("Logging", "Info_Compiled", "Compiled:")
	$g_aLangLogging[25] = _Localization_Load("Logging", "Info_AutoIt_Version", "AutoIt Version:")
	$g_aLangLogging[26] = _Localization_Load("Logging", "Info_AutoIt_64Bit", "AutoIt 64-Bit Version:")
	$g_aLangLogging[27] = _Localization_Load("Logging", "Info_Windows_Version", "Windows Version:")
	$g_aLangLogging[28] = _Localization_Load("Logging", "Info_System_Type", "System Type:")
	$g_aLangLogging[29] = _Localization_Load("Logging", "Info_Memory", "Memory (RAM):")
	$g_aLangLogging[30] = _Localization_Load("Logging", "Info_ProgramFiles", "Program Files Directory:")
	$g_aLangLogging[31] = _Localization_Load("Logging", "Info_Windows_Directory", "Windows Directory:")
	$g_aLangLogging[32] = _Localization_Load("Logging", "Level_Error", "Error:")
	$g_aLangLogging[33] = _Localization_Load("Logging", "Level_Warning", "Warning:")
	$g_aLangLogging[34] = _Localization_Load("Logging", "Level_Success", "Success:")
	$g_aLangLogging[35] = _Localization_Load("Logging", "Level_Finished", "Finished:")
	$g_aLangLogging[36] = _Localization_Load("Logging", "Level_Clean", "Clean:")

EndFunc


Func _Localization_Messages()

	If StringLen($g_aLangMessages[0]) > 0 Then
		Return
	EndIf

	$g_aLangMessages[0]  = _Localization_Load("Messages", "Info_Title", "Please Take Note")
	$g_aLangMessages[1]  = _Localization_Load("Messages", "Warning_Title", "Warning!")
	$g_aLangMessages[2]  = _Localization_Load("Messages", "Error_Title", "Oops! Something went wrong!")
	$g_aLangMessages[3]  = _Localization_Load("Messages", "Error_Oops", "Oops!")
	$g_aLangMessages[4]  = _Localization_Load("Messages", "Singleton", "Another occurence of %{Program.Name} is already running.")
	$g_aLangMessages[5]  = _Localization_Load("Messages", "Compatible", "%{Program.Name} is not compatable with your version of windows. If you believe this to be an error, please feel free to leave a message at '%s' with all the details.")
	$g_aLangMessages[6]  = _Localization_Load("Messages", "Compatible_Bit", "Unfortuantely %{Program.Name} 32 Bit is not compatible with your Windows version. Please download %{Program.Name} 64 Bit from '%s'")
	$g_aLangMessages[7]  = _Localization_Load("Messages", "Loading_Initializing", "Initializing %{Program.Name}")
	$g_aLangMessages[8]  = _Localization_Load("Messages", "Loading_Localizations", "Loading Localizations")
	$g_aLangMessages[9]  = _Localization_Load("Messages", "Loading_Resources", "Setting Resources")
	$g_aLangMessages[10] = _Localization_Load("Messages", "Loading_WorkingDirectories", "Setting Working Directories")
	$g_aLangMessages[11] = _Localization_Load("Messages", "Loading_Configuration", "Loading Configuration")
	$g_aLangMessages[12] = _Localization_Load("Messages", "Loading_Logging", "Initializing Logging")
	$g_aLangMessages[13] = _Localization_Load("Messages", "Loading_Shortcuts", "Setting Keyboard Shortcuts")
	$g_aLangMessages[14] = _Localization_Load("Messages", "Loading_Interface", "Starting Core Interface")
	$g_aLangMessages[15] = _Localization_Load("Messages", "Ping_Check_Connection", "Checking Internet Connection.")
	$g_aLangMessages[16] = _Localization_Load("Messages", "Ping_Response", "Response Received in %s milliseconds.")
	$g_aLangMessages[17] = _Localization_Load("Messages", "Ping_Host_Offline", "Host is Offline.")
	$g_aLangMessages[18] = _Localization_Load("Messages", "Ping_Host_Unreachable", "Host is Unreachable.")
	$g_aLangMessages[19] = _Localization_Load("Messages", "Ping_Host_Bad", "Bad Destination.")
	$g_aLangMessages[20] = _Localization_Load("Messages", "Ping_Host_No_Internet", "No Internet Connection.")
	$g_aLangMessages[21] = _Localization_Load("Messages", "Global_Errors", "Finished with (%02i) %s!")
	$g_aLangMessages[22] = _Localization_Load("Messages", "Global_Errors_Error", "error")
	$g_aLangMessages[23] = _Localization_Load("Messages", "Global_Errors_Errors", "errors")
	$g_aLangMessages[24] = _Localization_Load("Messages", "Global_Finished", "Completed selected task.")
	$g_aLangMessages[25] = _Localization_Load("Messages", "Global_File", "file")
	$g_aLangMessages[26] = _Localization_Load("Messages", "Global_Files", "files")
	$g_aLangMessages[27] = _Localization_Load("Messages", "RegisterDll_Success", "RegSvr32.exe > '%s' registration succeeded.")
	$g_aLangMessages[28] = _Localization_Load("Messages", "RegisterDll_Error_01", "RegSvr32.exe > '%s' To register a module, you must provide a binary name.")
	$g_aLangMessages[29] = _Localization_Load("Messages", "RegisterDll_Error_02", "RegSvr32.exe > '%s' Specified module not found.")
	$g_aLangMessages[30] = _Localization_Load("Messages", "RegisterDll_Error_03", "RegSvr32.exe > '%s' Module loaded but entry-point DllRegisterServer was not found.")
	$g_aLangMessages[31] = _Localization_Load("Messages", "RegisterDll_Error_04", "RegSvr32.exe > '%s' Error number: 0x80070005")
	$g_aLangMessages[32] = _Localization_Load("Messages", "Registry_Write_Error", "Could not write to '%s'")
	$g_aLangMessages[33] = _Localization_Load("Messages", "Registry_Error_01", "Unable to open requested key.")
	$g_aLangMessages[34] = _Localization_Load("Messages", "Registry_Error_02", "Unable to open requested main key.")
	$g_aLangMessages[35] = _Localization_Load("Messages", "Registry_Error_03", "Unable to open requested value.")
	$g_aLangMessages[36] = _Localization_Load("Messages", "Registry_Error_04", "Value type not supported.")
	$g_aLangMessages[37] = _Localization_Load("Messages", "Registry_Error_05", "Unable to delete requested value.")
	$g_aLangMessages[38] = _Localization_Load("Messages", "Registry_Error_06", "Unable to delete requested key/value.")

EndFunc


Func _Localization_Update()

	If StringLen($g_aLangUpdate[0]) > 0 Then
		Return
	EndIf

	$g_aLangUpdate[0]  = _Localization_Load("Update", "Window_Title_Available", "Update available")
	$g_aLangUpdate[1]  = _Localization_Load("Update", "Window_Title_Congratulations", "Congratulations")
	$g_aLangUpdate[2]  = _Localization_Load("Update", "Window_Title_Error", "Something went wrong!")
	$g_aLangUpdate[3]  = _Localization_Load("Update", "Label_Message_Update", "There is a new version of '%{Program.Name}' available.")
	$g_aLangUpdate[4]  = _Localization_Load("Update", "Label_Message_Latest", "You are using the latest version of '%{Program.Name}'.")
	$g_aLangUpdate[5]  = _Localization_Load("Update", "Label_Message_Error", "Information about the latest version of '%{Program.Name}' could not be retrieved.")
	$g_aLangUpdate[6]  = _Localization_Load("Update", "Label_Message_Internet", "Please check your Internet Connection and try again.")
	$g_aLangUpdate[7]  = _Localization_Load("Update", "Label_Build_Current", "Current Build:")
	$g_aLangUpdate[8]  = _Localization_Load("Update", "Label_Build_Update", "Update Build:")
	$g_aLangUpdate[9]  = _Localization_Load("Update", "CheckBox_NoUpdate", "Do not check for updates at startup.")
	$g_aLangUpdate[10] = _Localization_Load("Update", "Button_Update", "Read more")
	$g_aLangUpdate[11] = _Localization_Load("Update", "Button_Close", "Close")

EndFunc   ;==>_Localization_Update


Func _Localization_Versioning()

	If StringLen($g_aLangVersioning[0]) > 0 Then
		Return
	EndIf

	$g_aLangVersioning[0] = _Localization_Load("Versioning", "Administrator", "Administrator")
	$g_aLangVersioning[1] = _Localization_Load("Versioning", "Build", "Build")
	$g_aLangVersioning[2] = _Localization_Load("Versioning", "AutoIt_Version", "using AutoIt version %{AutoIt.Version}")
	$g_aLangVersioning[3] = _Localization_Load("Versioning", "Bit", "Bit")

EndFunc   ;==>_Localization_Versioning


Func _Localization_Custom()

	;~ Check if the language strings is already loaded. Because we do not want to load the language strings twice.
	If StringLen($g_aLangCustom[0]) > 0 Then
		Return
	EndIf

	$g_aLangCustom[0]  = _Localization_Load("Custom", "Label_Status_Welcome", "Start with loading the browser (select the filename). Firemin will automatically detect the process from the executable you select.")
	$g_aLangCustom[1]  = _Localization_Load("Custom", "Label_Status_Updates", "Checking for Updates")
	$g_aLangCustom[2]  = _Localization_Load("Custom", "Group_Load_Browser", "Load Browser")
	$g_aLangCustom[3]  = _Localization_Load("Custom", "Label_Executable", "Executable Path (%s):")
	$g_aLangCustom[4]  = _Localization_Load("Custom", "Label_Process_Usage", "Process Usage:")
	$g_aLangCustom[5]  = _Localization_Load("Custom", "Label_Process_Count", "Process Peak:")
	$g_aLangCustom[6]  = _Localization_Load("Custom", "Button_Browse", "&Browse")
	$g_aLangCustom[7]  = _Localization_Load("Custom", "Group_Options", "Options")
	$g_aLangCustom[8]  = _Localization_Load("Custom", "Checkbox_Reduce_Mem", "Reduce memory every :")
	$g_aLangCustom[9]  = _Localization_Load("Custom", "Label_Milliseconds", "milliseconds")
	$g_aLangCustom[10] = _Localization_Load("Custom", "Checkbox_Reduce_Limit", "Only reduce memory if usage is over :")
	$g_aLangCustom[11] = _Localization_Load("Custom", "Checkbox_Start_With", "Start %s when Firemin starts")
	$g_aLangCustom[12] = _Localization_Load("Custom", "Checkbox_Enable_Extended_Processes", "Enable extended processes")
	$g_aLangCustom[13] = _Localization_Load("Custom", "Button_Extended_Processes", "&Extended Processes")
	$g_aLangCustom[14] = _Localization_Load("Custom", "Checkbox_Start_Windows", "Start Firemin when Windows starts")
	$g_aLangCustom[15] = _Localization_Load("Custom", "Label_Settings_Updated", "Settings updated successfully.")
	$g_aLangCustom[16] = _Localization_Load("Custom", "Button_Cancel", "Cancel")
	$g_aLangCustom[17] = _Localization_Load("Custom", "Button_Save", "Save")
	$g_aLangCustom[18] = _Localization_Load("Custom", "Time_Unit_01", "milliseconds")
	$g_aLangCustom[19] = _Localization_Load("Custom", "Time_Unit_02", "seconds")
	$g_aLangCustom[20] = _Localization_Load("Custom", "Time_Unit_03", "minutes")
	$g_aLangCustom[21] = _Localization_Load("Custom", "Time_Unit_04", "hours")
	$g_aLangCustom[22] = _Localization_Load("Custom", "Label_Boost_Description", "Reduce every %s %s if usage over %s MB.")
	$g_aLangCustom[23] = _Localization_Load("Custom", "Title_Select_Browser", "Select Browser")
	$g_aLangCustom[24] = _Localization_Load("Custom", "Tip_Minimized_Title", "%{Program.Name} is still running!")
	$g_aLangCustom[25] = _Localization_Load("Custom", "Tip_Minimized_Message", "%{Program.Name} will continue to run to optimize %s's memory usage. Click the tray icon to change various optimization options.")
	$g_aLangCustom[26] = _Localization_Load("Custom", "Label_Notice", "%{Program.Name} is designed to run on a desktop computer or laptop. We created Firemin Server for server environments. Read more...")

EndFunc


Func _Localization_Menus()

	If StringLen($g_aLangMenus[0]) > 0 Then
		Return
	EndIf

	$g_aLangMenus[0]  = _Localization_Load("Menus", "File", "&File")
	$g_aLangMenus[1]  = _Localization_Load("Menus", "File_Preferences", "&Preferences")
	$g_aLangMenus[2]  = _Localization_Load("Menus", "File_Close", "&Close\tShift+Alt+F4")
	$g_aLangMenus[3]  = _Localization_Load("Menus", "Help", "&Help")
	$g_aLangMenus[4]  = _Localization_Load("Menus", "Help_Update", "Check for &updates")
	$g_aLangMenus[5]  = _Localization_Load("Menus", "Help_Home", "%{Company.Name} &Home")
	$g_aLangMenus[6]  = _Localization_Load("Menus", "Help_Downloads", "More &Downloads")
	$g_aLangMenus[7]  = _Localization_Load("Menus", "Help_Support", "&Get Support")
	$g_aLangMenus[8]  = _Localization_Load("Menus", "Help_Issue", "Create an &issue")
	$g_aLangMenus[9]  = _Localization_Load("Menus", "Help_Donate", "Donate to &our Cause")
	$g_aLangMenus[10] = _Localization_Load("Menus", "Help_About", "About %{Program.Name}")
	$g_aLangMenus[11] = _Localization_Load("Menus", "Tray_About", "About %{Program.Name} %s")
	$g_aLangMenus[12] = _Localization_Load("Menus", "Tray_Open", "Open %{Program.Name}")
	$g_aLangMenus[13] = _Localization_Load("Menus", "Tray_Extended_Processes", "Extended Processes")
	$g_aLangMenus[14] = _Localization_Load("Menus", "Tray_Run", "Run %s")
	$g_aLangMenus[15] = _Localization_Load("Menus", "Tray_Run_Safemode", "Run %s in Safemode")

EndFunc


Func _Localization_Preferences()

	;~ Check if the language strings is already loaded. Because we do not want to load the language strings twice.
	If StringLen($g_aLangPreferences[0]) > 0 Then
		Return
	EndIf

	$g_aLangPreferences[0]  = _Localization_Load("Preferences", "Window_Title", "Preferences")
	$g_aLangPreferences[1]  = _Localization_Load("Preferences", "Tab_General", "General")
	$g_aLangPreferences[2]  = _Localization_Load("Preferences", "Tab_Performance", "Performance")
	$g_aLangPreferences[3]  = _Localization_Load("Preferences", "Tab_Language", "Language")
	$g_aLangPreferences[4]  = _Localization_Load("Preferences", "Group_Notifications", "Notifications")
	$g_aLangPreferences[5]  = _Localization_Load("Preferences", "Group_Extended_Processes", "Extended Processes")
	$g_aLangPreferences[6]  = _Localization_Load("Preferences", "Group_Priority", "Priority")
	$g_aLangPreferences[7]  = _Localization_Load("Preferences", "Group_Memory", "Memory")
	$g_aLangPreferences[8]  = _Localization_Load("Preferences", "Group_Language", "Language")
	$g_aLangPreferences[9]  = _Localization_Load("Preferences", "Checkbox_Notifications", "Show tray notifications")
	$g_aLangPreferences[10] = _Localization_Load("Preferences", "Label_Extended_Processes", "Language")
	$g_aLangPreferences[11] = _Localization_Load("Preferences", "Label_SetPriority", "Set process priority:")
	$g_aLangPreferences[12] = _Localization_Load("Preferences", "Checkbox_SaveRealtime", "Save priority above high (not recommended).")
	$g_aLangPreferences[13] = _Localization_Load("Preferences", "Checkbox_ReduceMemory", "Reduce memory on low memory systems.")
	$g_aLangPreferences[14] = _Localization_Load("Preferences", "Label_Language_Message", "Select the language you prefer and press the %s button to continue. (Restart Required)")
	$g_aLangPreferences[15] = _Localization_Load("Preferences", "Button_Save", "Save")
	$g_aLangPreferences[16] = _Localization_Load("Preferences", "Button_Cancel", "Cancel")
	$g_aLangPreferences[17] = _Localization_Load("Preferences", "Label_Updated", "Preferences Updated")
	$g_aLangPreferences[18] = _Localization_Load("Preferences", "MsgBox_Language_Title", "Language Changed")
	$g_aLangPreferences[19] = _Localization_Load("Preferences", "MsgBox_Language_Message", "The selected language has changed. Complete Internet Repair should be restarted for the chosen language to take effect.")
	$g_aLangPreferences[20] = _Localization_Load("Preferences", "MsgBox_Closing_Title", "Closing %{Program.Name}")
	$g_aLangPreferences[21] = _Localization_Load("Preferences", "MsgBox_Closing_Message", "Would you like to close %{Program.Name} now?")

EndFunc


Func _Localization_Load($sSection, $sKey, $sDefault)
	Local $sCheckSpace = ""
	If StringCompare(StringLeft($sKey, 8), "Checkbox") = 0 Then
		$sCheckSpace = Chr(32)
	EndIf

	; Generate cache key
	Local $sCacheKey = $sSection & "|" & $sKey

	; Check cache first
	For $i = 0 To $g_iLocalizationCacheSize - 1
		If $g_aLocalizationCache[$i][0] = $sCacheKey Then
			Return $sCheckSpace & $g_aLocalizationCache[$i][2]
		EndIf
	Next

	; Not in cache, load from file
	Local $sText = IniRead($g_sLanguageFile, $sSection, $sKey, $sDefault)
	Local $sReplaced = _Localization_ReplaceVar($sText)

	; Add to cache
	_Localization_AddToCache($sCacheKey, $sText, $sReplaced)

	Return $sCheckSpace & $sReplaced
EndFunc


Func _Localization_AddToCache($sCacheKey, $sOriginal, $sReplaced)
	; Grow cache array if needed
	If $g_iLocalizationCacheSize >= UBound($g_aLocalizationCache) Then
		ReDim $g_aLocalizationCache[$g_iLocalizationCacheSize + 50][3]
	EndIf

	; Add to cache
	$g_aLocalizationCache[$g_iLocalizationCacheSize][0] = $sCacheKey
	$g_aLocalizationCache[$g_iLocalizationCacheSize][1] = $sOriginal
	$g_aLocalizationCache[$g_iLocalizationCacheSize][2] = $sReplaced
	$g_iLocalizationCacheSize += 1
EndFunc


Func _Localization_ReplaceVar($sText)
	$sText = String($sText)

	; Do all replacements in one pass
	$sText = StringReplace($sText, "%{Company.Name}", $g_sCompanyName)
	$sText = StringReplace($sText, "%{Program.Name.Short}", $g_sProgShortName)
	$sText = StringReplace($sText, "%{Program.Name.Short.X64}", $g_sProgShortName_X64)
	$sText = StringReplace($sText, "%{Program.Name}", $g_sProgName)
	$sText = StringReplace($sText, "%{AutoIt.Version}", @AutoItVersion)
	$sText = StringReplace($sText, "%{Windows.Version}", _GetWindowsVersion(1))
	$sText = StringReplace($sText, "\rn", @CRLF)
	$sText = StringReplace($sText, "\t", @TAB)

	Return $sText
EndFunc   ;==>_Localization_ReplaceVar