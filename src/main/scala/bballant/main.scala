package bballant

import org.mortbay.jetty.Server
import org.mortbay.jetty.webapp.WebAppContext


object ServerConfig {
  lazy val port = 8220
}

object BasicWebServer {
  def start() {
    println("Starting web server")
    val server:Server = new Server(ServerConfig.port);
    val webapp:WebAppContext = new WebAppContext("src/main/webapp", "/")

    server.setHandler(webapp); 
    server.start()
  }

  def main(args: Array[String]) {
    start()
  }
}

