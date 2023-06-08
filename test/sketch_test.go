package test

import (
	"bytes"
	"fmt"
	"image"
	"image/color"
	"image/draw"
	"image/jpeg"
	"image/png"
	"log"
	"os"
	"strconv"
	"testing"
	"time"
)

func TestSketch(t *testing.T) {
	AddLines("/Users/yangsen/Downloads/cc.jpeg", 1)
}

func AddLines(fileUrl string, lColor int) {
	// 0 - red
	// 1 - green
	// 2 - purple
	lineColors := []color.RGBA{{255, 0, 0, 255}, {95, 174, 227, 255}, {75, 0, 130, 255}}
	if lColor > len(lineColors) {
		log.Println(`color number must be less than 3`)
		return
	}
	// 在图片上绘制一条红色线段
	lineColor := lineColors[lColor]
	// 打开图片文件
	file, err := os.Open(fileUrl)
	if err != nil {
		panic(err)
	}
	defer file.Close()

	// 解码 JPEG 图片
	img, err := jpeg.Decode(file)
	if err != nil {
		panic(err)
	}

	//计算宽高
	bounds := img.Bounds()
	x := bounds.Dx()
	y := bounds.Dy()
	log.Println(`图片宽高为(px)：`, x, y)

	line := image.NewRGBA(img.Bounds())
	//十字线
	drawLine(line, lineColor, image.Pt(x/2, 0), image.Pt(x/2, y))
	drawLine(line, lineColor, image.Pt(0, y/2), image.Pt(x, y/2))
	if x > y {
		//横线
		drawLine(line, lineColor, image.Pt(0, y/2+y/4), image.Pt(x, y/2+y/4))
		drawLine(line, lineColor, image.Pt(0, y/4), image.Pt(x, y/4))
		//竖线
		drawLine(line, lineColor, image.Pt(x/2+y/4, 0), image.Pt(x/2+y/4, y))
		drawLine(line, lineColor, image.Pt(x/2-y/4, 0), image.Pt(x/2-y/4, y))
		//竖2
		drawLine(line, lineColor, image.Pt(x/2+y/2, 0), image.Pt(x/2+y/2, y))
		drawLine(line, lineColor, image.Pt(x/2-y/2, 0), image.Pt(x/2-y/2, y))
		if x/2-y/2-y/4 > 0 {
			//竖3
			drawLine(line, lineColor, image.Pt(x/2+y/2+y/4, 0), image.Pt(x/2+y/2+y/4, y))
			drawLine(line, lineColor, image.Pt(x/2-y/2-y/4, 0), image.Pt(x/2-y/2-y/4, y))
		}
	} else {
		//竖线
		drawLine(line, lineColor, image.Pt(x/4, 0), image.Pt(x/4, y))
		drawLine(line, lineColor, image.Pt(x/2+x/4, 0), image.Pt(x/2+x/4, y))
		//横线
		drawLine(line, lineColor, image.Pt(0, y/2-x/4), image.Pt(x, y/2-x/4))
		drawLine(line, lineColor, image.Pt(0, y/2+x/4), image.Pt(x, y/2+x/4))
		//横线2
		drawLine(line, lineColor, image.Pt(0, y/2-x/2), image.Pt(x, y/2-x/2))
		drawLine(line, lineColor, image.Pt(0, y/2+x/2), image.Pt(x, y/2+x/2))
		if y/2-x/2-x/4 > 0 {
			//横线3
			drawLine(line, lineColor, image.Pt(0, y/2-x/2-x/4), image.Pt(x, y/2-x/2-x/4))
			drawLine(line, lineColor, image.Pt(0, y/2+x/2+x/4), image.Pt(x, y/2+x/2+x/4))
		}
	}
	log.Println("drawLine finished.")
	// 将线段合并到原始图片上
	result := image.NewRGBA(img.Bounds())
	draw.Draw(result, img.Bounds(), img, image.ZP, draw.Src)
	draw.Draw(result, line.Bounds(), line, image.ZP, draw.Over)

	// 保存结果图片(时间戳)
	now := time.Now().Unix()
	nowStr := strconv.Itoa(int(now))
	fileName := nowStr + ".jpg"
	outFile, err := os.Create(fileName)
	if err != nil {
		panic(err)
	}
	defer outFile.Close()
	jpeg.Encode(outFile, result, &jpeg.Options{Quality: 100})
	log.Println("success !", fileName)
}

// 绘制一条线段
func drawLine(img *image.RGBA, c color.RGBA, start, end image.Point) {
	dx := abs(end.X - start.X)
	dy := abs(end.Y - start.Y)
	sx := -1
	if start.X < end.X {
		sx = 1
	}
	sy := -1
	if start.Y < end.Y {
		sy = 1
	}
	err := dx - dy

	for {
		img.Set(start.X, start.Y, c)
		if start == end {
			break
		}
		e2 := 2 * err
		if e2 > -dy {
			err -= dy
			start.X += sx
		}
		if e2 < dx {
			err += dx
			start.Y += sy
		}
	}
}

// 返回 x 的绝对值
func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

func TestPngSketch(t *testing.T) {
	// 读取PNG数据
	pngData, err := os.ReadFile("/Users/yangsen/Downloads/wx12.png")
	if err != nil {
		fmt.Println("读取PNG数据失败：", err)
		return
	}

	// 解码PNG数据
	img, err := png.Decode(bytes.NewReader(pngData))
	if err != nil {
		fmt.Println("解码PNG数据失败：", err)
		return
	}

	// 获取图片尺寸
	bounds := img.Bounds()
	width := bounds.Dx()
	height := bounds.Dy()

	// 创建新的图片对象
	newImg := image.NewRGBA(img.Bounds())

	// 将PNG数据拷贝到图片对象
	for y := img.Bounds().Min.Y; y < img.Bounds().Max.Y; y++ {
		for x := img.Bounds().Min.X; x < img.Bounds().Max.X; x++ {
			newImg.Set(x, y, img.At(x, y))
		}
	}

	// 画一条红色直线
	red := color.RGBA{255, 0, 0, 255}
	//横线
	for x := 0; x < width; x++ {
		newImg.SetRGBA(x, height/2, red)
		if width > height {
			newImg.SetRGBA(x, height/4, red)
			newImg.SetRGBA(x, height/2+height/4, red)
		} else {
			newImg.SetRGBA(x, height/2+width/2, red)
			newImg.SetRGBA(x, height/2-width/2, red)
			newImg.SetRGBA(x, height/2+width/4, red)
			newImg.SetRGBA(x, height/2-width/4, red)
		}
	}
	//竖线
	for y := 0; y < height; y++ {
		newImg.SetRGBA(width/2, y, red)
		if width > height {
			newImg.SetRGBA(width/2-height/4, y, red)
			newImg.SetRGBA(width/2+height/4, y, red)
			newImg.SetRGBA(width/2-height/2, y, red)
			newImg.SetRGBA(width/2+height/2, y, red)
		} else {
			newImg.SetRGBA(width/2+width/4, y, red)
			newImg.SetRGBA(width/2-width/4, y, red)
		}
	}

	// 保存新的图片对象
	file, err := os.Create("new_image.png")
	if err != nil {
		fmt.Println("创建新图片文件失败：", err)
		return
	}
	defer file.Close()

	err = png.Encode(file, newImg)
	if err != nil {
		fmt.Println("保存新图片文件失败：", err)
		return
	}

	fmt.Println("PNG数据已成功拷贝到新的图片对象中。")
}
