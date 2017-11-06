#include <stdlib.h>
#include <stdio.h>
#include "game.h"
#include "myLib.h"
#include "bg.h"

PIECE pieces[PIECECOUNT];

// Initialize the game
void initGame() {
	initPieces();
}

void updateGame() {
	for (int i = 0; i < PIECECOUNT; i++)
		updatePiece(&pieces[i]);
}

void drawGame() {

    drawFullscreenImage4(bgBitmap);

    drawRect4(14, 44, 132, 72, GRAYID);
    drawRect4(20, 50, 120, 60, BLACKID);

    drawRect4(24, 134, 72, 78, GRAYID);
    drawRect4(30, 140, 60, 66, BLACKID);
}

void initPieces() {
	for (int i = 0; i < PIECECOUNT; i++) {
		pieces[i].xLoc = rand()%10;
		pieces[i].pieceType = rand()%7 + 1;
		pieces[i].rDel = 0;
		pieces[i].active = 0;
		switch(pieces[i].pieceType) {

			case 1:
				pieces[i].rect1Row = 0;
				pieces[i].rect1Col = pieces[i].xLoc;
				pieces[i].rect1Height = 6;
				pieces[i].rect1Width = 24;
			case 2:
				pieces[i].rect1Row = 0;
				pieces[i].rect1Col = pieces[i].xLoc;
				pieces[i].rect1Height = 6;
				pieces[i].rect1Width = 6;
				pieces[i].rect2Row = 6;
				pieces[i].rect2Col = pieces[i].xLoc;
				pieces[i].rect2Height = 6;
				pieces[i].rect2Width = 18;
			case 3:
				pieces[i].rect1Row = 0;
				pieces[i].rect1Col = pieces[i].xLoc + 12;
				pieces[i].rect1Height = 6;
				pieces[i].rect1Width = 6;
				pieces[i].rect2Row = 6;
				pieces[i].rect2Col = pieces[i].xLoc;
				pieces[i].rect2Height = 6;
				pieces[i].rect2Width = 18;
			case 4:
				pieces[i].rect1Row = 0;
				pieces[i].rect1Col = pieces[i].xLoc;
				pieces[i].rect1Height = 12;
				pieces[i].rect1Width = 12;
			case 5:
				pieces[i].rect1Row = 0;
				pieces[i].rect1Col = pieces[i].xLoc + 6;
				pieces[i].rect1Height = 6;
				pieces[i].rect1Width = 12;
				pieces[i].rect2Row = 6;
				pieces[i].rect2Col = pieces[i].xLoc;
				pieces[i].rect2Height = 6;
				pieces[i].rect2Width = 12;
			case 6:
				pieces[i].rect1Row = 0;
				pieces[i].rect1Col = pieces[i].xLoc + 6;
				pieces[i].rect1Height = 6;
				pieces[i].rect1Width = 6;
				pieces[i].rect2Row = 6;
				pieces[i].rect2Col = pieces[i].xLoc;
				pieces[i].rect2Height = 6;
				pieces[i].rect2Width = 18;
			case 7:
				pieces[i].rect1Row = 0;
				pieces[i].rect1Col = pieces[i].xLoc;
				pieces[i].rect1Height = 6;
				pieces[i].rect1Width = 12;
				pieces[i].rect2Row = 6;
				pieces[i].rect2Col = pieces[i].xLoc + 6;
				pieces[i].rect2Height = 6;
				pieces[i].rect2Width = 12;
		}
	}
}

void drawPiece(PIECE* p) {
	u8 color;
	switch(p->pieceType) {

		case 1:
			color = CYANID;
		case 2:
			color = BLUEID; 
		case 3:
			color = ORANGEID;
		case 4:
			color = YELLOWID;
		case 5:
			color = GREENID;
		case 6:
			color = PURPLEID;
		case 7:
			color = REDID;
	}

	if (p->active) {
		drawRect4(p->rect1Row, p->rect1Col, p->rect1Height, p->rect1Width, color);
		drawRect4(p->rect2Row, p->rect2Col, p->rect2Height, p->rect2Width, color);
	}

}

void updatePiece(PIECE* p) {
	if (p->active) {

	}
}