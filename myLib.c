#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set a pixel on the screen in Mode 3
void setPixel3(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int row, int col, u8 colorIndex) {
	u16 pixelData = videoBuffer[OFFSET(row, col, SCREENWIDTH)/2];
	if (col & 1) { // col is odd
		pixelData &= 0x00FF;
		pixelData |= (colorIndex << 8);
	} else { // col is even
		pixelData &= 0xFF00;
		pixelData |= colorIndex;		
	}
	videoBuffer[OFFSET(row, col, SCREENWIDTH) / 2] = pixelData;

}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int row, int col, int height, int width, volatile unsigned short color) {

	for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
	}
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex) {

    // TODO 5.0: Write this function using DMA

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
		if (!(width & 1)) { // width is even
			if (!(col & 1)) { //col is even
				for (int r = 0; r < height; r++) {
					DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, 240)/2], width / 2 | DMA_SOURCE_FIXED);
				}
			} else { //col is odd
				for (int i = 0; i < height; i++) {
					setPixel4(row + i, col, colorIndex);
				}
				for (int r = 0; r < height; r++) {
					DMANow(3, &color, &videoBuffer[OFFSET(row+r, col + 1, 240)/2], (width - 2) / 2 | DMA_SOURCE_FIXED);
				}
				for (int i = 0; i < height; i++) {
					setPixel4(row + i, col + width - 1, colorIndex);
				}
			}
		} else { // width is odd
			if (!(col & 1)) { //col is even
				for (int r = 0; r < height; r++) {
					DMANow(3, &color, &videoBuffer[OFFSET(row+r, col, 240)/2], (width - 1) / 2 | DMA_SOURCE_FIXED);
				}
				for (int i = 0; i < height; i++) {
					setPixel4(row + i, col + width - 1, colorIndex);
				}
			} else { //col is odd
				for (int i = 0; i < height; i++) {
					setPixel4(row + i, col, colorIndex);
				}
				for (int r = 0; r < height; r++) {
					DMANow(3, &color, &videoBuffer[OFFSET(row+r, col + 1, 240)/2], (width - 1) / 2 | DMA_SOURCE_FIXED);
				}
			}
		}
	}

}

// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {

	DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {
    
    // TODO 2.0: Write this function using DMA
    u16 color = colorIndex << 8 | colorIndex;
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT) / 2);


}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int row, int col, int height, int width, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width)], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int row, int col, int height, int width, const unsigned short *image) {

    // TODO 4.0: Write this function using DMA
    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(r, 0, width/2)], &videoBuffer[OFFSET(row+r, col, SCREENWIDTH)/2], width / 2);
    }
}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {

    // TODO 3.0: Write this function using DMA
    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT / 2);
}

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

void loadPalette(const unsigned short *palette) {

    // TODO 3.1: Write this function using DMA
    DMANow(3, palette, PALETTE, 256);
    
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB) {

    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}