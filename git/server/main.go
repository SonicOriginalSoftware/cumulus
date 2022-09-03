//revive:disable:package-comments

package main

import (
	"context"
	"crypto/tls"

	"git.sonicoriginal.software/routes/git/cgi"
	lib "git.sonicoriginal.software/server"
	"git.sonicoriginal.software/server/logging"

	"github.com/go-git/go-billy/v5/memfs"
)

func main() {
	fsys := memfs.New()

	logging.DefaultLogger.Info("Starting...")

	cgi.Register(fsys)

	ctx, cancelFunction := context.WithCancel(context.Background())
	exitCode, _ := lib.Run(ctx, []tls.Certificate{})
	defer close(exitCode)

	if returnCode := <-exitCode; returnCode != 0 {
		logging.DefaultLogger.Error("Server errored: %v", returnCode)
	}

	cancelFunction()

	logging.DefaultLogger.Info("Shut down")
}
