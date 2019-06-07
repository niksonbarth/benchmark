package main

import (
	"github.com/gin-gonic/gin"
	"math/rand"
	"time"
)
func fib(n int) int {
	if n <= 1 {
		return n
	}
	return fib(n - 1) + fib(n - 2)
}
func main() {
	r := gin.Default()
	r.GET("/bench", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": fib(15),
		})
	})
	r.Run("0.0.0.0:8000") // listen and serve on 0.0.0.0:8000
}