//revive:disable:package-comments

package main

import (
	"os"

	"git.sonicoriginal.software/code-repository.git/extensions"

	"context"
	"crypto/tls"
	"net/http"

	logger "git.sonicoriginal.software/logger.git"
	app "git.sonicoriginal.software/server-routes-app.git"
	git "git.sonicoriginal.software/server-routes-git.git"
	"git.sonicoriginal.software/server.git/v2"
)

const (
	portEnvKey = "CODE_REPOSITORY_PORT"
	webAppPath = "web"
)

var (
	remoteAddress       string
	certs               []tls.Certificate
	mux                 = http.NewServeMux()
	ctx, cancelFunction = context.WithCancel(context.Background())
)

func main() {
	defer cancelFunction()

	gitPath, loader, err := extensions.InitializeGit()
	if err != nil {
		logger.DefaultLogger.Error("%v\n", err)
	}
	defer func(path string) {
		logger.DefaultLogger.Info("Removing git filesystem at [%v]\n", path)
		err := os.RemoveAll(path)
		if err != nil {
			logger.DefaultLogger.Error("%v\n", err)
			os.Exit(1)
		}
	}(gitPath)
	logger.DefaultLogger.Info("Git filesystem initialized at [%v]\n", gitPath)

	gitRoute := git.New("", loader, mux)
	logger.DefaultLogger.Info("Handler registered for route [%v]\n", gitRoute)

	appFS := os.DirFS(webAppPath)
	appRoute := app.New(appFS, mux)
	logger.DefaultLogger.Info("Handler registered for route [%v]\n", appRoute)

	remoteAddress, serverErrorChannel := server.Run(ctx, &certs, mux, portEnvKey)
	logger.DefaultLogger.Info("Serving on [%v]\n", remoteAddress)

	serverError := <-serverErrorChannel
	contextError := serverError.Context.Error()
	logger.DefaultLogger.Info("Server [%v] stopped: %v", remoteAddress, contextError)

	if serverError.Close != nil {
		logger.DefaultLogger.Error("Error closing server: %v", serverError.Close.Error())
	}

	if contextError != server.ErrContextCancelled.Error() {
		logger.DefaultLogger.Error("Server failed unexpectedly: %v", contextError)
	}
}
