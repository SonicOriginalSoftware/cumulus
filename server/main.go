//revive:disable:package-comments

package main

import (
	"context"
	"crypto/tls"
	"os"

	git_api "git.sonicoriginal.software/code-repository/git/api"
	"git.sonicoriginal.software/routes/app"
	"git.sonicoriginal.software/routes/git"
	"git.sonicoriginal.software/routes/git/repo"
	lib "git.sonicoriginal.software/server"
	"git.sonicoriginal.software/server/logging"

	"github.com/go-git/go-billy/v5/memfs"
)

func main() {
	const webAppPath = "web"

	gitFS := memfs.New()
	appFS := os.DirFS(webAppPath)
	sampleRepoPath := "code-repository"

	if err := repo.Create(gitFS, sampleRepoPath); err != nil {
		return
	}

	server := git.NewServer(gitFS)
	git.New(server)
	git_api.New(server)
	app.New(appFS)

	ctx, cancelFunction := context.WithCancel(context.Background())
	exitCode, _ := lib.Run(ctx, []tls.Certificate{})
	defer close(exitCode)

	if returnCode := <-exitCode; returnCode != 0 {
		logging.DefaultLogger.Error("Server errored: %v", returnCode)
	}

	cancelFunction()
}
