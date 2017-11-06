# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
typedef struct {
 int pieceType;
 int xLoc;
 int rDel;
} PIECE;




extern PIECE pieces[100];



enum {BLACKID=(256-9), CYANID, BLUEID, ORANGEID, YELLOWID, GREENID, PURPLEID, REDID, WHITEID};
extern unsigned short colors[9];


void initGame();
void updateGame();
void drawGame();
void initPieces();
void drawPiece();
void updatePiece(PIECE *);
# 2 "game.c" 2
# 1 "myLib.h" 1




typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned char u8;
# 29 "myLib.h"
extern unsigned short *videoBuffer;
# 51 "myLib.h"
void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();
void loadPalette(const unsigned short * palette);
# 88 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 99 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    unsigned int cnt;
} DMA;


extern DMA *dma;
# 139 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 3 "game.c" 2
# 1 "bg.h" 1
# 21 "bg.h"
extern const unsigned short bgBitmap[19200];


extern const unsigned short bgPal[256];
# 4 "game.c" 2

PIECE pieces[100];


void initGame() {



    unsigned short colors[9] = {0, ((0) | (31)<<5 | (31)<<10), ((0) | (0)<<5 | (31)<<10), ((31) | (11)<<5 | (0)<<10), ((31) | (31)<<5 | (0)<<10), ((0) | (31)<<5 | (0)<<10), ((23) | (0)<<5 | (31)<<10), ((31) | (0)<<5 | (0)<<10), ((31) | (31)<<5 | (31)<<10)};


    loadPalette(bgPal);


    for (int i = 0; i < 9; i++) {
        ((unsigned short *)0x5000000)[256-9 +i] = colors[i];
    }
}
