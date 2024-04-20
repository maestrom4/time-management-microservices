package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func playgroundHandler() gin.HandlerFunc {
	h := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Write(pageData) // pageData will be the GraphQL Playground page HTML data
	})
	return func(c *gin.Context) {
		h.ServeHTTP(c.Writer, c.Request)
	}
}

// Replace with the actual content of the Playground HTML file.
var pageData = []byte(`
<!DOCTYPE html>
<html>
<head>
  <meta charset=utf-8/>
  <title>GraphQL Playground</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      margin: 0;
      overflow: hidden;
    }
    #root {
      height: 100vh;
    }
  </style>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/graphql-playground-react/build/static/css/index.css" />
  <link rel="shortcut icon" href="//cdn.jsdelivr.net/npm/graphql-playground-react/build/favicon.png" />
  <script src="//cdn.jsdelivr.net/npm/graphql-playground-react/build/static/js/middleware.js"></script>
</head>
<body>
  <div id="root"></div>
  <script>window.addEventListener('load', function (event) {
    GraphQLPlayground.init(document.getElementById('root'), {
      endpoint: 'http://db-manager-service:8082/graphql' // The service name as the domain
    })
    
    })</script>
</body>
</html>
`)

func main() {
	r := gin.Default()
	r.GET("/playground", playgroundHandler())
	r.Run(":8080")
}
