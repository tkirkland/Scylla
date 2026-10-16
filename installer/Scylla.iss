; Inno Setup script for the Scylla x64 installer.
; Build: iscc /DAppVersion=0.12.0 /DBuildDir=..\build\src\Release installer\Scylla.iss

#ifndef AppVersion
  #define AppVersion "0.0.0"
#endif
#ifndef BuildDir
  #define BuildDir "..\build\src\Release"
#endif

#define AppExe "ScyllaExe.exe"

[Setup]
AppId={{36AA9880-6294-4EF6-8EA2-BD1D36AC1188}
AppName=Scylla
AppVersion={#AppVersion}
AppVerName=Scylla {#AppVersion}
AppPublisher=tkirkland
AppPublisherURL=https://github.com/tkirkland/Scylla
AppSupportURL=https://github.com/tkirkland/Scylla/issues
AppUpdatesURL=https://github.com/tkirkland/Scylla/releases
; Scylla writes Scylla.ini next to its executable, so install per-user
; (%LOCALAPPDATA%\Programs) where that directory is writable without admin.
PrivilegesRequired=lowest
DefaultDirName={autopf}\Scylla
DefaultGroupName=Scylla
DisableProgramGroupPage=yes
LicenseFile=..\LICENSE
SetupIconFile=..\src\scylla.ico
UninstallDisplayIcon={app}\{#AppExe}
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
OutputDir=..\dist
OutputBaseFilename=Scylla-{#AppVersion}-x64-setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Dirs]
Name: "{app}\Plugins"

[Files]
Source: "{#BuildDir}\{#AppExe}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BuildDir}\Scylla.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LICENSE"; DestDir: "{app}"; DestName: "LICENSE.txt"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\Scylla"; Filename: "{app}\{#AppExe}"
Name: "{autodesktop}\Scylla"; Filename: "{app}\{#AppExe}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppExe}"; Description: "{cm:LaunchProgram,Scylla}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\Scylla.ini"
