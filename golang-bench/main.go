package main

import (
	"github.com/gin-gonic/gin"
	"math/rand"
	"time"
)

func main() {
	r := gin.Default()
	r.GET("/bench", func(c *gin.Context) {
		r := rand.Intn(10)
		time.Sleep(time.Duration(r) * time.Second)
		c.JSON(200, gin.H{
			"message": "ok",
		})
	})
	r.Run("0.0.0.0:8000") // listen and serve on 0.0.0.0:8080
}