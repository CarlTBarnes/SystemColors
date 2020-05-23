  PROGRAM
  
!These colors were defined in Clarion 11.13371  Feb 6, 2019
!You can define and use them in prior releases... as long as you are running Windows 2000+.

!    WinUser.h shows in NT4 and NT5 the below System Colors were added to Windows:
!
!    #if(WINVER >= 0x0400)
!    #define COLOR_3DDKSHADOW               21
!    #define COLOR_3DLIGHT                  22
!    #define COLOR_INFOTEXT                 23
!    #define COLOR_INFOBK                   24
!    #endif /* WINVER >= 0x0400 */
!
!    #if(WINVER >= 0x0500)
!    #define COLOR_HOTLIGHT                 26
!    #define COLOR_GRADIENTACTIVECAPTION    27
!    #define COLOR_GRADIENTINACTIVECAPTION  28
!    #if(WINVER >= 0x0501)
!    #define COLOR_MENUHILIGHT              29
!    #define COLOR_MENUBAR                  30     !<-- Clarion has this
!    #endif /* WINVER >= 0x0501 */
!    #endif /* WINVER >= 0x0500 */

!Clarion only had system colors defined up to Windows 98. 
!NT 4 and 5 System Color Equates missing to add to Equates.CLW. 
!These were added in a Clarion 11.13371 release.
!Named with leading _underscore to avoid conflict in C11. To use these in prior release remove the _

_COLOR:3DDkShadow              EQUATE(80000015H)  !Dark shadow for 3D display elements
_COLOR:3DLight                 EQUATE(80000016H)  !Light color for 3D display elements (edge facing light source)
_COLOR:InfoText                EQUATE(80000017H)  !Text color for tooltip controls
_COLOR:InfoBackground          EQUATE(80000018H)  !Background color for tooltip controls
_COLOR:HotLight                EQUATE(8000001AH)  !Color for a hyperlink or hot-tracked item.
_COLOR:GradientActiveCaption   EQUATE(8000001BH)  !Right side color in color gradient of active window title bar. COLOR:ActiveCaption specifies left side color. SystemParametersInfo SPI_GETGRADIENTCAPTIONS specifies if gradient effect is enabled.
_COLOR:GradientInactiveCaption EQUATE(8000001CH)  !Right side color in color gradient of inactive window title bar. COLOR:InactiveCaption specifies the left side color.
_COLOR:MenuHighlight           EQUATE(8000001DH)  !Color to highlight menu items when the menu appears as a flat menu. The highlighted menu item is outlined with COLOR:Highlight. 

  MAP
  END

!Window designer on save might take color equates defined local and will change them to RGB colors on exit.
!below saved code with Equates
!        BOX,AT(6,10,60,10),USE(?BOX1),COLOR(COLOR:Black), FILL(_COLOR:3DDkShadow             ),LINEWIDTH(1)
!        BOX,AT(6,25,60,10),USE(?BOX2),COLOR(COLOR:Black), FILL(_COLOR:3DLight                ),LINEWIDTH(1)
!        BOX,AT(6,40,60,10),USE(?BOX3),COLOR(COLOR:Black), FILL(_COLOR:InfoText               ),LINEWIDTH(1)
!        BOX,AT(6,55,60,10),USE(?BOX4),COLOR(COLOR:Black), FILL(_COLOR:InfoBackground         ),LINEWIDTH(1)
!        BOX,AT(6,70,60,10),USE(?BOX5),COLOR(COLOR:Black), FILL(_COLOR:HotLight               ),LINEWIDTH(1)
!        BOX,AT(6,85,60,10),USE(?BOX6),COLOR(COLOR:Black), FILL(_COLOR:GradientActiveCaption  ),LINEWIDTH(1)
!        BOX,AT(6,100,60,10),USE(?BOX7),COLOR(COLOR:Black),FILL(_COLOR:GradientInactiveCaption),LINEWIDTH(1)
!        BOX,AT(6,115,60,10),USE(?BOX8),COLOR(COLOR:Black),FILL(_COLOR:MenuHighlight          ),LINEWIDTH(1)
!        BOX,AT(6,325,60,10),USE(?BOXe),COLOR(COLOR:Black),FILL(COLOR:MenuBar                ),LINEWIDTH(1)

!                   ,GRAY,FONT('Segoe UI',9) FONT('Consolas',9) ,FONT('Microsoft Sans Serif',9) 
Window WINDOW('New System Colors added by NT4 and NT5 not in Equates.CLW until Clarion 11.13371'),|
             AT(,,539,343),SYSTEM,FONT('Segoe UI',8) 
        BOX,AT(6,10,60,10),USE(?BOX1),COLOR(COLOR:Black), FILL(_COLOR:3DDkShadow             ),LINEWIDTH(1)
        BOX,AT(6,25,60,10),USE(?BOX2),COLOR(COLOR:Black), FILL(_COLOR:3DLight                ),LINEWIDTH(1)
        BOX,AT(6,40,60,10),USE(?BOX3),COLOR(COLOR:Black), FILL(_COLOR:InfoText               ),LINEWIDTH(1)
        BOX,AT(6,55,60,10),USE(?BOX4),COLOR(COLOR:Black), FILL(_COLOR:InfoBackground         ),LINEWIDTH(1)
        BOX,AT(6,70,60,10),USE(?BOX5),COLOR(COLOR:Black), FILL(_COLOR:HotLight               ),LINEWIDTH(1)
        BOX,AT(6,85,60,10),USE(?BOX6),COLOR(COLOR:Black), FILL(_COLOR:GradientActiveCaption  ),LINEWIDTH(1)
        BOX,AT(6,100,60,10),USE(?BOX7),COLOR(COLOR:Black),FILL(_COLOR:GradientInactiveCaption),LINEWIDTH(1)
        BOX,AT(6,115,60,10),USE(?BOX8),COLOR(COLOR:Black),FILL(_COLOR:MenuHighlight          ),LINEWIDTH(1)
        BOX,AT(6,325,60,10),USE(?BOXe),COLOR(COLOR:Black),FILL(COLOR:MenuBar                ),LINEWIDTH(1)
        STRING('80000015h  COLOR:3DDkShadow             '),AT(80,10),USE(?ColorEqt1)
        STRING('80000016h  COLOR:3DLight                '),AT(80,25),USE(?ColorEqt2)
        STRING('80000017h  COLOR:InfoText               '),AT(80,40),USE(?ColorEqt3)
        STRING('80000018h  COLOR:InfoBk                 '),AT(80,55),USE(?ColorEqt4)
        STRING('8000001Ah  COLOR:HotLight               '),AT(80,70),USE(?ColorEqt5)
        STRING('8000001Bh  COLOR:GradientActiveCaption  '),AT(80,85),USE(?ColorEqt6)
        STRING('8000001Ch  COLOR:GradientInactiveCaption'),AT(80,100),USE(?ColorEqt7)
        STRING('8000001Dh  COLOR:MenuHiLight            '),AT(80,115),USE(?ColorEqt8)
        STRING('8000001Eh  COLOR:MenuBar (exists now)       '),AT(80,325),USE(?ColorEqt1e)
        BOX,AT(264,10,60,10),USE(?BOX101),COLOR(COLOR:Black),FILL(COLOR:SCROLLBAR),LINEWIDTH(1)
        BOX,AT(264,25,60,10),USE(?BOX102),COLOR(COLOR:Black),FILL(COLOR:BACKGROUND),LINEWIDTH(1)
        BOX,AT(264,40,60,10),USE(?BOX103),COLOR(COLOR:Black),FILL(COLOR:ACTIVECAPTION),LINEWIDTH(1)
        BOX,AT(264,55,60,10),USE(?BOX104),COLOR(COLOR:Black),FILL(COLOR:INACTIVECAPTION),LINEWIDTH(1)
        BOX,AT(264,70,60,10),USE(?BOX105),COLOR(COLOR:Black),FILL(COLOR:MENU),LINEWIDTH(1)
        BOX,AT(264,85,60,10),USE(?BOX106),COLOR(COLOR:Black),FILL(COLOR:WINDOW),LINEWIDTH(1)
        BOX,AT(264,100,60,10),USE(?BOX107),COLOR(COLOR:Black),FILL(COLOR:WINDOWFRAME),LINEWIDTH(1)
        BOX,AT(264,115,60,10),USE(?BOX108),COLOR(COLOR:Black),FILL(COLOR:MENUTEXT),LINEWIDTH(1)
        BOX,AT(264,130,60,10),USE(?BOX109),COLOR(COLOR:Black),FILL(COLOR:WINDOWTEXT),LINEWIDTH(1)
        BOX,AT(264,145,60,10),USE(?BOX110),COLOR(COLOR:Black),FILL(COLOR:CAPTIONTEXT),LINEWIDTH(1)
        BOX,AT(264,160,60,10),USE(?BOX111),COLOR(COLOR:Black),FILL(COLOR:ACTIVEBORDER),LINEWIDTH(1)
        BOX,AT(264,175,60,10),USE(?BOX112),COLOR(COLOR:Black),FILL(COLOR:INACTIVEBORDER),LINEWIDTH(1)
        BOX,AT(264,190,60,10),USE(?BOX113),COLOR(COLOR:Black),FILL(COLOR:APPWORKSPACE),LINEWIDTH(1)
        BOX,AT(264,205,60,10),USE(?BOX114),COLOR(COLOR:Black),FILL(COLOR:HIGHLIGHT),LINEWIDTH(1)
        BOX,AT(264,220,60,10),USE(?BOX115),COLOR(COLOR:Black),FILL(COLOR:HIGHLIGHTTEXT),LINEWIDTH(1)
        BOX,AT(264,235,60,10),USE(?BOX116),COLOR(COLOR:Black),FILL(COLOR:BTNFACE),LINEWIDTH(1)
        BOX,AT(264,250,60,10),USE(?BOX117),COLOR(COLOR:Black),FILL(COLOR:BTNSHADOW),LINEWIDTH(1)
        BOX,AT(264,265,60,10),USE(?BOX118),COLOR(COLOR:Black),FILL(COLOR:GRAYTEXT),LINEWIDTH(1)
        BOX,AT(264,280,60,10),USE(?BOX119),COLOR(COLOR:Black),FILL(COLOR:BTNTEXT),LINEWIDTH(1)
        BOX,AT(264,295,60,10),USE(?BOX120),COLOR(COLOR:Black),FILL(COLOR:INACTIVECAPTIONTEXT),LINEWIDTH(1)
        BOX,AT(264,310,60,10),USE(?BOX121),COLOR(COLOR:Black),FILL(COLOR:BTNHIGHLIGHT),LINEWIDTH(1)
        STRING('80000000h  COLOR:SCROLLBAR          '),AT(338,10),USE(?Color101)
        STRING('80000001h  COLOR:BACKGROUND         '),AT(338,25),USE(?Color102)
        STRING('80000002h  COLOR:ACTIVECAPTION      '),AT(338,40),USE(?Color103)
        STRING('80000003h  COLOR:INACTIVECAPTION    '),AT(338,55),USE(?Color104)
        STRING('80000004h  COLOR:MENU               '),AT(338,70),USE(?Color105)
        STRING('80000005h  COLOR:WINDOW             '),AT(338,85),USE(?Color106)
        STRING('80000006h  COLOR:WINDOWFRAME        '),AT(338,100),USE(?Color107)
        STRING('80000007h  COLOR:MENUTEXT           '),AT(338,115),USE(?Color108)
        STRING('80000008h  COLOR:WINDOWTEXT         '),AT(338,130),USE(?Color109)
        STRING('80000009h  COLOR:CAPTIONTEXT        '),AT(338,145),USE(?Color110)
        STRING('8000000Ah  COLOR:ACTIVEBORDER       '),AT(338,160),USE(?Color111)
        STRING('8000000Bh  COLOR:INACTIVEBORDER     '),AT(338,175),USE(?Color112)
        STRING('8000000Ch  COLOR:APPWORKSPACE       '),AT(338,190),USE(?Color113)
        STRING('8000000Dh  COLOR:HIGHLIGHT          '),AT(338,205),USE(?Color114)
        STRING('8000000Eh  COLOR:HIGHLIGHTTEXT      '),AT(338,220),USE(?Color115)
        STRING('8000000Fh  COLOR:BTNFACE            '),AT(338,235),USE(?Color116)
        STRING('80000010h  COLOR:BTNSHADOW          '),AT(338,250),USE(?Color117)
        STRING('80000011h  COLOR:GRAYTEXT           '),AT(338,265),USE(?Color118)
        STRING('80000012h  COLOR:BTNTEXT            '),AT(338,280),USE(?Color119)
        STRING('80000013h  COLOR:INACTIVECAPTIONTEXT'),AT(338,295),USE(?Color120)
        STRING('80000014h  COLOR:BTNHIGHLIGHT       '),AT(338,310),USE(?Color121)
        STRING('New Color Equates to Add'),AT(46,136),USE(?STRING1)
    END

  CODE
    open(window)
    ACCEPT
    END
 
!Equates.CLW is alos missing these
    OMIT('**END**')
CREATE:Slider       EQUATE(36)                    !Follows CREATE:progress (35)  
CREATE:DropButton   EQUATE(CREATE:combo + 0100H)  !Combo Drop Button, see PROP:ButtonFEQ 
    !end of OMIT('**END**')
!PROP:ButtonFEQ gives FEQ of Combo Button.
!The PROP:type of the Combo Button FEQ is 271 = 15 + 100h = CREATE:combo + 0100H 

 