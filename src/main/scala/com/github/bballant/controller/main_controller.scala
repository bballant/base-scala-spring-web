package com.github.bballant.controller

import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.{
  PathVariable, RequestMapping, RequestMethod, ResponseBody
}

@Controller
@RequestMapping(value=Array("/"))
class MainController {

  @RequestMapping(method=Array(RequestMethod.GET))
  def getPage(model: Model): String = {
    "main/index"
  }


  @RequestMapping(value=Array("{page}"), method=Array(RequestMethod.GET))
  def getPage(@PathVariable page: Int, model: Model): String = {
    "page/p"+page
  }
}

