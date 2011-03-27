package com.github.bballant

import org.scalatest.FunSuite
import org.scalatest.matchers.ShouldMatchers

class BasicTestSuite extends FunSuite with ShouldMatchers {

  def timeAFunction(times: Int)(fn: => Unit) {
    val t = System.currentTimeMillis
    for (i <- 1 to times) fn
    val e = System.currentTimeMillis - t
    val perSec = times * 1000 / e
    println("Time to complete: " + e + " for " + times + " times")
    println("           Thats: " + perSec + " per second") 
    perSec
  }

  test ("should pass") {
    assert(true)
  } 

}
