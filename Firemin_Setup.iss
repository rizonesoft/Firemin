;* Copyright (C) 2023 Rizonesoft

; Requirements:
; Inno Setup: http://www.jrsoftware.org/isdl.php
#pragma include __INCLUDE__ + ";" + ReadReg(HKLM, "Software\Mitrich Software\Inno Download Plugin", "InstallDir")
#include <idp.iss>
 
; Preprocessor related stuff
#if VER < EncodeVer(6,3,3)
	#error Update your Inno Setup version (6.3.3 or newer)
#endif
      
#define publisher       "Rizonesoft"
#define publisher_url   "https://www.rizonesoft.com"
#define app_name        "Firemin"
#define app_shortname   "Firemin"
#define app_version     GetVersionNumbersString(AddBackslash(SourcePath) + "Firemin\Firemin.exe")
#define app_build       "8509"
#define app_copyright   "Copyright (C) 2024 Rizonesoft"
#define app_support     "https://www.rizonesoft.com/contact-us/"
#define quick_launch    "{userappdata}\Microsoft\Internet Explorer\Quick Launch"

[Setup]
AppId={#app_name}
AppName={#app_name}
AppVersion={#app_version}
AppVerName={#app_name} {#app_version}
AppPublisher={#publisher}
AppPublisherURL={#publisher_url}
AppSupportURL={#app_support}
AppUpdatesURL=https://www.rizonesoft.com/downloads/resolute/update/
AppContact=https://www.rizonesoft.com/contact-us/
AppCopyright={#app_copyright}
UninstallDisplayIcon={app}\{#app_shortname}.exe
UninstallDisplayName={#app_name} {#app_version}
DefaultDirName={pf}\{#publisher}\{#app_name}
DefaultGroupName=Resolute\Programs\{#app_name}
LicenseFile={#app_shortname}\Docs\License.txt
OutputDir=.
OutputBaseFilename={#app_shortname}_{#app_build}_Setup
Compression=lzma2/max
InternalCompressLevel=max
SolidCompression=yes
EnableDirDoesntExistWarning=no
AllowNoIcons=yes
ShowTasksTreeLines=yes
DisableDirPage=no
DisableProgramGroupPage=no
DisableReadyPage=no
DisableWelcomePage=no
AllowCancelDuringInstall=no
MinVersion=6.3
ArchitecturesAllowed=x86 x64
ArchitecturesInstallIn64BitMode=x64
CloseApplications=force
SetupMutex="bioscodes_setup_mutex"
Uninstallable=not PortableInstallCheck()


[Languages]
Name: en; MessagesFile: compiler:Default.isl

[Messages]
SetupAppTitle    =Setup - {#app_name}
SetupWindowTitle =Setup - {#app_name}

[CustomMessages]
en.tsk_AllUsers              = For all users
en.tsk_CurrentUser           = For the current user only
en.tsk_Other                 = Other tasks:
en.tsk_ResetSettings         = Reset {#app_name}'s settings
en.tsk_StartMenuIcon         = Create a Start Menu shortcut
// en.tsk_LaunchWelcomePage     = Read Important Release Information!

en.msg_AppIsRunning          = Setup has detected that {#app_name} is currently running.%n%nPlease close all instances of it now, then click OK to continue, or Cancel to exit.
en.msg_AppIsRunningUninstall = Uninstall has detected that {#app_name} is currently running.%n%nPlease close all instances of it now, then click OK to continue, or Cancel to exit.
en.msg_DeleteSettings        = Do you also want to delete {#app_name}'s settings?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
en.msg_Opera                 = Try Opera
en.msg_BrowserForTech        = Connect from any place in the world thanks to free VPN!
en.msg_Accept                = Accept
en.msg_Decline               = Decline
en.msg_NormalInstall         = Normal Installation
en.msg_PortableInstall       = Portable Installation
en.msg_IncludeSourceCode     = Include Source Code
en.msg_InstallationType      = Installation Type
en.msg_SelectInstallType     = Please select the type of installation:

[Tasks]
; Create desktop icon only for normal installations
Name: desktopicon;        Description: {cm:CreateDesktopIcon};  GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
; Create a desktop icon for the current user
Name: desktopicon\user;   Description: {cm:tsk_CurrentUser};    GroupDescription: {cm:AdditionalIcons}; Flags: unchecked exclusive
; Create a desktop icon for all users
Name: desktopicon\common; Description: {cm:tsk_AllUsers};       GroupDescription: {cm:AdditionalIcons}; Flags: unchecked exclusive
; Reset settings only if they exist and only for normal installations
Name: reset_settings;     Description: {cm:tsk_ResetSettings};  GroupDescription: {cm:tsk_Other};       Flags: unchecked checkedonce; Check: SettingsExistCheck()

[Files]
Source: {#app_shortname}\{#app_shortname}_X64.exe; DestDir: {app}; DestName: {#app_shortname}.exe; Flags: ignoreversion; Check: Is64BitInstallMode() and NormalInstallCheck()
Source: {#app_shortname}\{#app_shortname}.exe; DestDir: {app}; Flags: ignoreversion; Check: not Is64BitInstallMode() and NormalInstallCheck()
Source: {#app_shortname}\{#app_shortname}_X64.exe; DestDir: {app}; Flags: ignoreversion; Check: PortableInstallCheck()
Source: {#app_shortname}\{#app_shortname}.exe; DestDir: {app}; Flags: ignoreversion; Check: PortableInstallCheck()
Source: {#app_shortname}\{#app_shortname}.ini; DestDir: {app}; Flags: ignoreversion; Check: PortableInstallCheck()
Source: {#app_shortname}\{#app_shortname}.ini; DestDir: {userappdata}\Rizonesoft\{#app_shortname}; Flags: onlyifdoesntexist uninsneveruninstall
Source: {#app_shortname}\Docs\*.txt; DestDir: {app}\Docs; Flags: ignoreversion
Source: {#app_shortname}\Language\*.ini; DestDir: {app}\Language; Flags: ignoreversion
Source: {#app_shortname}\Processing\32\Stroke.ani; DestDir: {app}\Processing\32; Flags: ignoreversion
Source: {#app_shortname}\Processing\64\Globe.ani; DestDir: {app}\Processing\64; Flags: ignoreversion
Source: {#app_shortname}\Source\*.*; DestDir: "{app}\Source"; Flags: ignoreversion recursesubdirs createallsubdirs; Check: IncludeSourceCheck()

Source: promos\en_PromoScreen.bmp; DestDir: {tmp}; Flags: dontcopy

[Dirs]

[Icons]
Name: {commondesktop}\{#app_name}; Filename: {app}\{#app_shortname}.exe; Tasks: desktopicon\common; Comment: {#app_name} {#app_version}; WorkingDir: {app}; AppUserModelID: {#app_shortname}; IconFilename: {app}\{#app_shortname}.exe; IconIndex: 0; Check: NormalInstallCheck()
Name: {userdesktop}\{#app_name}; Filename: {app}\{#app_shortname}.exe; Tasks: desktopicon\user; Comment: {#app_name} {#app_version}; WorkingDir: {app}; AppUserModelID: {#app_shortname}; IconFilename: {app}\{#app_shortname}.exe; IconIndex: 0; Check: NormalInstallCheck()
Name: {group}\{#app_name}; Filename: "{app}\{#app_shortname}.exe"; Comment: "{#app_name} {#app_version}"; WorkingDir: "{app}"; IconFilename: "{app}\{#app_shortname}.exe"; IconIndex: 0; Check: NormalInstallCheck()
   
[INI]
Filename: {app}\{#app_shortname}.ini; Section: {#app_shortname}; Key: PortableEdition; String: 1; Check: PortableInstallCheck()
Filename: {app}\{#app_shortname}.ini; Section: {#app_shortname}; Key: BrowserPath; String: {code:GetFirefoxPath}; Check: PortableInstallCheck()
Filename: {app}\{#app_shortname}.ini; Section: Donate; Key: DonateBuild; String: 0; Check: PortableInstallCheck()
Filename: {app}\{#app_shortname}.ini; Section: Donate; Key: DonateName; String: Donate; Check: PortableInstallCheck()
Filename: {app}\{#app_shortname}.ini; Section: {#app_shortname}; Key: PortableEdition; String: 0; Check: NormalInstallCheck()


Filename: {userappdata}\Rizonesoft\{#app_shortname}\{#app_shortname}.ini; Section: {#app_shortname}; Key: PortableEdition; String: 0; Check: NormalInstallCheck()
Filename: {userappdata}\Rizonesoft\{#app_shortname}\{#app_shortname}.ini; Section: Donate; Key: DonateBuild; String: 0; Check: NormalInstallCheck()
Filename: {userappdata}\Rizonesoft\{#app_shortname}\{#app_shortname}.ini; Section: Donate; Key: DonateName; String: Donate; Check: NormalInstallCheck()
Filename: {userappdata}\Rizonesoft\{#app_shortname}\{#app_shortname}.ini; Section: {#app_shortname}; Key: BrowserPath; String: {code:GetFirefoxPath}; Check: NormalInstallCheck()


[Run]
Filename: {app}\{#app_shortname}.exe; Description: {cm:LaunchProgram,{#app_name}}; WorkingDir: {app}; Check: NormalInstallCheck(); Flags: nowait postinstall shellexec skipifsilent unchecked

[InstallDelete]
Type: files;      Name: {userdesktop}\{#app_name}.lnk;   Check: not IsTaskSelected('desktopicon\user')   and IsUpgrade()
Type: files;      Name: {commondesktop}\{#app_name}.lnk; Check: not IsTaskSelected('desktopicon\common') and IsUpgrade()
Type: files;      Name: {userstartmenu}\{#app_name}.lnk; Check: not IsTaskSelected('startup_icon')       and IsUpgrade()
Type: files;      Name: {app}\{#app_shortname}.ini

[UninstallDelete]
Type: files;      Name: {app}\{#app_shortname}.ini
Type: dirifempty; Name: {app}

[Code]
var
    PromoPage: TWizardPage;
    PromoImage: TBitmapImage;
    InstallTypePage: TWizardPage;
    NewDirName: String;
    IncludeSourceCodeCheckBox: TNewCheckBox;
    NormalRadioButton: TRadioButton;
	PortableRadioButton: TRadioButton;
    PortableEditionValue: String;
    SelectedInstallDir: String;
    IsPortableInstall: Boolean;
	ErrCode: integer;
	OpenWebpageButton: TNewButton;
    AcceptRadioButton: TRadioButton;
    DeclineRadioButton: TRadioButton;
    OperaExecuted: Boolean;
    PromoImagePath: String;

const
	HWND_TOPMOST = -1;
	SWP_NOSIZE = $1;
	SWP_NOMOVE = $2;
	SWP_NOZORDER = $4;
    DownloadURL = 'https://net.geo.opera.com/opera/stable/windows?utm_source=RIZONE&utm_medium=pb&utm_campaign=FIREMIN';

function SetWindowPos(hWnd: HWND; hWndInsertAfter: HWND; X, Y, cx, cy: Integer; uFlags: UINT): BOOL;
external 'SetWindowPos@user32.dll stdcall';

function IsUpgrade(): Boolean;
	var
	sPrevPath: String;
begin
	sPrevPath := WizardForm.PrevAppDir;
	Result := (sPrevPath <> '');
end;

function OperaKeyExistsCIS(): Boolean;
var
  SubkeyNames: TArrayOfString;
  I: Integer;
  RegistryPaths: array[0..3] of String;
begin
  Result := False;

  // Define the registry paths to check
  RegistryPaths[0] := 'Software\Microsoft\Windows\CurrentVersion\Uninstall';
  RegistryPaths[1] := 'Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall';
  RegistryPaths[2] := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall';
  RegistryPaths[3] := 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall';

  // Loop through each registry path
  for I := 0 to High(RegistryPaths) do
  begin
    if RegGetSubkeyNames(HKLM, RegistryPaths[I], SubkeyNames) or
       RegGetSubkeyNames(HKCU, RegistryPaths[I], SubkeyNames) then
    begin
      // Check each subkey if it starts with "Opera"
      for I := 0 to GetArrayLength(SubkeyNames) - 1 do
      begin
        if Pos('Opera', SubkeyNames[I]) = 1 then
        begin
          Result := True;
          Exit; // Exit immediately if a match is found
        end;
      end;
    end;
  end;
end;

function OperaKeyExists(): Boolean;
begin
  Result := False;

  // Check if Opera keys exist in the registry
  if RegKeyExists(HKCU, 'Software\Opera Software') or
     RegKeyExists(HKLM, 'SOFTWARE\Opera Software') or
     RegKeyExists(HKLM, 'SOFTWARE\Wow6432Node\Opera Software') then
  begin
    Result := True;
  end;
end;

function OperaDetected(): Boolean;
begin
    if OperaKeyExistsCIS() or OperaKeyExists() then
    begin
      Result := True;
    end;
end;

// Check if Beep Codes Viewer's settings exist.
function SettingsExistCheck(): Boolean;
begin
    // Check if the settings file exists
    Result := FileExists(ExpandConstant('{userappdata}\Rizonesoft\{#app_shortname}\{#app_shortname}.ini'));
end;

function GetFirefoxPath(Param: String): String;
var
  RegPaths: array[0..3] of String;
  Path: String;
  I: Integer;
begin
  // Initialize with default paths
  Result := ExpandConstant('{pf}\Mozilla Firefox\firefox.exe');
  
  // Check common installation paths first
  if FileExists(Result) then
    Exit;
    
  if FileExists(ExpandConstant('{pf64}\Mozilla Firefox\firefox.exe')) then
  begin
    Result := ExpandConstant('{pf64}\Mozilla Firefox\firefox.exe');
    Exit;
  end;
  
  // Define registry paths to check
  RegPaths[0] := 'SOFTWARE\Mozilla\Mozilla Firefox';
  RegPaths[1] := 'SOFTWARE\Wow6432Node\Mozilla\Mozilla Firefox';
  RegPaths[2] := 'SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe';
  RegPaths[3] := 'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe';
  
  // Check registry paths
  for I := 0 to 3 do 
  begin
    if RegQueryStringValue(HKLM, RegPaths[I], 'Path', Path) then
    begin
      if FileExists(Path) then
      begin
        Result := Path;
        Exit;
      end;
    end;
  end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
    Result := False;

    // Hide the license page if it's an upgrade
    if IsUpgrade() and (PageID = wpLicense) then
    begin
        Result := True;
    end;

    // Skip the promo page if Opera is detected
    if (PromoPage <> nil) and (PageID = PromoPage.ID) and OperaKeyExists() then
    begin
        Result := True;
    end;

    // Skip the Start Menu options page if it's a portable installation
    if IsPortableInstall and (PageID = wpSelectProgramGroup) then
    begin
        Result := True;
    end;

    if IsPortableInstall and (PageID = wpSelectTasks) then
    begin
        Result := True;
    end;
end;

procedure CleanUpSettings();
begin
	DeleteFile(ExpandConstant('{userappdata}\Rizonesoft\{#app_shortname}\{#app_shortname}.ini'));
	RemoveDir(ExpandConstant('{userappdata}\Rizonesoft\{#app_shortname}'));
end;

procedure CurPageChanged(CurPageID: Integer);
begin
    if CurPageID = wpSelectTasks then
    begin
        // WizardForm.NextButton.Caption := SetupMessage(msgButtonInstall);
    end
    else if CurPageID = wpReady then
    begin
        if AcceptRadioButton.Checked and not OperaDetected() then
        begin
            // MsgBox('Opera is not detected. Adding Opera download.', mbInformation, MB_OK);
            idpAddFile(DownloadURL, ExpandConstant('{tmp}\OperaSetup.exe'));
            idpDownloadAfter(wpReady);
        end;
    end
    else if CurPageID = wpFinished then
    begin
        // WizardForm.NextButton.Caption := SetupMessage(msgButtonFinish);
    end
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then begin
    begin
        if IncludeSourceCodeCheckBox.Checked then
            Log('Including source code files in the installation.');
        // Check if ettings need to be reset
        if IsTaskSelected('reset_settings') then
            CleanUpSettings();
    end;

    //Check if OperaSetup has already been executed
    if not OperaExecuted then
    begin
      ShellExec('', ExpandConstant('{tmp}\OperaSetup.exe'), '--silent --allusers=0', '', SW_SHOW, ewNoWait, ErrCode);
      OperaExecuted := True; // Set the flag to True after execution
    end;

  end;

end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
	ErrorCode: Integer;
begin
	// When uninstalling, ask the user to delete Beep Codes Viewer's settings.
	if CurUninstallStep = usUninstall then begin
		if SettingsExistCheck() then begin
			if SuppressibleMsgBox(CustomMessage('msg_DeleteSettings'), mbConfirmation, MB_YESNO or MB_DEFBUTTON2, IDNO) = IDYES then
			CleanUpSettings();
		end;
	end;
end;

procedure PortableRadioButtonClick(Sender: TObject);
begin
  // SelectedInstallDir := 'C:\'
end;

function GetSelectedInstallDir(Default: String): String;
begin
    Result := SelectedInstallDir;
end;

function PortableInstallCheck(): Boolean;
begin
    Result := (PortableEditionValue = '1');
end;

function NormalInstallCheck(): Boolean;
begin
    Result := (PortableEditionValue = '0');
end;

function IncludeSourceCheck(): Boolean;
begin
    Result := IncludeSourceCodeCheckBox.Checked;
end;

procedure SetInstallDirectory();
begin
    if Assigned(WizardForm) and Assigned(WizardForm.DirEdit) then
    begin
        WizardForm.DirEdit.Text := SelectedInstallDir;
    end;
end;

function GetPortableEditionValue(Param: String): String;
begin
    Result := PortableEditionValue;
end;

procedure InstallTypeRadioButtonClick(Sender: TObject);
begin
    // Update the SelectedInstallDir variable and PortableEditionValue based on user selection
    if NormalRadioButton.Checked then
    begin
        SelectedInstallDir := ExpandConstant('{pf}\Rizonesoft\{#app_name}');  // Normal Installation uses Program Files directory
        PortableEditionValue := '0';
        IsPortableInstall := False; // Normal installation
    end
    else
    begin
        SelectedInstallDir := ExpandConstant('{src}\{#app_shortname}');  // Portable Installation uses source directory (installer's location)
        PortableEditionValue := '1';
        IsPortableInstall := True; // Portable installation
    end;
    // Update the directory field in the UI
    SetInstallDirectory();
end;

procedure InitializeWizard();
begin
    PortableEditionValue := '0'; // Default to normal installation
    
    InstallTypePage := CreateCustomPage(wpWelcome, CustomMessage('msg_InstallationType'), CustomMessage('msg_SelectInstallType'));

    // Normal Installation Radio Button
    NormalRadioButton := TRadioButton.Create(InstallTypePage);
    NormalRadioButton.Parent := InstallTypePage.Surface;
    NormalRadioButton.Caption := CustomMessage('msg_NormalInstall');
    NormalRadioButton.Top := 30;
    NormalRadioButton.Height := 30;
    NormalRadioButton.Width := InstallTypePage.SurfaceWidth;
    NormalRadioButton.OnClick := @InstallTypeRadioButtonClick;
    NormalRadioButton.Checked := True; // Set Normal Installation as the default
    
    // Portable Installation Radio Button
    PortableRadioButton := TRadioButton.Create(InstallTypePage);
    PortableRadioButton.Parent := InstallTypePage.Surface;
    PortableRadioButton.Caption := CustomMessage('msg_PortableInstall');
    PortableRadioButton.Top := NormalRadioButton.Top + NormalRadioButton.Height + 10;
    PortableRadioButton.Height := 30;
    PortableRadioButton.Width := InstallTypePage.SurfaceWidth;
    PortableRadioButton.OnClick := @InstallTypeRadioButtonClick;

    // Include Source Code Checkbox
    IncludeSourceCodeCheckBox := TNewCheckBox.Create(InstallTypePage);
    IncludeSourceCodeCheckBox.Parent := InstallTypePage.Surface;
    IncludeSourceCodeCheckBox.Caption := CustomMessage('msg_IncludeSourceCode');
    IncludeSourceCodeCheckBox.Top := InstallTypePage.SurfaceHeight - 30;
    IncludeSourceCodeCheckBox.Left := 0;
    IncludeSourceCodeCheckBox.Height := 30;
    IncludeSourceCodeCheckBox.Width := InstallTypePage.SurfaceWidth;

    // Set the default flag
    IsPortableInstall := (PortableEditionValue = '1');

    // Set the initial directory field in the wizard form
    if Assigned(WizardForm) and Assigned(WizardForm.DirEdit) then
    begin
        WizardForm.DirEdit.Text := SelectedInstallDir;
    end;

    WizardForm.SelectTasksLabel.Hide;
    WizardForm.TasksList.Top    := 0;
    WizardForm.TasksList.Height := PageFromID(wpSelectTasks).SurfaceHeight;
    PromoImagePath := ExpandConstant('{tmp}\en_PromoScreen.bmp'); // Default to English

    // Extract and load the appropriate promo image
    ExtractTemporaryFile(ExtractFileName(PromoImagePath));
    PromoPage := CreateCustomPage(wpWelcome, CustomMessage('msg_Opera'), CustomMessage('msg_BrowserForTech'));

        PromoImage := TBitmapImage.Create(PromoPage);
        PromoImage.Parent := PromoPage.Surface;
        PromoImage.Bitmap.LoadFromFile(PromoImagePath);
        PromoImage.Left := 0;
        PromoImage.Top := 0;
        PromoImage.Width := 600;
        PromoImage.Height := 315;

        // Create the "Accept" radio button
        AcceptRadioButton := TRadioButton.Create(PromoPage);
        AcceptRadioButton.Parent := PromoPage.Surface;
        AcceptRadioButton.Caption := CustomMessage('msg_Accept');
        AcceptRadioButton.Left := 0;
        AcceptRadioButton.Top := PromoImage.Height + 5;
        AcceptRadioButton.Height := 30;
        AcceptRadioButton.Checked := True;

        // Create the "Decline" radio button
        DeclineRadioButton := TRadioButton.Create(PromoPage);
        DeclineRadioButton.Parent := PromoPage.Surface;
        DeclineRadioButton.Caption := CustomMessage('msg_Decline');
        DeclineRadioButton.Left := AcceptRadioButton.Width + 10;
        DeclineRadioButton.Top := PromoImage.Height + 5;
        DeclineRadioButton.Height := 30;

end;