package main

import (
	"fmt"
	"github.com/namsral/flag"
	"log"
	"os"
	"os/exec"
	"strings"
)

func init() {
	flag.Parse()
}

func main() {
	log.Println("[main] started")

	err := execCommand("xo schema pgsql://postgres:password@localhost/myapp_development?sslmode=disable -o models --exclude={ar_internal_metadata,schema_migrations} --template=json")
	if err != nil {
		panic(err.Error())
	}

	err = execCommand("xo schema pgsql://postgres:password@localhost/myapp_development?sslmode=disable -o models --exclude={ar_internal_metadata,schema_migrations} --template=createdb --createdb-constraint")
	if err != nil {
		panic(err.Error())
	}

	log.Println("[main] ended")
}

// execCommand run CLI commands from Go.
// SEE: https://github.com/walterwanderley/xo-grpc/blob/main/main.go#L122
func execCommand(command string) error {
	line := strings.Split(command, " ")
	cmd := exec.Command(line[0], line[1:]...)
	cmd.Stderr = os.Stderr
	cmd.Stdout = os.Stdout
	if err := cmd.Run(); err != nil {
		return fmt.Errorf("[error] %q: %w", command, err)
	}
	return nil
}
