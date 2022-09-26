module git.sonicoriginal.software/code-repository

go 1.19

require (
	git.sonicoriginal.software/routes/app v0.0.0
	git.sonicoriginal.software/routes/git v0.0.0
	git.sonicoriginal.software/server v0.0.0
	github.com/go-git/go-billy/v5 v5.3.1
	github.com/go-git/go-git/v5 v5.4.2
)

require (
	github.com/ProtonMail/go-crypto v0.0.0-20220824120805-4b6e5c587895 // indirect
	github.com/acomagu/bufpipe v1.0.3 // indirect
	github.com/cloudflare/circl v1.2.0 // indirect
	github.com/emirpasic/gods v1.18.1 // indirect
	github.com/go-git/gcfg v1.5.0 // indirect
	github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/sergi/go-diff v1.2.0 // indirect
	golang.org/x/crypto v0.0.0-20220829220503-c86fa9a7ed90 // indirect
	golang.org/x/net v0.0.0-20220826154423-83b083e8dc8b // indirect
	golang.org/x/sys v0.0.0-20220829200755-d48e67d00261 // indirect
	gopkg.in/warnings.v0 v0.1.2 // indirect
)

replace (
	git.sonicoriginal.software/code-repository => github.com/SonicOriginalSoftware/code-repository v0.0.0
	git.sonicoriginal.software/routes/app => github.com/SonicOriginalSoftware/server-routes-app v0.0.0
	git.sonicoriginal.software/routes/git => github.com/SonicOriginalSoftware/server-routes-git v0.0.0
	git.sonicoriginal.software/server => github.com/SonicOriginalSoftware/server v0.0.0
)
