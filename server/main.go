//revive:disable:package-comments

package main

import (
	"context"
	"crypto/tls"
	"net/http"
	"os"

	logger "git.sonicoriginal.software/logger.git"
	"git.sonicoriginal.software/server.git/v2"

	"github.com/go-git/go-billy/memfs"
	"github.com/go-git/go-git/v5/plumbing"
)

const (
	defaultBranch = plumbing.Main
	portEnvKey    = "TEST_PORT"
	port          = "4430"
)

var (
	remoteAddress       string
	certs               []tls.Certificate
	testMux             = http.NewServeMux()
	ctx, cancelFunction = context.WithCancel(context.Background())
)

func main() {
	defer cancelFunction()

	os.Setenv(portEnvKey, port)

	remoteAddress, serverErrorChannel := server.Run(ctx, &certs, testMux, portEnvKey)
	logger.DefaultLogger.Info("Serving on [%v]\n", remoteAddress)

	const webAppPath = "web"

	_ = memfs.New()
	// appFS := os.DirFS(webAppPath)
	// sampleRepoPath := "code-repository"

	serverError := <-serverErrorChannel
	contextError := serverError.Context.Error()
	logger.DefaultLogger.Info("Server [%v] stopped: %v", remoteAddress, contextError)

	if serverError.Close != nil {
		logger.DefaultLogger.Error("Error closing server: %v", serverError.Close.Error())
	}

	if contextError != server.ErrContextCancelled.Error() {
		// t.Fatalf()
		logger.DefaultLogger.Error("Server failed unexpectedly: %v", contextError)
	}
}
