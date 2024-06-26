; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SongOfSaya_Civ6Mod"
#define MyAppVersion "0.1"
#define MyAppPublisher "RepackFromRiritoNinigaya"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E0717D76-8FDD-4BB9-95A1-DFA40E6C993D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName=C:\SidMeierCiv6Mod\{#MyAppName}
DefaultGroupName=SidMeier_Civ6SongOfSayaMod
DisableProgramGroupPage=yes
LicenseFile=C:\Users\mkxzis\Documents\licenses\BSDLicense.txt
InfoBeforeFile=C:\Users\mkxzis\Documents\licenses\SidMeierCiv6SongOfSaya_BeforeInstallReadme.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=songofsaya_sidmeierciv6setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Code]
function BASS_Init(device: Integer; freq, flags: DWORD; win: hwnd; CLSID: Integer): Boolean;
external 'BASS_Init@files:bass.dll stdcall';
 
function BASS_StreamCreateFile(mem: BOOL; f: PAnsiChar; offset1: DWORD; offset2: DWORD; length1: DWORD; length2: DWORD; flags: DWORD): DWORD;
external 'BASS_StreamCreateFile@files:bass.dll stdcall';
 
function BASS_Start(): Boolean;
external 'BASS_Start@files:bass.dll stdcall';
 
function BASS_ChannelPlay(handle: DWORD; restart: BOOL): Boolean;
external 'BASS_ChannelPlay@files:bass.dll stdcall';

function BASS_Stop(): Boolean;
external 'BASS_Stop@files:bass.dll stdcall';
 
function BASS_Free(): Boolean;
external 'BASS_Free@files:bass.dll stdcall';

const
  BASS_SAMPLE_LOOP = 4;
var
  mp3Handle: HWND;
  mp3Name: string;
procedure InitializeWizard();
begin
    ExtractTemporaryFile('SlavicTrap_TheCossack.mp3');
    mp3Name := ExpandConstant('{tmp}\SlavicTrap_TheCossack.mp3');
    BASS_Init(-1, 48000, 0, 0, 0);
    BASS_Start();
    mp3Handle := BASS_StreamCreateFile(FALSE, PAnsiChar(mp3Name), 0, 0, 0, 0, BASS_SAMPLE_LOOP);
    BASS_ChannelPlay(mp3Handle, False);
end;
procedure DeinitializeSetup();
begin
  BASS_Free();
  BASS_Stop();
end;
[Files]
Source: "E:\SteamLibrary\steamapps\workshop\content\289070\3159722119\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Include_InnoSetup\bass.dll"; Flags: dontcopy ignoreversion
Source: "SlavicTrap_TheCossack.mp3"; DestDir: {tmp}; Flags: dontcopy ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

