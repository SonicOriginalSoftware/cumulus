//revive:disable:package-comments

package main

import (
	"context"
	"crypto/tls"

	"git.sonicoriginal.software/code-repository/api"
	"git.sonicoriginal.software/routes/git"
	"git.sonicoriginal.software/routes/git/repo"
	lib "git.sonicoriginal.software/server"
	"git.sonicoriginal.software/server/logging"

	"github.com/go-git/go-billy/v5/memfs"
)

func main() {
	fsys := memfs.New()
	sampleRepoPath := "code-repository"

	if err := repo.Create(fsys, sampleRepoPath); err != nil {
		return
	}

	server := git.NewServer(fsys)
	git.New(server)
	api.New(server)

	ctx, cancelFunction := context.WithCancel(context.Background())
	exitCode, _ := lib.Run(ctx, []tls.Certificate{})
	defer close(exitCode)

	if returnCode := <-exitCode; returnCode != 0 {
		logging.DefaultLogger.Error("Server errored: %v", returnCode)
	}

	cancelFunction()
}
