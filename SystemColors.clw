    PROGRAM
    INCLUDE 'KeyCodes.CLW'

OmitWndPrv      EQUATE(1)       !Download from Carltbarnes GitHub. On any window Upper-Left button opens WndPrv Class
   
    OMIT('**END**', OmitWndPrv)
        INCLUDE('CBWndPreview.INC'),ONCE  !Optional
    !end of OMIT('**END**', OmitWndPrv)

  MAP
ColorsByPurpose         PROCEDURE() 
ColorsAlpha             PROCEDURE()
SetupBtns4Color         PROCEDURE(BYTE Right3D=0)
AcceptedColorBtn2Clip   PROCEDURE(*STRING InfoStr)
BtnText2ColorEquate     PROCEDURE(LONG BtnFEQ),STRING
SysColorTip             PROCEDURE(LONG BtnFEQ, STRING ClrH, LONG ClrL)
  END
!Dbg STRING(2000)
  CODE
  ColorsByPurpose() ; return
!=====================================================================
ColorsByPurpose  PROCEDURE()
Info  STRING(4000)
GrayCB BYTE(1)
EntryS STRING('ABCDEFGHIJKLMNOPQRSTUVWXYZ {60}')
EntryDis STRING('Disabled GrayText ABCDEFGHIJKLMNOPQRSTUVWXYZ {60}')
    
Window WINDOW('System Colors by Purpose - Click to copy to Clipboard'),AT(,,444,281),CENTER,GRAY,SYSTEM, |
            ICON('SyCoIcon.Ico'),STATUS,FONT('Segoe UI',9),RESIZE
        BUTTON('3DDkShadow'),AT(235,157,86,13),USE(?ColorBtn:21),MSG('80000015h COLOR:3DDkShadow'),LEFT
        BUTTON('3DFace       (BtnFace)'),AT(235,109,86,13),USE(?ColorBtn_15),MSG('8000000Fh COLOR:BtnFace'), |
                LEFT
        BUTTON('3DHiLight (BtnHighlight)'),AT(235,141,86,13),USE(?ColorBto_20),MSG('80000014h COLOR:' & |
                'BtnHighlight'),LEFT
        BUTTON('3DLight'),AT(235,173,86,13),USE(?ColorBtn:22),MSG('80000016h COLOR:3DLight'),LEFT
        BUTTON('3DShadow (BtnShadow)'),AT(235,125,86,13),USE(?ColorBtn_16),MSG('80000010h COLOR:BtnShadow'), |
                LEFT
        BUTTON('ActiveBorder'),AT(6,53,60,13),USE(?ColorBtn:10),MSG('8000000Ah COLOR:ActiveBorder'),LEFT
        BUTTON('ActiveCaption'),AT(6,21,60,13),USE(?ColorBtn:02),MSG('80000002h COLOR:ActiveCaption'),LEFT
        BUTTON('AppWorkspace'),AT(338,37,61,13),USE(?ColorBtn:12),MSG('8000000Ch COLOR:AppWorkspace'),LEFT
        BUTTON('Background'),AT(338,5,61,13),USE(?ColorBtn:01),MSG('80000001h COLOR:Background'),LEFT
        BUTTON('BtnFace'),AT(110,109,57,13),USE(?ColorBtn:15),MSG('8000000Fh COLOR:BtnFace'),LEFT
        BUTTON('BtnHighlight'),AT(110,141,57,13),USE(?ColorBtn:20),MSG('80000014h COLOR:BtnHighlight'), |
                LEFT
        BUTTON('BtnShadow'),AT(110,125,57,13),USE(?ColorBtn:16),MSG('80000010h COLOR:BtnShadow'),LEFT
        BUTTON('BtnText'),AT(110,93,57,13),USE(?ColorBtn:18),MSG('80000012h COLOR:BtnText'),RIGHT
        BUTTON('CaptionText'),AT(6,5,60,13),USE(?ColorBtn:09),MSG('80000009h COLOR:CaptionText'),RIGHT
        BUTTON('Desktop (Bkg)'),AT(338,21,61,13),USE(?ColorBtn_01),MSG('80000001h COLOR:Background'),LEFT
        BUTTON('Gradient Ac Cap'),AT(6,37,60,13),USE(?ColorBtn:27),MSG('8000001Bh COLOR:GradientActi' & |
                'veCaption'),LEFT
        BUTTON('Gradient InAc Cap'),AT(110,37,76,13),USE(?ColorBtn:28),MSG('8000001Ch COLOR:Gradient' & |
                'InactiveCaption'),LEFT
        BUTTON('GrayText'),AT(6,109,60,13),USE(?ColorBtn:17),MSG('80000011h COLOR:GrayText'),RIGHT
        BUTTON('Highlight'),AT(6,173,60,13),USE(?ColorBtn:13),MSG('8000000Dh COLOR:Highlight'),LEFT
        BUTTON('HighlightText'),AT(6,157,60,13),USE(?ColorBtn:14),MSG('8000000Eh COLOR:HighlightText'), |
                RIGHT
        BUTTON('HotLight Text'),AT(338,93,57,13),USE(?ColorBtn:26),MSG('8000001Ah COLOR:HotLight'),RIGHT
        BUTTON('InactiveBorder'),AT(110,53,76,13),USE(?ColorBtn:11),MSG('8000000Bh COLOR:InactiveBorder'), |
                LEFT
        BUTTON('InactiveCaption'),AT(110,21,76,13),USE(?ColorBtn:03),MSG('80000003h COLOR:InactiveCaption'), |
                LEFT
        BUTTON('InactiveCaptionText'),AT(110,5,76,13),USE(?ColorBtn:19),MSG('80000013h COLOR:Inactiv' & |
                'eCaptionText'),RIGHT
        BUTTON('InfoBackground'),AT(338,157,57,13),USE(?ColorBtn:24),MSG('80000018h COLOR:InfoBackground'), |
                LEFT
        BUTTON('InfoText'),AT(338,141,57,13),USE(?ColorBtn:23),MSG('80000017h COLOR:InfoText'),RIGHT
        BUTTON('Menu'),AT(229,21,65,13),USE(?ColorBtn:04),MSG('80000004h COLOR:Menu'),LEFT
        BUTTON('MenuBar'),AT(229,37,65,13),USE(?ColorBtn:30),MSG('8000001Eh COLOR:MenuBar'),LEFT
        BUTTON('MenuHighlight'),AT(229,53,65,13),USE(?ColorBt1:29),MSG('8000001Dh COLOR:MenuHighlight'), |
                LEFT
        BUTTON('MenuText'),AT(229,5,65,13),USE(?ColorBt2:07),MSG('80000007h COLOR:MenuText'),RIGHT
        BUTTON('Scrollbar'),AT(338,53,61,13),USE(?ColorBtn:00),MSG('80000000h COLOR:Scrollbar'),LEFT
        BUTTON('Window'),AT(6,125,60,13),USE(?ColorBt4:05),MSG('80000005h COLOR:Window'),LEFT
        BUTTON('WindowFrame'),AT(6,141,60,13),USE(?ColorBt5:06),MSG('80000006h COLOR:WindowFrame'),LEFT
        BUTTON('WindowText'),AT(6,93,60,13),USE(?ColorBt6:08),MSG('80000008h COLOR:WindowText'),RIGHT
        TEXT,AT(6,225,314,49),USE(Info),VSCROLL,COLOR(0D5EFFFH)
        BUTTON('Colors Alpha Order'),AT(350,255,70,19),USE(?AlphaBtn),TIP('Open the Alpha Order Window')
        BOX,AT(160,203,59,15),USE(?Sample:BOX),COLOR(COLOR:Black),LINEWIDTH(1)
        STRING('SAMPLE '),AT(161,204,57,13),USE(?Sample),CENTER,FONT(,12)
        GROUP,AT(4,68,98,17),USE(?ActiveCap:Group)
            BOX,AT(6,70,89,13),USE(?ActiveCap:BOX),COLOR(COLOR:Black),FILL(COLOR:ACTIVECAPTION), |
                    LINEWIDTH(1)
            STRING('Active Caption '),AT(12,72),USE(?ActiveCap:Txt),TRN
        END
        GROUP,AT(109,68,109,18),USE(?InActiveCap:Group)
            BOX,AT(110,70,105,13),USE(?InActiveCap:BOX),COLOR(COLOR:Black),FILL(COLOR:ACTIVECAPTION), |
                    LINEWIDTH(1)
            STRING('Inactive Caption '),AT(117,72),USE(?InActiveCap:Txt),TRN
        END
        GROUP,AT(229,68,48,17),USE(?MenuItem:Group)
            BOX,AT(229,70,46,13),USE(?MenuItem:BOX),COLOR(COLOR:Black),FILL(COLOR:MENU),LINEWIDTH(1)
            STRING('Menu Item'),AT(237,72),USE(?MenuItem:Txt),TRN,FONT(,,COLOR:MENUTEXT)
        END
        GROUP,AT(281,68,44,18),USE(?MenuHiLi:Group)
            BOX,AT(282,70,41,13),USE(?MenuHiLi:BOX),COLOR(COLOR:Black),FILL(0D77800H),LINEWIDTH(1)
            STRING('Highlight'),AT(287,72),USE(?MenuHiLi:Txt),TRN,FONT(,,COLOR:HIGHLIGHTTEXT)
        END
        GROUP,AT(338,173,70,17),USE(?ToolTip:Group)
            BOX,AT(338,173,57,13),USE(?ToolTip:BOX),COLOR(COLOR:Black),LINEWIDTH(1)
            STRING('Tooltip Text'),AT(349,175),USE(?ToolTip:Txt),TRN
        END
        GROUP,AT(338,109,61,18),USE(?HyperLink:Group)
            BOX,AT(338,111,57,13),USE(?HyperLink:BOX),COLOR(COLOR:Black),LINEWIDTH(1)
            STRING('Hyperlink'),AT(350,113),USE(?HyperLink:Txt),TRN,FONT(,,,FONT:regular+FONT:underline)
        END
        CHECK('GRAY Window'),AT(350,225),USE(GrayCB),SKIP,FONT(,10),TIP('Toggle Window PROP:GRAY 3D look')
        PANEL,AT(5,89,433,2),USE(?PANELh1),BEVEL(0,0,0600H)
        PANEL,AT(222,3,1,82),USE(?PANELv1),BEVEL(0,0,6000H)
        PANEL,AT(333,3,1,82),USE(?PANELv2),BEVEL(0,0,6000H)
        PANEL,AT(104,92,1,99),USE(?PANELv3),BEVEL(0,0,6000H)
        PANEL,AT(326,92,1,99),USE(?PANELv4),BEVEL(0,0,6000H)
        PANEL,AT(330,133,107,2),USE(?PANELh2),BEVEL(0,0,0600H)
        PANEL,AT(70,194,368,2),USE(?PANELh3),BEVEL(0,0,0600H)
        ENTRY(@s80),AT(6,190,59,11),USE(EntryS),TIP('ENTRY shows Window Text on Window background ' & |
                '<13><10>Select Text with mouse to see Hightlight colors<13,10>Below Entry is Disabl' & |
                'ed showing Gray Text'),READONLY
        ENTRY(@s80),AT(6,204,59,11),USE(EntryDis),DISABLE,TIP('Disabled control shows Gray Text')
        BOX,AT(403,5,25,13),USE(?BOX:SizerBtnColor),COLOR(COLOR:Black),FILL(0C0FFFFH),HIDE,LINEWIDTH(1)
        BOX,AT(295,5,44,13),USE(?BOX:SizerGap),COLOR(COLOR:Black),FILL(COLOR:Olive),HIDE,LINEWIDTH(1)
        BUTTON('Sample'),AT(110,162,30),USE(?SampleBtn),SKIP,TIP('Sample Button')
        BUTTON('Flat'),AT(143,162,24,14),USE(?SampleFlatBtn),SKIP,TIP('FLAT Button'),FLAT
        BUTTON('TRN'),AT(171,162,24,14),USE(?SampleTrnBtn),SKIP,TIP('TRN Button'),TRN
    END
    OMIT('**END**', OmitWndPrv)
CBWndPrvCls  CBWndPreviewClass
    !end of OMIT('**END**', OmitWndPrv)
BTx STRING(30)
CP  LONG
SamTxt  STRING(80)     
SamBkg  STRING(80)     
    CODE
    OPEN(Window)
    ?Info{PROP:Background}=80000018h
    ?Info{PROP:FontColor}=80000017h

    ?ActiveCap:Txt{PROP:FontColor}=COLOR:CaptionText
    ?ActiveCap:BOX{PROP:Color}=COLOR:ActiveBorder
    ?ActiveCap:BOX{PROP:Fill}=COLOR:ActiveCaption
    ?ActiveCap:BOX{PROP:GradientToColor}=COLOR:GradientActiveCaption 
    ?ActiveCap:BOX{PROP:GradientType}=GradientTypes:Horizontal
    ?ActiveCap:Txt{PROP:Tip}='Text: COLOR:CaptionText <13,10>Back: COLOR:ActiveCaption <13,10,13,10>Gradient To Color:<13,10,9>COLOR:GradientActiveCaption'    

    ?InActiveCap:Txt{PROP:FontColor}=COLOR:InactiveCaptionText
    ?InActiveCap:BOX{PROP:Color}=COLOR:InActiveBorder
    ?InActiveCap:BOX{PROP:Fill}=COLOR:InActiveCaption
    ?InActiveCap:BOX{PROP:GradientToColor}=COLOR:GradientInActiveCaption 
    ?InActiveCap:BOX{PROP:GradientType}=GradientTypes:Horizontal
    ?InActiveCap:Txt{PROP:Tip}='Text: COLOR:InactiveCaptionText <13,10>Back: COLOR:InActiveCaption <13,10,13,10>Gradient To Color:<13,10,9>COLOR:GradientInActiveCaption'    
    
    ?MenuItem:BOX{PROP:Fill}=COLOR:MENU
    ?MenuItem:Txt{PROP:FontColor}=COLOR:MenuText
    ?MenuItem:Txt{PROP:Tip}='Text: COLOR:MenuText <13,10>Back: COLOR:Menu'
    ?MenuHiLi:BOX{PROP:Fill}=COLOR:MenuHighlight
    ?MenuHiLi:Txt{PROP:FontColor}=COLOR:HighlightText
    ?MenuHiLi:Txt{PROP:Tip}='Text: COLOR:HighlightText <13,10>Back: COLOR:MenuHighlight' 

    ?ToolTip:Txt{PROP:FontColor}=COLOR:InfoText
    ?ToolTip:BOX{PROP:Fill}=COLOR:InfoBackground
    ?ToolTip:Txt{PROP:Tip}='Text: COLOR:InfoText <13,10>Back: COLOR:InfoBackground' 

    !?HyperLink:BOX{PROP:Fill}=COLOR:ColorWindow
    ?HyperLink:Txt{PROP:FontColor}=COLOR:HotLight
    ?HyperLink:Txt{PROP:Tip}='Text: COLOR:HotLight <13,10>Back: COLOR:Window' 
    ?Sample{PROP:Tip}='Click on Text or Back color to see sample here'
  OMIT('**END**', OmitWndPrv)
    CBWndPrvCls.Init() 
  !end of OMIT('**END**', OmitWndPrv)
    SetupBtns4Color(1) !; Info=Dbg
    ACCEPT
        CASE EVENT()
        OF EVENT:OpenWindow 
            ?EntryS{PROP:SelStart}=5
            ?EntryS{PROP:SelEnd}=10
        END 
        CASE ACCEPTED() 
        OF 0
        OF ?GrayCB ; 0{PROP:Gray}=GRayCB ; DISPLAY 
        OF ?AlphaBtn ; START(ColorsAlpha)
        ELSE
            BTx=?{PROP:TExt}
            AcceptedColorBtn2Clip(Info) ! ; EntryS=CLIPBOARD() ; DISPLAY
            IF INSTRING('Text',BTx,1) OR INSTRING('HotLight',BTx,1) THEN 
               CP=PROP:FontColor
               SamTxt=?{PROP:Msg}
            ELSE 
               CP=PROP:Background            
               SamBkg=?{PROP:Msg}
            END
            ?Sample{CP}=?{'U_ClrL'}
            ?Sample{PROP:Tip}='Text: <9>' & CLIP(SamTxt) &'<13,10>Back: <9>' & CLIP(SamBkg)
        END 

    END
    RETURN
!=====================================================================
ColorsAlpha     PROCEDURE()
Info  STRING(4000) 
GrayCB BYTE(1)    
ByNumber BYTE  
WndAdjust WINDOW('Adjust Window'),AT(,,320,380),CENTER,GRAY,SYSTEM,ICON('BColor.ICO'), |
            STATUS,FONT('Segoe UI',9)
    END
  
Window WINDOW('System Colors Alpha Order - Click to copy to Clipboard'),AT(,,320,375),CENTER,gray,SYSTEM,FONT('Segoe UI',9),ICON('BColor.ICO'),STATUS
!Do NOT open this window and adjust it or you'll lose all the AT() Math
!Do NOT open this window and adjust it or you'll lose all the AT() Math - use WndAdjust above
!Do NOT open this window and adjust it or you'll lose all the AT() Math
        CHECK('Sort by Color Number'),AT(5,363),USE(ByNumber),SKIP,TIP('Sort by Number')
        CHECK('GRAY Window'),AT(89,363),USE(GrayCB),SKIP,TIP('Toggle Window PROP:GRAY 3D look')
        BUTTON('3DDkShadow'                ),AT(4,4+16*0   ,92,13),USE(?ColorBtn:21),MSG('80000015h COLOR:3DDkShadow'             ),LEFT
        BUTTON('3DFace  (BtnFace)'         ),AT(4,4+16*01  ,92,13),USE(?ColorBtn_15),MSG('8000000Fh COLOR:BtnFace'                ),LEFT
        BUTTON('3DHiLight  (BtnHighlight)' ),AT(4,4+16*02  ,92,13),USE(?ColorBto_20),MSG('80000014h COLOR:BtnHighlight'           ),LEFT
        BUTTON('3DHighlight (BtnHighlight)'),AT(4,4+16*03  ,92,13),USE(?ColorBtn_20),MSG('80000014h COLOR:BtnHighlight'           ),LEFT
        BUTTON('3DLight'                   ),AT(4,4+16*04  ,92,13),USE(?ColorBtn:22),MSG('80000016h COLOR:3DLight'                ),LEFT
        BUTTON('3DShadow   (BtnShadow)'    ),AT(4,4+16*05  ,92,13),USE(?ColorBtn_16),MSG('80000010h COLOR:BtnShadow'              ),LEFT
        BUTTON('ActiveBorder'              ),AT(4,4+16*06  ,92,13),USE(?ColorBtn:10),MSG('8000000Ah COLOR:ActiveBorder'           ),LEFT
        BUTTON('ActiveCaption'             ),AT(4,4+16*07  ,92,13),USE(?ColorBtn:02),MSG('80000002h COLOR:ActiveCaption'          ),LEFT
        BUTTON('AppWorkspace'              ),AT(4,4+16*08  ,92,13),USE(?ColorBtn:12),MSG('8000000Ch COLOR:AppWorkspace'           ),LEFT
        BUTTON('Background'                ),AT(4,4+16*09  ,92,13),USE(?ColorBtn:01),MSG('80000001h COLOR:Background'             ),LEFT
        BUTTON('BtnFace'                   ),AT(4,4+16*10  ,92,13),USE(?ColorBtn:15),MSG('8000000Fh COLOR:BtnFace'                ),LEFT
        BUTTON('BtnHiLight (BtnHighlight)' ),AT(4,4+16*11  ,92,13),USE(?ColorBtp_20),MSG('80000014h COLOR:BtnHighlight'           ),LEFT
        BUTTON('BtnHighlight'              ),AT(4,4+16*12  ,92,13),USE(?ColorBtn:20),MSG('80000014h COLOR:BtnHighlight'           ),LEFT
        BUTTON('BtnShadow'                 ),AT(4,4+16*13  ,92,13),USE(?ColorBtn:16),MSG('80000010h COLOR:BtnShadow'              ),LEFT
        BUTTON('BtnText'                   ),AT(4,4+16*14  ,92,13),USE(?ColorBtn:18),MSG('80000012h COLOR:BtnText'                ),right
        BUTTON('CaptionText'               ),AT(4,4+16*15  ,92,13),USE(?ColorBtn:09),MSG('80000009h COLOR:CaptionText'            ),right
        BUTTON('Desktop    (Background)'   ),AT(4,4+16*16  ,92,13),USE(?ColorBtn_00),MSG('80000000h COLOR:Background'             ),LEFT
        BUTTON('GradientActiveCaption'     ),AT(4,4+16*17  ,92,13),USE(?ColorBtn:27),MSG('8000001Bh COLOR:GradientActiveCaption'  ),LEFT
        BUTTON('GradientInactiveCaption'   ),AT(164,4+16*00 ,92,13),USE(?ColorBtn:28),MSG('8000001Ch COLOR:GradientInactiveCaption'),LEFT
        BUTTON('GrayText'                  ),AT(164,4+16*01 ,92,13),USE(?ColorBtn:17),MSG('80000011h COLOR:GrayText'               ),right
        BUTTON('Highlight'                 ),AT(164,4+16*02 ,92,13),USE(?ColorBtn:13),MSG('8000000Dh COLOR:Highlight'              ),LEFT
        BUTTON('HighlightText'             ),AT(164,4+16*03 ,92,13),USE(?ColorBtn:14),MSG('8000000Eh COLOR:HighlightText'          ),right
        BUTTON('HotLight Text'             ),AT(164,4+16*04 ,92,13),USE(?ColorBtn:26),MSG('8000001Ah COLOR:HotLight'               ),right
        BUTTON('InactiveBorder'            ),AT(164,4+16*05 ,92,13),USE(?ColorBtn:11),MSG('8000000Bh COLOR:InactiveBorder'         ),LEFT
        BUTTON('InactiveCaption'           ),AT(164,4+16*06 ,92,13),USE(?ColorBtn:03),MSG('80000003h COLOR:InactiveCaption'        ),LEFT
        BUTTON('InactiveCaptionText'       ),AT(164,4+16*07 ,92,13),USE(?ColorBtn:19),MSG('80000013h COLOR:InactiveCaptionText'    ),right
        BUTTON('InfoBackground'            ),AT(164,4+16*08 ,92,13),USE(?ColorBtn:24),MSG('80000018h COLOR:InfoBackground'         ),LEFT
        BUTTON('InfoText'                  ),AT(164,4+16*09 ,92,13),USE(?ColorBtn:23),MSG('80000017h COLOR:InfoText'               ),right
        BUTTON('Menu'                      ),AT(164,4+16*10 ,92,13),USE(?ColorBtn:04),MSG('80000004h COLOR:Menu'                   ),LEFT
        BUTTON('MenuBar'                   ),AT(164,4+16*11 ,92,13),USE(?ColorBtn:30),MSG('8000001Eh COLOR:MenuBar'                ),LEFT
        BUTTON('MenuHighlight'             ),AT(164,4+16*12 ,92,13),USE(?ColorBt1:29),MSG('8000001Dh COLOR:MenuHighlight'          ),LEFT
        BUTTON('MenuText'                  ),AT(164,4+16*13 ,92,13),USE(?ColorBt2:07),MSG('80000007h COLOR:MenuText'               ),right
        BUTTON('Scrollbar'                 ),AT(164,4+16*14 ,92,13),USE(?ColorBtn:00),MSG('80000000h COLOR:Scrollbar'              ),LEFT
        BUTTON('Window'                    ),AT(164,4+16*15 ,92,13),USE(?ColorBt4:05),MSG('80000005h COLOR:Window'                 ),LEFT
        BUTTON('WindowFrame'               ),AT(164,4+16*16 ,92,13),USE(?ColorBt5:06),MSG('80000006h COLOR:WindowFrame'            ),LEFT
        BUTTON('WindowText'                ),AT(164,4+16*17 ,92,13),USE(?ColorBt6:08),MSG('80000008h COLOR:WindowText'             ),right 
             TEXT,AT(5,300,308,60),USE(Info),VSCROLL,COLOR(0D5EFFFH)
    END   
BtnQ QUEUE,PRE(BQ)
FEQ LONG !BQ:FEQ
X   LONG !BQ:X
Y   LONG !BQ:Y
CN  LONG !BQ:CN
    END
NumQ QUEUE(BtnQ),PRE(NmQ).
F   LONG 
N   LONG 
    OMIT('**END**', OmitWndPrv)
CBWndPrvCls  CBWndPreviewClass    
    !end of OMIT('**END**', OmitWndPrv)
    CODE   
    OPEN(Window)
    ?Info{PROP:Background}=80000018h
    ?Info{PROP:FontColor}=80000017h    
  OMIT('**END**', OmitWndPrv)
    CBWndPrvCls.Init() 
  !end of OMIT('**END**', OmitWndPrv)
    SetupBtns4Color()
    DO LoadRtn
    ACCEPT
        CASE ACCEPTED()
        OF ?ByNumber ; DO ByNumberRtn
        OF ?GrayCB ; 0{PROP:Gray}=GrayCB
        ELSE ; AcceptedColorBtn2Clip(Info).
    END
    RETURN
LoadRtn ROUTINE
    LOOP F=?ColorBtn:21 TO ?ColorBt6:08
        BQ:FEQ=F
        GETPOSITION(F,BQ:X,BQ:Y)
        BQ:CN=BAND(0FFh,EVALUATE(SUB(F{PROP:Msg},1,9)))
        ADD(BtnQ,BQ:CN)  ! F{PROP:Text}=BQ:CN&'. '&  F{PROP:Text}
        NumQ=BtnQ 
        ADD(NumQ,NmQ:X,NmQ:Y,NmQ:FEQ)
    END
ByNumberRtn ROUTINE
    LOOP F=LastField() TO FirstField() BY -1
         IF F{PROP:Type}=Create:BOX  THEN DESTROY(F).        
    END
    LOOP N=1 TO RECORDS(BtnQ) 
         GET(BtnQ,N) ; F = BQ:FEQ
         GET(NumQ,N)
         CASE ByNumber
         OF 0 ; SETPOSITION(F,BQ:X,BQ:Y)
         OF 1 ; SETPOSITION(F,NmQ:X,NmQ:Y) 
                ! F{PROP:Text}='('& NmQ:X &','& NmQ:Y & ') '&  F{PROP:Text}
         END
    END 
    SetupBtns4Color()
!============================================
AcceptedColorBtn2Clip   PROCEDURE(*STRING InfoStr)
F LONG
pCB  PSTRING(128)
    CODE
    F=ACCEPTED()    
    IF F=0 OR F{PROP:Type}<>CREATE:Button THEN RETURN.
    pCB=BtnText2ColorEquate(F)
    SETCLIPBOARD(pCB) 
    InfoStr=F{PROP:Tip} &'<13,10>={40}<13,10>' & InfoStr ; DISPLAY
    RETURN 
!============================================
BtnText2ColorEquate PROCEDURE(LONG F)
M    STRING(80)    !MSG('80000008h COLOR:WindowText')  
                   !     123456789 1
Txt  STRING(80)    !'3DShadow   (BtnShadow)   '
P LONG             !            P
AKA  STRING(80)    ! [aka  3DShadow ]'
    CODE
    M=F{PROP:MSG}
    Txt=F{PROP:Text}
    P=INSTRING('(',Txt)
    IF P THEN  AKA='  [aka Color_' & CLIP(SUB(Txt,1,P-1)) &']'.
    RETURN(CLIP(LEFT(SUB(M,10,70))) & '  Equate(' & M[1:9] &')' & CLIP(AKA) )    
!==================================================================
SetupBtns4Color   PROCEDURE(BYTE Right3D=0)
F LONG
X LONG
Y LONG
W LONG
H LONG
cX LONG
cY LONG
cW LONG
cH LONG

B LONG
FTxt STRING(64) 
ClrH STRING(9) 
ClrL LONG
QX LONG
FldQ QUEUE
FEQ     LONG
     END 
    CODE
    LOOP ; F=0{PROP:NextField,F} ; IF ~F THEN BREAK. !The Creating controls was messing this up (some times)
        IF F{PROP:Type}=CREATE:button THEN
             FldQ:FEQ=F ; ADD(FldQ)
        END
    END
    LOOP QX=1 TO Records(FldQ) 
        GET(FldQ,QX) 
        F=FldQ:FEQ
        ClrH=UPPER(F{PROP:Msg})  ; IF ClrH[9]<>'H' THEN CYCLE.
        ClrL=EVALUATE(ClrH)
        FTxt=F{PROP:Text}        
        GETPOSITION(F,X,Y,W,H)
        B=CREATE(0,Create:BOX)
        B{'ClrSam'}=1 
        cW=25
        cX=X+W+4 ; cY=Y ; cH=H
        IF Right3D AND SUB(FTxt,1,2)='3D' THEN 
           cX=X-4-cW !; cY=Y ; cH=H 
           F{PROP:Text}=' '& FTxt  !a space else looks tight 
        END 
        SETPOSITION(B, cX, cY, cw, ch) 
        B{PROP:Fill}=ClrL
        B{PROP:COLOR}=COLOR:Black
        IF INSTRING('TEXT',UPPER(FTxt),1) THEN B{PROP:Round}=1.
        UNHIDE(B)
        SysColorTip(F,ClrH,ClrL)
        F{'U_ClrH'}=ClrH
        F{'U_ClrL'}=ClrL 
!        Dbg=CLIP(Dbg) & '<13,10>F=' & F &' B=' & B &'  '&  FTxt 
        F{PROP:Flat}=1
        F{PROP:Skip}=1
    END 
!-----------------
SysColorTip PROCEDURE(LONG BtnFEQ, STRING ClrH, LONG ClrL)
T STRING(1024)
SC LONG
    CODE
    SC=BAND(ClrL,7FFFFFFFh) 
    CASE SC 
    OF 0  ; T='0  COLOR_ScrollBar              <13,10>Scroll bar gray area.'                                                                                                                                                                                                                                       
    OF 1  ; T='1  COLOR_Background             <13,10>Desktop.'                                                                                                                                                                                                                                                    
    OF 2  ; T='2  COLOR_ActiveCaption          <13,10>Active window title bar. <13,10>The associated foreground color is COLOR_CAPTIONTEXT. <13,10>Specifies the left side color in the color gradient of an active window title bar if the gradient effect is enabled.'                                           
    OF 3  ; T='3  COLOR_InactiveCaption        <13,10>Inactive window caption. <13,10>The associated foreground color is COLOR_INACTIVECAPTIONTEXT. <13,10>Specifies the left side color in the color gradient of an inactive windows title bar if the gradient effect is enabled.'                                
    OF 4  ; T='4  COLOR_Menu                   <13,10>Menu background. <13,10>The associated foreground color is COLOR_MENUTEXT.'                                                                                                                                                                                         
    OF 5  ; T='5  COLOR_Window                 <13,10>Window background, FYI Controls are Windows. <13,10>The associated foreground colors are COLOR_WINDOWTEXT and COLOR_HOTLITE.'                                                                                                                                                                 
    OF 6  ; T='6  COLOR_WindowFrame            <13,10>Window frame.'                                                                                                                                                                                                                                               
    OF 7  ; T='7  COLOR_MenuText               <13,10>Text in menus.  <13,10>The associated background color is COLOR_MENU.'                                                                                                                                                                                       
    OF 8  ; T='8  COLOR_WindowText             <13,10>Text in windows, FYI Controls are Windows. <13,10>The associated background color is COLOR_WINDOW.'                                                                                                                                                          
    OF 9  ; T='9  COLOR_CaptionText            <13,10>Text in caption, size box, and scroll bar arrow box. <13,10>The associated background color is COLOR_ACTIVECAPTION.'                                                                                                                                         
    OF 10 ; T='10 COLOR_ActiveBorder           <13,10>Active window border.'                                                                                                                                                                                                                                       
    OF 11 ; T='11 COLOR_InactiveBorder         <13,10>Inactive window border.'                                                                                                                                                                                                                                     
    OF 12 ; T='12 COLOR_AppWorkspace           <13,10>Background color of Multiple Document Interface (MDI) applications.'                                                                                                                                                                                         
    OF 13 ; T='13 COLOR_Highlight              <13,10>Item(s) selected in a control. <13,10>The associated foreground color is COLOR_HIGHLIGHTTEXT.'                                                                                                                                                               
    OF 14 ; T='14 COLOR_HighlightText          <13,10>Text of item(s) selected in a control. <13,10>The associated background color is COLOR_HIGHLIGHT.'                                                                                                                                                           
    OF 15 ; T='15 COLOR_BtnFace                <13,10>Face color for three-dimensional display elements and for dialog box backgrounds. <13,10>The associated foreground color is COLOR_BTNTEXT.'                                                                                                                  
    OF 16 ; T='16 COLOR_BtnShadow              <13,10>Shadow color for three-dimensional display elements <13,10>(for edges facing away from the light source).'                                                                                                                                                   
    OF 17 ; T='17 COLOR_GrayText               <13,10>Grayed (disabled) text. <13,10>This color is set to 0 if the current display driver does not support a solid gray color.'                                                                                                                                    
    OF 18 ; T='18 COLOR_BtnText                <13,10>Text on push buttons. <13,10>The associated background color is COLOR_BTNFACE.'                                                                                                                                                                              
    OF 19 ; T='19 COLOR_InactiveCaptionText    <13,10>Color of text in an inactive caption. <13,10>The associated background color is COLOR_INACTIVECAPTION.'                                                                                                                                                      
    OF 20 ; T='20 COLOR_BtnHighlight           <13,10>Highlight color for three-dimensional display elements <13,10>(for edges facing the light source.)'                                                                                                                                                          
    OF 21 ; T='21 COLOR_3DDkShadow             <13,10>Dark shadow for three-dimensional display elements.'                                                                                                                                                                                                         
    OF 22 ; T='22 COLOR_3DLight                <13,10>Light color for three-dimensional display elements <13,10>(for edges facing the light source.)'                                                                                                                                                              
    OF 23 ; T='23 COLOR_InfoText               <13,10>Text color for tooltip controls. <13,10>The associated background color is COLOR_InfoBackGround.'                                                                                                                                                            
    OF 24 ; T='24 COLOR_InfoBk                 <13,10>Background color for tooltip controls. <13,10>The associated foreground color is COLOR_InfoText.'                                                                                                                                                            
    OF 26 ; T='26 COLOR_HotLight               <13,10>Color for a hyperlink or hot-tracked item text. <13,10>The associated background color is COLOR_WINDOW.'                                                                                                                                                     
    OF 27 ; T='27 COLOR_GradientActiveCaption  <13,10>Right side color in the color gradient of an active window title bar.<13,10>COLOR_ACTIVECAPTION specifies the left side color.<13,10>Use SPI_GETGRADIENTCAPTIONS with the SystemParametersInfo function to determine whether the gradient effect is enabled.'
    OF 28 ; T='28 COLOR_GradientInactiveCaption<13,10>Right side color in the color gradient of an inactive window title bar.<13,10>COLOR_INACTIVECAPTION specifies the left side color.'                                                                                                                          
    OF 29 ; T='29 COLOR_MenuHiLight            <13,10>The color used to highlight menu items when the menu appears as a flat menu (see SystemParametersInfo). <13,10>The highlighted menu item is outlined with COLOR_HIGHLIGHT. <13,10>The associated foreground color is COLOR_HIGHLIGHTTEXT.'                   
    OF 30 ; T='30 COLOR_MenuBar                <13,10>The background color for the menu bar when menus appear as flat menus (see SystemParametersInfo).<13,10>However, COLOR_MENU continues to specify the background color of the menu popup.'                                                                    
    OF 25 ; T='25 Skipped Color from Win3.1'
    ELSE  ; T= SC & ' ?? Unknown ??' ; STOP('SC=' & SC &' SysColorTip') 
    END
    T= CLIP(T) &'<13,10>'& |
        '<13,10>' & BtnText2ColorEquate(BtnFEQ) & '  Windows SysColor=' & SC
    BtnFEQ{PROP:Tip}=T
    RETURN 