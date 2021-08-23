# Seoul Teaching Search Backend
Backend for the [Seoul Teaching Search](https://github.com/TheBeege/seoul_teaching_search) application.

## Local Environment Setup
While we are providing Windows instructions, you should save yourself the future trouble and just setup an Ubuntu virtual machine.
1. Install the Java SDK
   * Windows
     * [Oracle JDK](https://www.oracle.com/java/technologies/javase-jdk16-downloads.html)
     * [Instructions for OpenJDK](https://www.codejava.net/java-se/download-and-install-openjdk-16)
   * Mac
     * Install Homebrew with `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
     * Run `brew install openjdk@16`
   * Ubuntu: `sudo apt install openjdk-16-jdk`
   * Something else? Alright, hipster, you can figure out your own shit.
2. Install Docker and docker-compose
    * Windows
      * [WSL Setup Instructions](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
      * [Docker Desktop Installation](https://docs.docker.com/desktop/windows/install/)
    * Mac
      * [Docker Desktop Installation](https://docs.docker.com/desktop/mac/install/)
    * Ubuntu
      * [Docker Installation Instructions](https://docs.docker.com/engine/install/ubuntu/)
      * [Docker Compose Installation](https://docs.docker.com/compose/install/)
3. Start the database with `docker-compose up -d`

Good job. You're ready. You can view the database using the [adminer UI at `http://localhost:8080`](http://localhost:8080). Select PostgreSQL as the database and use the credentials `postgres` / `postgres`.

When you're finished and want to tear down the database, you can use `docker-compose down`.