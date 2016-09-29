#include "achoice.ch"
#include "Box.ch"
#include "getexit.ch"
#ifdef winexe
#include "hbgtinfo.ch"
#endif
#include "fileio.ch"
#ifdef winexe
request HB_GT_WVT_DEFAULT
#else
#endif
*REQUEST HB_GT_QTC_DEFAULT
#INCLUDE "INKEY.CH"
#ifdef __HARBOUR__
#include "hbgtinfo.ch"
#endif

#define     ECHO_CHAR     "*"
#define     LOW           32
#define     HIGH          127

setmode(25,80)
private nChoice:=0

set wrap on
set delete on
set scor off
set date to brit
set cent off
set cursor on

#ifdef winexe

hb_gtInfo(HB_GTI_FULLSCREEN,.T.)
*hb_gtInfo(HB_GTI_ICONFILE,"ICON2.ICO")
*hb_gtInfo(HB_GTI_DISPIMAGE,'ICON3.ICO',{0,0})
hb_gtInfo(HB_GTI_ISFULLSCREEN,.T.)
hb_gtInfo( HB_GTI_FONTNAME , "Lucida Console" )
hb_gtInfo( HB_GTI_WINTITLE , "Machine Challan System" )
hb_gtInfo( HB_GTI_ALTENTER, .T. ) // allow <Alt-Enter> for full screen
hb_gtInfo( HB_GTI_MAXIMIZED, .T. )
#endif

public mChno:=mmcno:=mpbt:=myln:=mpde:=Mpmrg:=no:=spac(10)
public mrmk:=spac(30)
public mcsp:=mdra:=mdrb:=msofa:=msofb:=mtofa:=mtofb:=mdya:=mdyb:=mtpa:=mtpb:=mpht:=mfht:=mwiod:=mwoid:=morp:=nNO:=0
public mDate:=dt:=ctod("")
public lfound:=.f.
public cColor := "b/w*,w+/r*,w/n,b+/w,rb/b,w+/n*"
public k,e
public dF:=dS:=dT:=dFr:=dFt:=dSt:=spac(1)
public nRecord:=nVar:=nVl:=0
public nPosRec:=1
public nKey, nPos
public cUserFunction, nRetVal, Ocrt
clear
set color to "W+/BG,N/W"
@ 2,5 TO 15,74 DOUBLE 
@ 16,23 TO 18,55
do while !LASTKEY()>0
	if nVar==0
		@ 4,8 say "ßÜßÜßÜßÜßÜßÜßÜßÜßÜ     ßÜßÜßÜßÜßÜßÜßÜßÜßÜ     ßÜßÜßÜßÜßÜßÜßÜßÜßÜ"
		@ 5,8 say "ßÜßÜßÜßÜßÜßÜßÜßÜßÜ     ßÜßÜßÜßÜßÜßÜßÜßÜßÜ     ßÜßÜßÜßÜßÜßÜßÜßÜßÜ"
		@ 6,8 say "ßÜßÜ                   ßÜßÜ                   ßÜßÜ              "
		@ 7,8 say "ßÜßÜ                   ßÜßÜ                   ßÜßÜ              "
		@ 8,8 say "ßÜßÜ                   ßÜßÜ                   ßÜßÜ              "
		@ 9,8 say "ßÜßÜ                   ßÜßÜ                   ßÜßÜ              "	
		@ 10,8 say "ßÜßÜ                   ßÜßÜ                   ßÜßÜ              "
		@ 11,8 say "ßÜßÜ                   ßÜßÜ                   ßÜßÜ              "	
		@ 12,8 say "ßÜßÜßÜßÜßÜßÜßÜßÜßÜ     ßÜßÜßÜßÜßÜßÜßÜßÜßÜ     ßÜßÜßÜßÜßÜßÜßÜßÜßÜ"
		@ 13,8 say "ßÜßÜßÜßÜßÜßÜßÜßÜßÜ     ßÜßÜßÜßÜßÜßÜßÜßÜßÜ     ßÜßÜßÜßÜßÜßÜßÜßÜßÜ"
		nVar+=1
		@ 17,24 say "Machine Challan Entry System 21" color "b/w*,w+/r*,rb/n,b+/w,rb/b,w+/n*"
	elseif nVar==1
		@ 4,8 say "ÜßÜßÜßÜßÜßÜßÜßÜßÜß     ÜßÜßÜßÜßÜßÜßÜßÜßÜß     ÜßÜßÜßÜßÜßÜßÜßÜßÜß"
		@ 5,8 say "ÜßÜßÜßÜßÜßÜßÜßÜßÜß     ÜßÜßÜßÜßÜßÜßÜßÜßÜß     ÜßÜßÜßÜßÜßÜßÜßÜßÜß"
		@ 6,8 say "ÜßÜß                   ÜßÜß                   ÜßÜß              "
		@ 7,8 say "ÜßÜß                   ÜßÜß                   ÜßÜß              "
		@ 8,8 say "ÜßÜß                   ÜßÜß                   ÜßÜß              "
		@ 9,8 say "ÜßÜß                   ÜßÜß                   ÜßÜß              "
		@ 10,8 say "ÜßÜß                   ÜßÜß                   ÜßÜß              "
		@ 11,8 say "ÜßÜß                   ÜßÜß                   ÜßÜß              "
		@ 12,8 say "ÜßÜßÜßÜßÜßÜßÜßÜßÜß     ÜßÜßÜßÜßÜßÜßÜßÜßÜß     ÜßÜßÜßÜßÜßÜßÜßÜßÜß"
		@ 13,8 say "ÜßÜßÜßÜßÜßÜßÜßÜßÜß     ÜßÜßÜßÜßÜßÜßÜßÜßÜß     ÜßÜßÜßÜßÜßÜßÜßÜßÜß"
		nVar-=1
		@ 17,24 CLEAR TO 17,54
	endif
        INKEY(0.5)
enddo

do while nVl!=4
	if nVl!=3
		@ 17,24 say "     Enter Password:           "
		cPassword := SPACE(5)
		@ 17,45 GET cPassword SEND reader := {|o| o:varPut(MyPsw(o))}
		READ
		if cPassword!="3cfas"
			@ 17,29 say "   Invalid Password  "
			nVl+=1
			nKey := INKEY(0)
			IF (nKey == K_ENTER)
			endif
		else
			exit
		endif
	else
		quit
	endif
enddo
do while .t.
clear
do display
	set color to "G+/B,W+/BR"
	@ 22,2	prom '  1.New   '
	@ 22,15 prom ' 2.Change '
	@ 22,28	prom ' 3.Delete '
	@ 22,41	prom ' 4.Report '
	@ 22,54 prom '5.BrowseDB'	
	@ 22,67 prom '  0.Exit  '
	menu to nChoice
	do case
	  case nChoice==1
		do entry
	  case nChoice==2
        do change
	  case nChoice==3
		do mydelete
	  case nChoice==4
		do report
	  case nChoice==5
		do BrowseFile
	  case nChoice==6
		quit
	endcase
enddo
*********************************************DISPLAY*******************************************************
procedure Display
*********************************************DISPLAY*******************************************************
clear
close all 
if file("machine.dbf")
	use machine shared
	index on cchno to machi01
	set index to machi01
	do while !eof()
		DocNo(@mchno)
		skip
	enddo
else
	do mydb
	use machine shared
	index on cchno to machi01
	set index to machi01
endif
	set color to "W+/BG,N/W"
	@ 0,0 CLEAR TO 24,79
	@ 0,0 TO 24,79 DOUBLE 
	@ 0,37 say "µCCCÆ"
	@ 1,1  say "                              Machine Challan Entry                           " color "b+/w+"
	@ 23,1 say "Chandani Soft Services, M-13, Super Tex Tower, Ring Road,Surat.Ph.0261-2354416" color "b+/w+"
	@ 3,2 say "Challan No.       : "
	@ 3,36 say "Date              : " 
	@ 4,2 SAY "Machine NO        : " 
	@ 4,36 SAY "Machine Speed     : "
	@ 5,2 SAY "Draw Ratio - A    : "
	@ 5,36 SAY "Draw Ratio - B    : "    
	@ 6,2 SAY "S.O.F - A         : "
	@ 6,36 SAY "S.O.F - B         : " 
	@ 7,2 SAY "T.O.F - A         : "
	@ 7,36 SAY "T.O.F - B         : "
	@ 8,2 SAY "D.Y - A           : "
	@ 8,36 SAY "D.Y - B           : " 
	@ 9,2 SAY "T.P.M - A         : "
	@ 9,36 SAY "T.P.M - B         : " 
	@ 10,2 SAY "P.H Temperature   : "
	@ 10,36 SAY "F.H Temperature   : "
	@ 11,2 SAY "Poy Batch         : " 
	@ 11,36 SAY "Poy Denier        : "
	@ 12,2 SAY "Poy Merge         : "
	@ 12,36 SAY "Yarn Lot No       : "
	@ 13,2 SAY "With Oil Denier   : "
	@ 13,36 SAY "Without Oil Denier: "
	@ 14,2 SAY "Oil R.P.M         : " 
	@ 15,2 SAY "Remark            : "
	if no==""
		@ 3,21 GET mchno valid DocNo(@mchno) pict "@k"
		READ		
	else
				SET KEY K_F2 TO DownList
                goto bottom
                no=cchno
                nNO=VAL(NO)
                nNO+=1
                no=STR(nNo)
                MCHNO=no
                @ 3,21 get mchno valid DocNo(@mchno) pict "@k"  
                read                
	endif
	if lastkey()==27
		nAns:=alert("Are you sure to exit ?",{"+Yes","-No"})
		if(nAns=1)
			quit
	    endif
	endif
	seek mChno
	if found()
		lfound:=.t.
		nChoice:=2	
		mdate :=cdate				
		mmcno :=cmcno
		mcsp  :=ccsp 
		mdra  :=cdra 
		mdrb  :=cdrb 
		msofa :=csofa
		msofb :=csofb
		mtofa :=ctofa
		mtofb :=ctofb
		mdya  :=cdya 
		mdyb  :=cdyb 
		mtpa  :=ctpa 
		mtpb  :=ctpb 
		mpht  :=cpht 
		mfht  :=cfht 
		mpbt  :=cpbt 
		mpde  :=cpde 
		mpmrg :=cpmrg
		myln  :=cyln 
		mwiod :=cwiod
		mwoid :=cwoid
		morp  :=corp 
		mrmk  :=crmk 				
				
		set color to "w+/gb,N/W"
		
		@ 3,21 say mchno
		@ 3,55 say  mdate
		@ 4,21 say  mmcno
		@ 4,55 say  mcsp 
		@ 5,21 say  mdra 
		@ 5,55 say  mdrb 
		@ 6,21 say  msofa
		@ 6,55 say  msofb
		@ 7,21 say  mtofa
		@ 7,55 say  mtofb
		@ 8,21 say  mdya 
		@ 8,55 say  mdyb 
		@ 9,21 say  mtpa 
		@ 9,55 say  mtpb 
		@ 10,21 say  mpht 
		@ 10,55 say  mfht 
		@ 11,21 say mpbt 
		@ 11,55 say mpde 
		@ 12,21 say mpmrg
		@ 12,55 say myln 
		@ 13,21 say mwiod
		@ 13,55 say mwoid
		@ 14,21 say morp 
		@ 15,21 say mrmk 
	else
                lfound:=.f.
                nChoice:=1
                mmcno:=mpbt:=myln:=mpde:=Mpmrg:=no:=spac(10)
                mrmk:=spac(30)
                mcsp:=mdra:=mdrb:=msofa:=msofb:=mtofa:=mtofb:=mdya:=mdyb:=mtpa:=mtpb:=mpht:=mfht:=mwiod:=mwoid:=morp:=0
                mDate:=dt:=ctod("")
    endif
return
************************************************ENTRY*****************************************************
procedure entry
************************************************ENTRY*****************************************************
if lastkey()=K_ESC
	return
endif
    set color to "w+/b,N/W"
    seek mChno
    if found()
        @ 12, 19, 14, 59 BOX B_DOUBLE_SINGLE
        @13,20 say padc("Record already exist how can duplicate...!",38)
        wait ""
    else
		SET KEY K_F1 TO TodayDate
        @ 3,55 get mdate
        @ 4,21 GET mmcno  
        @ 4,55 GET mcsp picture '9999999.99'
        @ 5,21 GET mdra picture '9999999.99' 
        @ 5,55 GET mdrb picture '9999999.99'
        @ 6,21 GET msofa picture '9999999.99'
        @ 6,55 GET msofb picture '9999999.99'
        @ 7,21 GET mtofa picture '9999999.99'
        @ 7,55 GET mtofb picture '9999999.99'
        @ 8,21 GET mdya picture '9999999.99'
        @ 8,55 GET mdyb picture '9999999.99'
        @ 9,21 GET mtpa picture '9999999.99'
        @ 9,55 GET mtpb picture '9999999.99'
        @ 10,21 GET mpht picture '9999999.99'
        @ 10,55 GET mfht picture '9999999.99'
        @ 11,21 GET mpbt 
        @ 11,55 GET mpde 
        @ 12,21 GET mPMRG
        @ 12,55 GET myln
        @ 13,21 GET mwiod picture '9999999.99'
        @ 13,55 GET mwoid picture '9999999.99'
        @ 14,21 GET morp picture '9999999.99'
        @ 15,21 GET mrmk
        read
	endif
	set color to "G+/B,W+/BR"
	@ 22,2	prom '  1.Save  '
	@ 22,15 prom ' 2.Ignore '
	@ 22,28	prom ' 0.Go Back'
	@ 22,39 say '                                      ' color "W+/BG,N/W"
	
	
	menu to nChoice
	do case
	  case nChoice==1 
		do save
	  case nChoice==2  
		return
	  case nChoice==3
		return
	endcase
	***********************************************************************
	procedure save
		if lfound=.f.
		APPEND BLANK
		EntryDone()
		endif
            replace   cchno with mChno
            replace   cdate with mdate
            replace   cmcno with mmcno
            replace    ccsp with  mcsp 
            replace    cdra with  mdra 
            replace    cdrb with  mdrb 
            replace   csofa with msofa
            replace   csofb with msofb
            replace   ctofa with mtofa
            replace   ctofb with mtofb
            replace    cdya with  mdya 
            replace    cdyb with  mdyb 
            replace    ctpa with  mtpa 
            replace    ctpb with  mtpb 
            replace    cpht with  mpht 
            replace    cfht with  mfht 
            replace    cpbt with  mpbt 
            replace    cpde with  mpde 
            replace   cpmrg with mpmrg
            replace    cyln with  myln 
            replace   cwiod with mwiod
            replace   cwoid with mwoid
            replace    corp with  morp 
            replace    crmk with  mrmk 
		close index
		close data
	return
****************************************DELETE*********************************************************
procedure mydelete
****************************************DELETE*********************************************************
use machine index machi01
seek mChno
if found()
	lAns:=alert("Are You sure to Delete ?",{"+Yes ","-No "})
	if lAns==1
		delete
	endif
else
    @ 12, 19, 14, 59 BOX B_DOUBLE_SINGLE
    @13,20 say padc("Record already delete or not found...!",38)
    wait ""
endif
close index
close data
return
************************************************CHANGE**************************************************
procedure Change
************************************************CHANGE**************************************************
RestoreDisp()
use machine index machi01
seek mChno
if found()
	lfound:=.t.
	nChoice:=2	
	mdate :=cdate				
	mmcno :=cmcno
	mcsp  :=ccsp 
	mdra  :=cdra 
	mdrb  :=cdrb 
	msofa :=csofa
	msofb :=csofb
	mtofa :=ctofa
	mtofb :=ctofb
	mdya  :=cdya 
	mdyb  :=cdyb 
	mtpa  :=ctpa 
	mtpb  :=ctpb 
	mpht  :=cpht 
	mfht  :=cfht 
	mpbt  :=cpbt 
	mpde  :=cpde 
	mpmrg :=cpmrg
	myln  :=cyln 
	mwiod :=cwiod
	mwoid :=cwoid
	morp  :=corp 
	mrmk  :=crmk 				
	set color to "w+/gb,N/W"		
	@ 3,21 say mchno
	@ 3,55 say  mdate
	@ 4,21 say  mmcno
	@ 4,55 say  mcsp 
	@ 5,21 say  mdra 
	@ 5,55 say  mdrb 
	@ 6,21 say  msofa
	@ 6,55 say  msofb
	@ 7,21 say  mtofa
	@ 7,55 say  mtofb
	@ 8,21 say  mdya 
	@ 8,55 say  mdyb 
	@ 9,21 say  mtpa 
	@ 9,55 say  mtpb 
	@ 10,21 say  mpht 
	@ 10,55 say  mfht 
	@ 11,21 say mpbt 
	@ 11,55 say mpde 
	@ 12,21 say mpmrg
	@ 12,55 say myln 
	@ 13,21 say mwiod
	@ 13,55 say mwoid
	@ 14,21 say morp 
	@ 15,21 say mrmk
	SET KEY K_F1 TO TodayDate
    @ 3,55 get mdate
    @ 4,21 GET mmcno  
    @ 4,55 GET mcsp picture '9999999.99'
    @ 5,21 GET mdra picture '9999999.99' 
    @ 5,55 GET mdrb picture '9999999.99'
    @ 6,21 GET msofa picture '9999999.99'
    @ 6,55 GET msofb picture '9999999.99'
    @ 7,21 GET mtofa picture '9999999.99'
    @ 7,55 GET mtofb picture '9999999.99'
    @ 8,21 GET mdya picture '9999999.99'
    @ 8,55 GET mdyb picture '9999999.99'
    @ 9,21 GET mtpa picture '9999999.99'
    @ 9,55 GET mtpb picture '9999999.99'
    @ 10,21 GET mpht picture '9999999.99'
    @ 10,55 GET mfht picture '9999999.99'
    @ 11,21 GET mpbt 
    @ 11,55 GET mpde 
    @ 12,21 GET mPMRG
    @ 12,55 GET myln
    @ 13,21 GET mwiod picture '9999999.99'
    @ 13,55 GET mwoid picture '9999999.99'
    @ 14,21 GET morp picture '9999999.99'
    @ 15,21 GET mrmk
    read                     
else
	@ 12, 19, 14, 59 BOX B_DOUBLE_SINGLE                                                                                                        
    @13,20 say padc("Challan not found how can u change...!",38)
    wait ""
endif
	set color to "G+/B,W+/BR"
	@ 22,2	prom '  1.Save  '
	@ 22,15 prom ' 2.Ignore '
	@ 22,28	prom ' 0.Go Back'
	@ 22,39 say '                                       ' color "W+/BG,N/W"
	menu to nChoice
	do case
	  case nChoice==1 
		do Reply
	  case nChoice==2  
		return
	  case nChoice==3
		return
	endcase
	*********************************************************************
	procedure Reply
		replace   cchno with mChno
		replace   cdate with mdate
		replace   cmcno with mmcno
		replace    ccsp with  mcsp 
		replace    cdra with  mdra 
		replace    cdrb with  mdrb 
		replace   csofa with msofa
		replace   csofb with msofb
		replace   ctofa with mtofa
		replace   ctofb with mtofb
		replace    cdya with  mdya 
		replace    cdyb with  mdyb 
		replace    ctpa with  mtpa 
		replace    ctpb with  mtpb 
		replace    cpht with  mpht 
		replace    cfht with  mfht 
		replace    cpbt with  mpbt 
		replace    cpde with  mpde 
		replace   cpmrg with mpmrg
		replace    cyln with  myln 
		replace   cwiod with mwiod
		replace   cwoid with mwoid
		replace    corp with  morp 																												
		replace    crmk with  mrmk                                                                                                              
	return
	**********************************************************************
	close index                                                                                                                                     
	close data                                                                                                                                      
return                              
************************************************REPORT********************************************************                                  
procedure report()                                                                                                                              
************************************************REPORT********************************************************                                  
local mach:=spac(10)
local mac:=0
local i:=1
public nPrint:=0
set console off
set print on
set print to machine.prn
    close all
    use machine shared
	index on cchno to machi01
	set index to machi01
	go top
	? chr(14)+padc("Machine Report",109)
	? repl('=',109)
	? chr(15)+padc('Challan No',10)+'|'+padc('Date',8)+'|'+padc('Machine No',10)+'|'+padc('M.Speed',10,3)+'|'+padc('D.Ratio - A',10,3)+'|'+padc('D.Ratio - B',10,3)+'|'+padc('S.O.F - A',10)+'|'+padc('S.O.F - B',10)+'|'+padc('T.O.F - A',10)+'|'+padc('T.O.F - B',10,3)+'|'+padc('D.Y - A',10,3)+'|'+padc('D.Y - B',10,3)+'|'+padc('T.M.P - A',10,3)+'|'+padc('T.M.P - B',10,3)+'|'+padc('P.H.T',10,3)+'|'+padc('F.H.T',10)+'|'+padc('Poy Batch',10)+'|'+padc('Poy Denier',10)+'|'+padc('Poy Merge',10,3)+'|'+padc('Yarn L.No',10,3)+'|'+padc('With O.D',10,3)+'|'+padc('WithoutO.D',10,3)+'|'+padc('Oil R.P.M',10,3)
	? chr(12)+repl('-',109)			                                                                                                                                                                                                                                        
    do while !eof()
		? chr(15)+padc(alltrim(cchno),10)+"|"+dtoc(cdate)+"|"+padc(alltrim(cmcno),10)+"|"+padc(ccsp,10)+"|"+padc(cdra,10)+"|"+padc(cdrb,10)+"|"+padc(csofa,10)+"|"+padc(csofb,10)+"|"+padc(ctofa,10)+"|"+padc(ctofb,10)+"|"+padc(cdya,10)+"|"+padc(cdyb,10)+"|"+padc(ctpa,10)+"|"+padc(ctpb,10)+"|"+padc(cpht,10)+"|"+padc(cfht,10)+"|"+padc(cpbt,10)+"|"+padc(cpde,10)+"|"+padc(cpmrg,10)+"|"+padc(cyln,10)+"|"+padc(cwiod,10)+"|"+padc(cwoid,10)+"|"+padc(corp,10)
		if i>58 
			? chr(12)
			i=0
			? chr(14)+padc("Machine Report",109)
			? repl('=',109)
			? chr(15)+padc('Challan No',10)+'|'+padc('Date',10)+'|'+padc('Machine No',10)+'|'+padc('M.Speed',10,3)+'|'+padc('D.Ratio - A',10,3)+'|'+padc('D.Ratio - B',10,3)+'|'+padc('S.O.F - A',10)+'|'+padc('S.O.F - B',10)+'|'+padc('T.O.F - A',10)+'|'+padc('T.O.F - B',10,3)+'|'+padc('D.Y - A',10,3)+'|'+padc('D.Y - B',10,3)+'|'+padc('T.M.P - A',10,3)+'|'+padc('T.M.P - B',10,3)+'|'+padc('P.H.T',10,3)+'|'+padc('F.H.T',10)+'|'+padc('Poy Batch',10)+'|'+padc('Poy Denier',10)+'|'+padc('Poy Merge',10,3)+'|'+padc('Yarn L.No',10,3)+'|'+padc('With O.D',10,3)+'|'+padc('Oil R.P.M',10,3)
			? repl('-',109)
		endif
		skip
		i+=1    
	enddo
	set print to     
	set print off
	set color to "G+/B,W+/BR"
	@ 8,30 TO 16,49
	@ 8,31 say "´OptionsÃ"
	@ 9,31	prom '1. Screen         '
	@ 10,31 prom '2. Printer        '
	@ 11,31	prom '3. Usb-Dot-Prn    '
	@ 12,31	prom '4. PDF File       '
	@ 13,31 prom '5. Word File      '
	@ 14,31 prom '6. Excel File     '
	@ 15,31 prom '0. Exit           '
	menu to nChoice
	do case
	  case nChoice==1 
		do screen
	  case nChoice==2  
		do printer
	  case nChoice==3
		do usbdot
	  case nChoice==4
		do pdffile	
	  case nChoice==5 
		do wordfile	  
	  case nChoice==6 
		do excelfile	  		
	  case nChoice==7 
		return
	endcase
	******************************************************************************
	procedure screen
		showfile("machine.prn",1,1,23,78)	
        if lastkey()==27
			set color to "W+/BG,N/W"
			@ 8,30 TO 15,49
			@ 8,31 say "´OptionsÃ"
			@ 9,31 prom '1. Printer        '
			@ 10,31	prom '2. Usb-Dot-Prn    '
			@ 11,31	prom '3. PDF File       '
			@ 12,31 prom '4. Word File      '
			@ 13,31 prom '5. Excel File     '
			@ 14,31 prom '0. Exit           '
			menu to nChoice
			do case
			  case nChoice==1 
				do printer
			  case nChoice==2  
				do usbdot
			  case nChoice==3
				do pdffile	
			  case nChoice==4
				do wordfile
			  case nChoice==5
				do excelfile
			  case nChoice==6 
				RETURN
			endcase
	endif	
	return
	******************************************************************************
	procedure printer
		Run Copy machine.PRN LPT1
	return
	******************************************************************************
	procedure usbdot
		if cPrint != ""
			run T2W /RAW /land /SEL cPrint machine.PRN
		else
			run T2W /RAW /land STICKER.PRN
		endif
	return
	******************************************************************************
	procedure pdffile
		run T2W /pdf /land machine.PRN
        return
	******************************************************************************
	procedure wordfile		
		run T2W /rtf /land machine.prn
	return
	******************************************************************************
	procedure excelfile
		COPY TO machine.csv delimited
		run start  machine.csv
	return
	******************************************************************************
clear
use machine index machi01
dbedit(0,0,24,78)
close index
close data
return
************************************************
function DocNo(mDocNo)
nOrgLen:=len(mDocNo)
nLen:=len(alltrim(mDocNo))
nSpace:=nOrgLen-nLen
mDocNo:=space(nSpace)+alltrim(mDocNo)
return .t.
**************************************************REPORT BROWSER************************************
FUNCTION ShowFile( cFile,nTop,nLeft,nBottom,nRight)
**************************************************REPORT BROWSER************************************
local cText
LOCAL cBuffer := "", nHandle := 0, nBytes := 0
cBuffer := SPACE( 50000 )
nHandle := FOPEN( cFile )
	IF FERROR() != 0
		cBuffer := "Error reading file!"
	ELSE
		nBytes = FREAD( nHandle, @cBuffer, 50000 )
	ENDIF
FCLOSE( nHandle )
cBuffer := RTRIM( cBuffer )
@ 0, 1 SAY padc("[ " + TRIM(upper(cFile)) + " ]",78,chr(205))
@ MAXROW(),  INT((MAXCOL()-48)/2) SAY ;
"[ Use "+CHR(27)+CHR(18)+CHR(26)+" to move through data.  (Esc to Print) ]"
MEMOEDIT( cBuffer, nTop, nLeft, nBottom, nRight, .f., "MemoUDF" , 300,10)
RETURN( cFile )
function MemoUDF()
return ""

******************************************CREATE DATEBASE**************************************************
procedure MyDb
******************************************CREATE DATEBASE**************************************************
aDbf:={}
AADD(aDbf,{"cchno","C",10,0})
AADD(aDbf,{"cdate","D",10,0})
AADD(aDbf,{"cmcno","C",10,0})
AADD(aDbf,{"ccsp ","N",10,3})
AADD(aDbf,{"cdra ","N",10,3})
AADD(aDbf,{"cdrb ","N",10,3})
AADD(aDbf,{"csofa","N",10,3})
AADD(aDbf,{"csofb","N",10,3})
AADD(aDbf,{"ctofa","N",10,3})
AADD(aDbf,{"ctofb","N",10,3})
AADD(aDbf,{"cdya ","N",10,3})
AADD(aDbf,{"cdyb ","N",10,3})
AADD(aDbf,{"ctpa ","N",10,3})
AADD(aDbf,{"ctpb ","N",10,3})
AADD(aDbf,{"cpht ","N",10,3})
AADD(aDbf,{"cfht ","N",10,3})
AADD(aDbf,{"cpbt ","C",10,0})
AADD(aDbf,{"cpde ","C",10,0})
AADD(aDbf,{"cpmrg","C",10,0})
AADD(aDbf,{"cyln ","C",10,0})
AADD(aDbf,{"cwiod","N",10,3})
AADD(aDbf,{"cwoid","N",10,3})
AADD(aDbf,{"corp ","N",10,3})
AADD(aDbf,{"crmk ","C",30,0})
DBCREATE("machine.DBF",aDbf)
return
********************************************
PROCEDURE cUserFunction( nMode, nCurElement, nRowPos )

      LOCAL nRetVal := AC_CONT
      LOCAL nKey := LASTKEY()
      DO CASE
      CASE nMode == AC_IDLE
           nRetVal := AC_CONT
      CASE nMode == AC_HITTOP
      CASE nMode == AC_HITBOTTOM
      CASE nMode == AC_EXCEPT
         DO CASE
         CASE nKey == K_ENTER
            nRetVal := AC_SELECT
				use machine shared
				goto nCurElement
				mChno=cchno
				do change
         ENDCASE
      ENDCASE

RETURN nRetVal
****************************************
PROCEDURE TodayDate()
			mDate=date()
        RETURN
****************************************
PROCEDURE DownList()
	use machine shared
		index on cchno to machi01
		set index to machi01
		GOTO Bottom
		nRecord=recno()
		public acMenuItems[nRecord]
		goto top
		do while !eof()
			acMenuItems[nPosRec] := cchno
			skip
			nPosRec+=1	
		enddo
		set color to "G+/B,W+/BR"
		@ 4,1 CLEAR TO 16,78
		@ 4,1 TO 16,78 
		@ 4,12 say "ÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂ"
		@ 5,2 SAY "Challan No³   Date   ³Machine No³ M.Speed  ³D. Ratio-A³D. Ratio-B³S.O.F - A "
		@ 6,1 say "ÃÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´"
		? acMenuItems	
		nPos := ACHOICE( 7, 2, 15, 77, acMenuItems,.T., "cUserFunction" )
Return 
*************************************************************
PROCEDURE BrowseFile
   cColor := SETCOLOR(cColor)
   CLS

   USE machine shared
   Browse()

   SETCOLOR(cColor)
   CLS
return
************************************************************
function EntryDone
   tone( 440, 9.1 )
   tone( 880, 9.1 )
   tone( 440, 9.1 )
return NIL
*************************************
PROCEDURE RestoreDisp
	set color to "W+/BG,N/W"
	@ 0,0 CLEAR TO 24,79
	@ 0,0 TO 24,79 DOUBLE 
	@ 0,37 say "µCCCÆ"
	@ 1,1  say "                              Machine Challan Entry                           " color "b+/w+"
	@ 23,1 say "Chandani Soft Services, M-13, Super Tex Tower, Ring Road,Surat.Ph.0261-2354416" color "b+/w+"
	@ 3,2 say "Challan No.       : "
	@ 3,36 say "Date              : " 
	@ 4,2 SAY "Machine NO        : " 
	@ 4,36 SAY "Machine Speed     : "
	@ 5,2 SAY "Draw Ratio - A    : "
	@ 5,36 SAY "Draw Ratio - B    : "    
	@ 6,2 SAY "S.O.F - A         : "
	@ 6,36 SAY "S.O.F - B         : " 
	@ 7,2 SAY "T.O.F - A         : "
	@ 7,36 SAY "T.O.F - B         : "
	@ 8,2 SAY "D.Y - A           : "
	@ 8,36 SAY "D.Y - B           : " 
	@ 9,2 SAY "T.P.M - A         : "
	@ 9,36 SAY "T.P.M - B         : " 
	@ 10,2 SAY "P.H Temperature   : "
	@ 10,36 SAY "F.H Temperature   : "
	@ 11,2 SAY "Poy Batch         : " 
	@ 11,36 SAY "Poy Denier        : "
	@ 12,2 SAY "Poy Merge         : "
	@ 12,36 SAY "Yarn Lot No       : "
	@ 13,2 SAY "With Oil Denier   : "
	@ 13,36 SAY "Without Oil Denier: "
	@ 14,2 SAY "Oil R.P.M         : " 
	@ 15,2 SAY "Remark            : "
return
***********************
*https://github.com/ibarrar/clipper/tree/master/CLIPPER5/SOURCE/GETSYS
*https://github.com/vszakats/harbour-core/tree/master/include
FUNCTION MyPsw(oGet)
LOCAL nRet := GE_NOEXIT
LOCAL cKey, nKey
LOCAL cAuxVar, cOriginal
LOCAL cScreen
cScreen := savescreen()
oGet:setFocus()
oGet:exitState := GE_NOEXIT
cAuxVar := cOriginal := oGet:original
IF (oGet:typeOut)
    oGet:exitState := GE_ENTER
ENDIF
WHILE (oGet:exitState == GE_NOEXIT)
    nKey := INKEY(0)
    IF (nKey == K_ENTER)
        oGet:exitState := GE_ENTER
    ELSEIF (nKey == K_ESC)
        cAuxVar := cOriginal
        oGet:undo()
        oGet:exitState := GE_ESCAPE
    ELSEIF (nKey == K_BS)
        cAuxVar := STUFF(cAuxVar, oGet:pos - 1, 1, " ")
        oGet:backSpace()
	ELSE
		IF (nKey >= LOW) .AND. (nKey <= HIGH)
			cKey := CHR(nKey)
			cAuxVar := STUFF(cAuxVar, oGet:pos, 1, cKey)
			oGet:insert(ECHO_CHAR)
			IF (oGet:typeOut)
				oGet:exitState := GE_ENTER
            ENDIF
        ENDIF
    ENDIF
END
nKey := INKEY(0)
IF (nKey == K_ENTER)
	oGet:killFocus()
	restscreen(,,,,cScreen)
	RETURN (cAuxVar)
endif