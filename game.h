typedef struct {
	int pieceType;
	int xLoc;
	int yLoc;
	int rDel;
	int active;
	int rect1Row;
	int rect1Col;
	int rect1Height;
	int rect1Width;
	int rect2Row;
	int rect2Col;
	int rect2Height;
	int rect2Width;
} PIECE;

// Constants
#define PIECECOUNT 100

extern PIECE pieces[PIECECOUNT];
extern int score;

#define NUMCOLORS 10

enum {BLACKID=(256-NUMCOLORS), CYANID, BLUEID, ORANGEID, YELLOWID, GREENID, PURPLEID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPieces();
void drawPiece(PIECE *);
void updatePiece(PIECE *);
void activatePieces();