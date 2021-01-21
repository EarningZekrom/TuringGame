include "graphic.t"
var iBackground := 34
var iX, iY, iFireCheck : int
var bDirectionCheck : boolean
iX := 100
iY := 100
bDirectionCheck := true
iFireCheck := 0
class Kangaroo
    import iX, iY, background, bDirectionCheck, iBackground, iFireCheck
    export Display, LeftDisplay, MoveRight, MoveUp, MoveLeft, MoveDown, Fire, LeftFire
    var kangaroo : int := Pic.FileNew ("devilkangaroo.jpg")
    var leftkangaroo : int := Pic.FileNew ("devilkangarooleft.jpg")
    var iXKangaroo, iYKangaroo : int
    procedure Display (ipX, ipY : int)
	Pic.Draw (kangaroo, iX, iY, picCopy)
	bDirectionCheck := true
    end Display
    procedure LeftDisplay (iLeftX, iRightX : int)
	Pic.Draw (leftkangaroo, iX, iY, picCopy)
	bDirectionCheck := false
    end LeftDisplay
    procedure MoveRight
	background (iBackground)
	iX := iX + 10
    end MoveRight
    procedure MoveLeft
	background (iBackground)
	delay (10)
	iX := iX - 10
    end MoveLeft
    procedure MoveUp
	background (34)
	iY := iY + 10
    end MoveUp
    procedure MoveDown
	background (34)
	iY := iY - 10
    end MoveDown
    procedure Fire
	drawline (iX + 131, iY + 104, iX + 181, iY + 104, red)
	delay (50)
	drawline (iX + 131, iY + 104, iX + 281, iY + 104, iBackground)
	drawline (iX + 231, iY + 104, iX + 281, iY + 104, red)
	delay (50)
	drawline (iX + 231, iY + 104, iX + 281, iY + 104, iBackground)
	drawline (iX + 331, iY + 104, iX + 381, iY + 104, red)
	delay (50)
	drawline (iX + 235, iY + 104, iX + 285, iY + 104, iBackground)
    end Fire
    procedure LeftFire
	drawline (iX, iY + 104, iX - 50, iY + 104, red)
	delay (50)
	drawline (iX, iY + 104, iX - 50, iY + 104, iBackground)
	drawline (iX - 100, iY + 104, iX - 150, iY + 104, red)
	delay (50)
	drawline (iX - 100, iY + 104, iX - 150, iY + 104, iBackground)
	drawline (iX - 200, iY + 104, iX - 250, iY + 104, red)
	delay (50)
	drawline (iX - 250, iY + 104, iX - 300, iY + 104, iBackground)
    end LeftFire
end Kangaroo

type KangarooClass : pointer to Kangaroo
procedure ConstructKangaroo (var opK : KangarooClass)
    % Initialise the object's fields
    new Kangaroo, opK
    opK -> Display (0, 0)

end ConstructKangaroo
var oGameKangaroo : KangarooClass
var cLetter : string
cLetter := "p"
View.Set ("graphics: 1200, 600")
background (iBackground)

ConstructKangaroo (oGameKangaroo)

iX := 100
iY := 100
loop
    if hasch then
	cLetter := getchar
	if cLetter = "a" then
	    oGameKangaroo -> MoveLeft
	    bDirectionCheck := false
	    oGameKangaroo -> LeftDisplay (iX, iY)
	elsif cLetter = "d" then
	    oGameKangaroo -> MoveRight
	    bDirectionCheck := true
	    oGameKangaroo -> Display (iX, iY)
	elsif cLetter = "w" and bDirectionCheck = true then
	    oGameKangaroo -> MoveUp
	    oGameKangaroo -> Display (iX, iY)
	elsif cLetter = "w" and bDirectionCheck = false then
	    oGameKangaroo -> MoveUp
	    oGameKangaroo -> LeftDisplay (iX, iY)
	elsif cLetter = "s" and bDirectionCheck = true then
	    oGameKangaroo -> MoveDown
	    oGameKangaroo -> Display (iX, iY)
	elsif cLetter = "s" and bDirectionCheck = false then
	    oGameKangaroo -> MoveDown
	    oGameKangaroo -> LeftDisplay (iX, iY)
	elsif cLetter = "f" and bDirectionCheck = true then
	    oGameKangaroo -> Fire
	    oGameKangaroo -> Display (iX, iY)
	elsif cLetter = "f" and bDirectionCheck = false then
	    oGameKangaroo -> LeftFire
	    oGameKangaroo -> LeftDisplay (iX, iY)
	end if
	if iY > maxy then
	    delay (100)
	end if
    end if
end loop







