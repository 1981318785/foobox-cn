; �ýű�ʹ�� HM VNISEdit �ű��༭���򵼲���

; ��װ�����ʼ���峣��
SetFont "Tahoma" 9
!define FB2K_VER "1.4.8"
!define FBOX_VER "6.1.4.8"
!define /date FBOX_YEAR %Y
!define Name "foobar2000"
!define PRODUCT_NAME "foobox"
!define PRODUCT_VERSION "${FBOX_VER}"
!define PRODUCT_PUBLISHER "dreamawake"
!define PRODUCT_WEB_SITE "http://blog.sina.com.cn/dream7180"

SetCompressor /SOLID lzma

ReserveFile "${NSISDIR}\Plugins\x86-ansi\FindProcDLL.dll"
ReserveFile "${NSISDIR}\Plugins\x86-ansi\KillProcDLL.dll"
ReserveFile "${NSISDIR}\Plugins\\x86-ansi\UAC.dll"
ReserveFile "${NSISDIR}\Plugins\x86-ansi\Time.dll"

; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI.nsh"
; MUI Ԥ���峣��
!define MUI_ABORTWARNING
!define MUI_ICON "resource\setup.ico"
!define MUI_UNICON "resource\uninstalll.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "resource\modern-wizard.bmp"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "resource\modern-header.bmp"
!define MUI_WELCOMEPAGE_TEXT "	foobar2000 ��һ�� Windows ƽ̨�µĸ߼���Ƶ��������֧�ֶ�����Ƶ��ʽ���ź�ת���������������չ��foobox �ǻ��� foobar2000 �����棨��ǰ�汾 ${FB2K_VER}���� CUI �������ã�ϵͳӦ������ Windows Vista ����װ DirectX 9.0����ѡװ Milkdrop2 ���ӻ��������"
!define MUI_COMPONENTSPAGE_NODESC
; ��ӭҳ��
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!insertmacro MUI_PAGE_LICENSE "resource\Licence.rtf"
; ���ѡ��ҳ��
!insertmacro MUI_PAGE_COMPONENTS
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY
; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��װ���ҳ��
!define MUI_FINISHPAGE_RUN "$INSTDIR\foobar2000.exe"
;!define MUI_UNCONFIRMPAGE_TEXT_TOP "����ļ����ɾ�� ${PRODUCT_NAME}"
;!define MUI_UNCONFIRMPAGE_TEXT_LOCATION "ж��Ŀ¼"

!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

;�ļ��汾����
  VIProductVersion "${FBOX_VER}.0.0"
  VIAddVersionKey /LANG=2052 "ProductName" PRODUCT_WEB_SITE
  VIAddVersionKey /LANG=2052 "Comments" "CUI for foobar2000"
  VIAddVersionKey /LANG=2052 "CompanyName" PRODUCT_WEB_SITE
  VIAddVersionKey /LANG=2052 "LegalTrademarks" "foobar2000"
  VIAddVersionKey /LANG=2052 "LegalCopyright" "foobar2000.org"
  VIAddVersionKey /LANG=2052 "FileDescription" "foobox CUI skin for foobar2000"
  VIAddVersionKey /LANG=2052 "FileVersion" "${FBOX_VER}.0.0"


; ��װԤ�ͷ��ļ�
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI �ִ����涨����� ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "${PRODUCT_NAME}-${FBOX_VER}.exe"
;InstallDir "D:\Tools\Foobar2000"
InstallDir "$PROGRAMFILES\foobar2000"
; ������ܵĻ���ע����м�ⰲװ·��
;InstallDirRegKey HKLM \
;	"Software\Microsoft\Windows\CurrentVersion\Uninstall\foobar2000" \
;	"UninstallString"
ShowInstDetails show
ShowUnInstDetails show
BrandingText "dreamawake ${FBOX_YEAR}���Ʒ"
RequestExecutionLevel user

!include "Sections.nsh"
!include "WinVer.nsh"
!include UAC.nsh
!include x64.nsh

;========================
InstType "��׼��װ (�������ӻ����Milkdrop2)"
InstType "��ǿ��װ"
InstType "��ȫ��װ"

Section "���ĳ������" CORE
  SectionIn 1 2 3 RO
  SetOutPath "$INSTDIR"
  SetOverwrite on
  File /r "Foobar2000-core\*.*"
WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

SubSection "��ѡ�����ļ�(�����豣��ԭ����ʱ��ѡ)"
Section "foobar2000���������ļ�" CORECFG
	SectionIn 1 2 3
  SetOutPath "$INSTDIR\configuration"
  SetOverwrite on
  File "foobar2000-extra\configuration\Core.cfg"
SectionEnd
Section "ESLyric��������ļ�" ESLCFG
	SectionIn 1 2 3
  SetOutPath "$INSTDIR\configuration"
  SetOverwrite on
  File "foobar2000-extra\configuration\foo_uie_eslyric.dll.cfg"
SectionEnd
Section "ת���������ļ�" CONVCFG
	SectionIn 1 2 3
  SetOutPath "$INSTDIR\configuration"
  SetOverwrite on
  File "foobar2000-extra\configuration\foo_converter.dll.cfg"
SectionEnd
SubSectionEnd

SubSection "���������"

Section "APE ������" APE
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\user-components\foo_input_monkey"
  SetOverwrite on
  File "foobar2000-extra\components\foo_input_monkey.dll"
SectionEnd

Section "DTS ������" DTS
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\user-components\foo_input_dts"
  SetOverwrite on
  File "foobar2000-extra\components\dts\*.*"
SectionEnd

Section "SACD ������" SACD
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\user-components\foo_input_sacd"
  SetOverwrite on
  File /r "foobar2000-extra\components\sacd\*.*"
SectionEnd

Section "DSD ������" DSD
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\user-components\foo_dsd_processor"
  SetOverwrite on
  File "foobar2000-extra\components\foo_dsd_processor.dll"
SectionEnd

Section "TTA ������" TTA
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\user-components\foo_input_tta"
  SetOverwrite on
  File "foobar2000-extra\components\foo_input_tta.dll"
SectionEnd

Section "TAK ������" TAK
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\user-components\foo_input_tak"
  SetOverwrite on
  File "foobar2000-extra\components\tak_deco_lib.dll"
  File "foobar2000-extra\components\foo_input_tak.dll"
SectionEnd

Section "DVD-Audio ������" DVDA
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\user-components\foo_input_dvda"
  SetOverwrite on
  File "foobar2000-extra\components\foo_input_dvda.dll"
SectionEnd
SubSectionEnd

SubSection "��ѡ���"
Section "ת����" CONVERTER
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\components"
  SetOverwrite on
  File "foobar2000-extra\components\foo_converter.dll"
SectionEnd

Section "�ļ�����" FILEOP
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\components"
  SetOverwrite on
  File "foobar2000-extra\components\foo_fileops.dll"
SectionEnd

Section "ѹ������ȡ��" UNPACK
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\components"
  SetOverwrite on
  File "foobar2000-extra\components\foo_unpack.dll"
SectionEnd

Section "��������ɨ����" RGSCAN
  SectionIn 1 2 3
	SetOutPath "$INSTDIR\components"
  SetOverwrite on
  File "foobar2000-extra\components\foo_rgscan.dll"
SectionEnd

Section /o "freedb ��ǩ��ȡ��" FREEDB
  SectionIn 2 3
	SetOutPath "$INSTDIR\components"
  SetOverwrite on
  File "foobar2000-extra\components\foo_freedb2.dll"
SectionEnd

Section /o "UPnP\DLNA ֧�ֲ��" UPNP
  SectionIn 3
	SetOutPath "$INSTDIR\user-components\foo_upnp"
  SetOverwrite on
  File "foobar2000-extra\components\foo_upnp.dll"
SectionEnd
SubSectionEnd

SubSection "��ʽת��������" ENC
Section "MP3������(lame)" ENCMP3
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\lame.exe"
SectionEnd

Section "FLAC������(����)" ENCFLAC
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\flac.exe"
  File "foobar2000-extra\encoders\metaflac.exe"
SectionEnd

Section "WMA������" ENCWMA
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\WMAEncode.exe"
SectionEnd

;Section /o "AAC+Apple����(qaac����ҪiTunes���л���)" ENCQAAC
;  SectionIn 3 4
;  SetOutPath "$INSTDIR\encoders"
;  SetOverwrite on
;  File "encoders\qaac.exe"
;  File "encoders\refalac.exe"
;SectionEnd

;Section /o "AAC+Apple����(qaac)���л���" ENVQAAC
;  SectionIn 3 4
;  SetOutPath "$INSTDIR\encoders\qtfiles"
;  SetOverwrite on
;  File /r "encoders\qtfiles\*.*"
;SectionEnd

Section "APE������(����)" ENCAPE
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\mac.exe"
SectionEnd

Section "Opus������" ENCOPUS
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\opusenc.exe"
SectionEnd

Section "AAC������(Nero)" ENCNERO
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\neroAacEnc.exe"
SectionEnd

Section "OGG������" ENCOGG
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\oggenc2.exe"
SectionEnd

Section "WavePack������(����)" ENCWAV
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\wavpack.exe"
SectionEnd

Section /o "MPC������" ENCMPC
  SectionIn 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\mpcenc.exe"
SectionEnd

Section /o "TAK������" ENCTAK
  SectionIn 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\Takc.exe"
SectionEnd

Section /o "TTA������" ENCTTA
  SectionIn 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\tta.exe"
SectionEnd

Section /o "AAC(fhgaacenc, ��ҪWinamp5.62+)" ENCFHGAAC
  SectionIn 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\fhgaacenc.exe"
  File "foobar2000-extra\encoders\nsutil.dll"
SectionEnd

Section /o "AAC������(faac)" ENCFAAC
  SectionIn 3
  SetOutPath "$INSTDIR\encoders"
  SetOverwrite on
  File "foobar2000-extra\encoders\faac.exe"
SectionEnd
SubSectionEnd

SubSection "�߼�������"
Section "WASAPI������(Windows�汾������Vista)" WASAPI
  SectionIn 1 2 3
  ${If} ${AtLeastWinVista}
  SetOutPath "$INSTDIR\user-components\foo_out_wasapi"
  SetOverwrite on
  File "foobar2000-extra\components\wasapi\*.*"
  ${EndIf}
SectionEnd

Section /o "ASIO������" ASIO
  SectionIn 3
  SetOutPath "$INSTDIR\user-components\foo_out_asio"
  SetOverwrite on
  File "foobar2000-extra\components\asio\*.*"
SectionEnd
SubSectionEnd

SubSection "��ǿ�渽������ͳ���"
Section /o "Milkdrop2 ���ӻ������Ҫ��DirectX 9.0��" SHP
  SectionIn 2 3
  SetOutPath "$INSTDIR\components"
  SetOverwrite on
  File "foobar2000-extra\visualization\foo_vis_shpeck.dll"
  SetOutPath "$INSTDIR\configuration"
  SetOverwrite on
  File "foobar2000-extra\visualization\foo_vis_shpeck.dll.cfg"
  SetOutPath "$INSTDIR\plugins"
  SetOverwrite on
  File /r "foobar2000-extra\visualization\plugins\*.*"
SectionEnd
;Section /o "�����Milkdrop���ӻ�Ԥ��" MILKDROP
;  SectionIn 3
;  SetOutPath "$INSTDIR\plugins\winamp\Plugins\milkdrop2\presets"
;  SetOverwrite on
;  File "visualization\Milkdrop Presets\*.*"
;SectionEnd
Section /o "Mp3tag (��Ϻ�ף�iTunesԴ)" MP3TAG
  SectionIn 2 3
  SetOutPath "$INSTDIR\assemblies\Mp3tag"
  SetOverwrite on
  File /r "foobar2000-extra\assemblies\Mp3tag\*.*"
SectionEnd
SubSectionEnd

SubSection "Ĭ�Ͻ���DUI���"
Section /o "ר���б����" ALBLIST
  SectionIn 3
	SetOutPath "$INSTDIR\components"
  SetOverwrite on
  File "foobar2000-extra\components\foo_albumlist.dll"
SectionEnd
Section /o "Ԥ�����⼯" DUITHEME
  SectionIn 3
  SetOutPath "$INSTDIR\themes"
  SetOverwrite on
  File "foobar2000-extra\themes\*.*"
SectionEnd
SubSectionEnd

Section "������Ԥ���ļ�" EQSETTINGS
  SectionIn 1 2 3
  SetOutPath "$INSTDIR\Equalizer Presets"
  SetOverwrite on
  File "foobar2000-extra\Equalizer Presets\*.*"
SectionEnd


Section "���������ݷ�ʽ" SHORTCUT
  SectionIn 1 2 3
	CreateShortCut "$DESKTOP\Foobar2000.lnk" "$INSTDIR\foobar2000.exe"
  SetOverwrite on
SectionEnd

Section -Post
	; Ϊ Windows ж�س���д���ֵ
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\foobar2000" "DisplayName" "foobar2000 (foobox ${FBOX_VER})"
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\foobar2000" "DisplayVersion" "${FB2K_VER} (${FBOX_VER})"
	;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\foobar2000" "UninstallString" '"$INSTDIR\uninstall.exe"'
  ${If} ${RunningX64}
  	RegDLL "$INSTDIR\user-components\foo_input_sacd\dsd_transcoder.dll"
    ;RegDLL "$INSTDIR\user-components\foo_input_sacd\dsd_transcoder_x64.dll"
	ExecWait '"$SYSDIR\regsvr32.exe" /s "$INSTDIR\user-components\foo_input_sacd\dsd_transcoder_x64.dll"'
  ${else}
      RegDLL "$INSTDIR\user-components\foo_input_sacd\dsd_transcoder.dll"
  ${EndIf}
	AccessControl::GrantOnFile "$INSTDIR" "(BU)" "FullAccess"
SectionEnd

Section "Uninstall"
	${If} ${RunningX64}
  	UnRegDLL "$INSTDIR\user-components\foo_input_sacd\dsd_transcoder.dll"
    ;UnRegDLL "$INSTDIR\user-components\foo_input_sacd\dsd_transcoder_x64.dll"
	ExecWait '"$SYSDIR\regsvr32.exe" /u /s "$INSTDIR\user-components\foo_input_sacd\dsd_transcoder_x64.dll"'
  ${else}
      UnRegDLL "$INSTDIR\user-components\foo_input_sacd\dsd_transcoder.dll"
  ${EndIf}
	AccessControl::GrantOnFile "$INSTDIR" "(BU)" "FullAccess"
	
;DeleteRegKey HKCU "Software\foobar2000"
;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\foobar2000"
  
  ; Remove files and uninstaller
  Delete $INSTDIR\*.*
  Delete $INSTDIR\uninstall.exe

  ; Remove shortcuts, if any
  Delete "$DESKTOP\Foobar2000.lnk"

  ; Remove directories used
  RMDir /r "$INSTDIR\assemblies"
  RMDir /r "$INSTDIR\cache"
  RMDir /r "$INSTDIR\components"
  RMDir /r "$INSTDIR\configuration"
  RMDir /r "$INSTDIR\crash reports"
  RMDir /r "$INSTDIR\doc"
  RMDir /r "$INSTDIR\encoders"
  RMDir /r "$INSTDIR\Equalizer Presets"
  RMDir /r "$INSTDIR\icons"
  RMDir /r "$INSTDIR\playlists-v1.4"
  RMDir /r "$INSTDIR\plugins"
  RMDir /r "$INSTDIR\runtime"
  RMDir /r "$INSTDIR\themes"
  RMDir /r "$INSTDIR\user-components"
	MessageBox MB_YESNO|MB_ICONQUESTION \
	"�Ƿ�ɾ��ý������ݣ����棬��ʼ����ص����ݣ�$\n(����Ҫ������Щ�ļ�����������ġ��񡱰�ť)" \
	IDNO NoDelete
	; ȫɾ�⣡����
	RMDir /r "$INSTDIR"
	NoDelete: RMDir "$INSTDIR"

SectionEnd

Function .onSelChange
SectionGetFlags ${ENCMP3} $0
SectionGetFlags ${ENCFLAC} $1
SectionGetFlags ${ENCWMA} $R2
SectionGetFlags ${ENCAPE} $3
SectionGetFlags ${ENCOPUS} $4
SectionGetFlags ${ENCNERO} $5
SectionGetFlags ${ENCOGG} $6
SectionGetFlags ${ENCWAV} $7
SectionGetFlags ${ENCMPC} $8
SectionGetFlags ${ENCTAK} $9
SectionGetFlags ${ENCTTA} $R1
SectionGetFlags ${ENCFHGAAC} $R2
SectionGetFlags ${ENCFAAC} $R3
;SectionGetFlags ${ENCQAAC} $R4
;SectionGetFlags ${ENVQAAC} $R5
SectionGetFlags ${CONVERTER} $R0
SectionGetFlags ${DUITHEME} $R9

StrCmp $0 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $1 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $2 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $3 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $4 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $5 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $6 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $7 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $8 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $9 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $R1 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $R2 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $R3 1 0 +2
SectionSetFlags ${CONVERTER} 1
StrCmp $R0 0 0 +2
SectionSetFlags ${CONVCFG} 0
StrCmp $R9 1 0 +2
SectionSetFlags ${ALBLIST} 1
FunctionEnd

Function .onInit

  uac_tryagain:
  !insertmacro UAC_RunElevated
  #MessageBox mb_TopMost "0=$0 1=$1 2=$2 3=$3"
  ${Switch} $0
  ${Case} 0
  	${IfThen} $1 = 1 ${|} Quit ${|} ;we are the outer process, the inner process has done its work, we are done
  	${IfThen} $3 <> 0 ${|} ${Break} ${|} ;we are admin, let the show go on
  	${If} $1 = 3 ;RunAs completed successfully, but with a non-admin user
  		MessageBox mb_IconExclamation|mb_TopMost|mb_SetForeground "�����װ������Ҫ����ԱȨ�ޣ�������һ��" /SD IDNO IDOK uac_tryagain IDNO 0
  	${EndIf}
  	;fall-through and die
  ${Case} 1223
  	MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "�˰�װ������Ҫ����ԱȨ��, ������ֹ��װ!"
  	Quit
  ${Case} 1062
  	MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "Logon ����û������, ������ֹ��װ!"
  	Quit
  ${Default}
  	MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "�޷���Ȩ, ���� $0"
  	Quit
  ${EndSwitch}
  initpluginsdir

  ;������
  ;Call CheckVer

  ;��ֹ�ظ�����
  System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${Name}") i .r1 ?e'
  Pop $R0
  StrCmp $R0 0 +3
  MessageBox MB_OK|MB_IconExclamation "��һ��${Name}�������С�"
  quit

	;StrCmp ${PRODUCT_OUTNAME} $EXEFILE +5 0
  ;ExecShell "open" "http://www.foobar2000.com.cn"
  ;MessageBox mb_IconStop|mb_TopMost|mb_SetForeground "��װ�����޸�����, ����ֹ��װ, $\n�����ȷ������ʹ���������Զ��Ļ�����! $\n���޷������Զ��޸ģ����Լ��ֶ��Ļء�${PRODUCT_OUTNAME}��"
  ;Exec 'cmd.exe /c ping 127.0.0.1 -n 3 & ren $EXEFILE ${PRODUCT_OUTNAME}'
	;quit

  FindProcDLL::FindProc "foobar2000.exe"
  StrCmp $R0 1 0 haventrun
  MessageBox MB_YESNOCANCEL|MB_ICONEXCLAMATION "�����⵽ foobar2000 ��������,�����˳� foobar2000 ǿ�а�װ,$\n���ܻ����޷������ļ������°�װʧ�ܣ�$\n$\n1. ѡ����(Y)�����ر� foobar2000 �������װ��$\n2. ѡ�񡼷�(N)�����ر� foobar2000 ��������װ��$\n3. ѡ��ȡ�����˳���װ����$\n" /SD IDYES IDNO endrun IDCANCEL exitsetup
  KillProcDLL::KillProc "foobar2000.exe"
  sleep 444
  FindProcDLL::FindProc "foobar2000.exe"
  StrCmp $R0 1 -3 0
  goto endrun
  exitsetup:
  quit
  haventrun:
  endrun:
  setoutpath $pluginsdir
  ;file "ADDIN\shortcut.ini"
  ;File "/oname=$PLUGINSDIR\Splash_sp.bmp" "ADDIN\sp.bmp"
  ; ʹ�����������ʾ����
  ;advsplash::show 1000 600 400 -1 "$PLUGINSDIR\Splash_sp"
  ;Pop $0 ; $0 ���� '1' ��ʾ�û���ǰ�ر�����, ���� '0' ��ʾ������������, ���� '-1' ��ʾ������ʾ����
FunctionEnd

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

