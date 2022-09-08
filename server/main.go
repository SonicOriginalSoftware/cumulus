//revive:disable:package-comments

package main

import (
	"context"
	"crypto/tls"
	"os"

	"git.sonicoriginal.software/code-repository/git/api"
	"git.sonicoriginal.software/routes/app"
	"git.sonicoriginal.software/routes/git"
	"git.sonicoriginal.software/routes/git/repo"
	lib "git.sonicoriginal.software/server"
	"git.sonicoriginal.software/server/logging"

	"github.com/go-git/go-billy/v5/memfs"
)

func main() {
	const webAppPath = "web"

	fsys := memfs.New()
	appFS := os.DirFS(webAppPath)
	sampleRepoPath := "code-repository"

	if err := repo.Create(fsys, sampleRepoPath); err != nil {
		return
	}

	server := git.NewServer(fsys)
	git.New(server)
	api.New(server)
	app.New(appFS)

	ctx, cancelFunction := context.WithCancel(context.Background())
	exitCode, _ := lib.Run(ctx, []tls.Certificate{})
	defer close(exitCode)

	if returnCode := <-exitCode; returnCode != 0 {
		logging.DefaultLogger.Error("Server errored: %v", returnCode)
	}

	cancelFunction()
}
