; 脚本用 Inno Setup 脚本向导 生成。
; 查阅文档获取创建 INNO SETUP 脚本文件的详细资料！

#define MyAppName "2048桌面版"
#define MyAppVersion "1.0.0.0"
#define MyAppPublisher "D团队工作室"
#define MyAppURL "http://www.dtuandui.net/"
#define MyAppExeName "2048.exe"

[Setup]
; 注意: AppId 的值是唯一识别这个程序的标志。
; 不要在其他程序中使用相同的 AppId 值。
; (在编译器中点击菜单“工具 -> 产生 GUID”可以产生一个新的 GUID)
AppId={{C7B62C08-FA77-4D91-BA01-F16ED33097ED}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install
OutputBaseFilename=2048桌面版
SetupIconFile=D:\TobyYi\yibansvn\thrd-part\2048\pc2048\src\logo.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "default"; MessagesFile: "compiler:Default.isl"
Name: "chinesesimp"; MessagesFile: "compiler:Languages\ChineseSimp.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\2048.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\icudt52.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\icuin52.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\icuuc52.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\Qt5Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\Qt5Gui.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\Qt5Network.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\Qt5Qml.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\Qt5Quick.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\Qt5WebSockets.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\TobyYi\yibansvn\ReleaseVerYibanPC\2048-install\Qt5Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion
; 注意: 不要在任何共享的系统文件使用 "Flags: ignoreversion"

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
