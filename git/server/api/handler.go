//revive:disable:package-comments

package api

import (
	"fmt"
	"net/http"

	"git.sonicoriginal.software/server/handlers"
	"git.sonicoriginal.software/server/logging"
	"github.com/go-git/go-git/v5/plumbing/transport"
)

const serviceName = "git"
const apiPathName = "api"

// Handler handles API requests for git
type Handler struct {
	logger *logging.Logger
	server transport.Transport
}

func (handler *Handler) ServeHTTP(writer http.ResponseWriter, request *http.Request) {
}

// New returns a new Handler
func New(server transport.Transport) (handler *Handler) {
	logger := logging.New(serviceName)
	handler = &Handler{logger, server}
	apiPath := fmt.Sprintf("%v/%v", serviceName, apiPathName)
	handlers.Register(serviceName, "", apiPath, handler, logger)

	return
}
