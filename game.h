typedef struct {
	int pieceType;
	int xLoc;
	int rDel;
} PIECE;

// Constants
#define PIECECOUNT 100

extern PIECE pieces[PIECECOUNT];

#define NUMCOLORS 9

enum {BLACKID=(256-NUMCOLORS), CYANID, BLUEID, ORANGEID, YELLOWID, GREENID, PURPLEID, REDID, WHITEID};
extern unsigned short colors[NUMCOLORS];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPieces();
void drawPiece();
void updatePiece(PIECE *);