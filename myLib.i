# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
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
# 2 "myLib.c" 2


unsigned short *videoBuffer = (unsigned short *)0x6000000;


DMA *dma = (DMA *)0x40000B0;


void setPixel3(int row, int col, unsigned short color) {

 videoBuffer[((row)*(240)+(col))] = color;
}


void setPixel4(int row, int col, u8 colorIndex) {
 u16 pixelData = videoBuffer[((row)*(240)+(col))/2];
 if (col & 1) {
  pixelData &= 0x00FF;
  pixelData |= (colorIndex << 8);
 } else {
  pixelData &= 0xFF00;
  pixelData |= colorIndex;
 }
 videoBuffer[((row)*(240)+(col)) / 2] = pixelData;

}


void drawRect3(int row, int col, int height, int width, volatile unsigned short color) {

 for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))], (2 << 23) | width);
 }
}


void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {



 u16 color = colorIndex << 8 | colorIndex;

 if (width == 1) {
  for (int i = 0; i < height; i++) {
   setPixel4(row + i, col, colorIndex);
  }
 } else if ((width == 2) && (col & 1)) {
  for (int i = 0; i < height; i++) {
   for (int j = 0; j < width; j++) {
    setPixel4(row + i, col + j, colorIndex);
   }
  }
 } else {
  if (!(width & 1)) {
   if (!(col & 1)) {
    for (int r = 0; r < height; r++) {
     DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))/2], width / 2 | (2 << 23));
    }
   } else {
    for (int i = 0; i < height; i++) {
     setPixel4(row + i, col, colorIndex);
    }
    for (int r = 0; r < height; r++) {
     DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col + 1))/2], (width - 2) / 2 | (2 << 23));
    }
    for (int i = 0; i < height; i++) {
     setPixel4(row + i, col + width - 1, colorIndex);
    }
   }
  } else {
   if (!(col & 1)) {
    for (int r = 0; r < height; r++) {
     DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col))/2], (width - 1) / 2 | (2 << 23));
    }
    for (int i = 0; i < height; i++) {
     setPixel4(row + i, col + width - 1, colorIndex);
    }
   } else {
    for (int i = 0; i < height; i++) {
     setPixel4(row + i, col, colorIndex);
    }
    for (int r = 0; r < height; r++) {
     DMANow(3, &color, &videoBuffer[((row+r)*(240)+(col + 1))/2], (width - 1) / 2 | (2 << 23));
    }
   }
  }
 }

}


void fillScreen3(volatile unsigned short color) {

 DMANow(3, &color, videoBuffer, (2 << 23) | (240 * 160));
}


void fillScreen4(volatile unsigned char colorIndex) {


    u16 color = colorIndex << 8 | colorIndex;
    DMANow(3, &color, videoBuffer, (2 << 23) | (240 * 160) / 2);


}


void drawImage3(int row, int col, int height, int width, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width)+(0))], &videoBuffer[((row+r)*(240)+(col))], width);
    }
}


void drawImage4(int row, int col, int height, int width, const unsigned short *image) {


    for(int r = 0; r < height; r++) {
        DMANow(3, &image[((r)*(width/2)+(0))], &videoBuffer[((row+r)*(240)+(col))/2], width / 2);
    }
}


void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, 240 * 160);
}


void drawFullscreenImage4(const unsigned short *image) {


    DMANow(3, image, videoBuffer, 240 * 160 / 2);
}


void waitForVBlank() {

 while((*(volatile unsigned short *)0x4000006) > 160);
 while((*(volatile unsigned short *)0x4000006) < 160);
}


void flipPage() {

    if ((*(unsigned short *)0x4000000) & (1<<4)) {
        videoBuffer = ((unsigned short *)0x600A000);
    } else {
        videoBuffer = ((unsigned short *)0x6000000);
    }
    (*(unsigned short *)0x4000000) ^= (1<<4);
}

void loadPalette(const unsigned short *palette) {


    DMANow(3, palette, ((unsigned short *)0x5000000), 256);

}


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {


    dma[channel].cnt = 0;


    dma[channel].src = src;
    dma[channel].dst = dst;


    dma[channel].cnt = cnt | (1 << 31);
}


int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}
