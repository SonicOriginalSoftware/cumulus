//revive:disable:package-comments

package extensions

import (
	"os"

	"github.com/go-git/go-billy/v5"
	"github.com/go-git/go-billy/v5/osfs"
	git_server "github.com/go-git/go-git/v5/plumbing/transport/server"
)

// InitializeGit initializes the root git filesystem
func InitializeGit() (path string, loader git_server.Loader, err error) {
	pathPrefix := os.TempDir()

	path, err = os.MkdirTemp(pathPrefix, "repos")
	if err != nil {
		return
	}

	var gitFS billy.Filesystem = osfs.New(path)
	loader = git_server.NewFilesystemLoader(gitFS)

	return
}
