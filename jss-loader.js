# This file is part of jss-helpers
# Copyright (C) 2017-present Dario Giovannetti <dev@dariogiovannetti.net>
# Licensed under MIT
# https://github.com/kynikos/jss-helpers/blob/master/LICENSE

const {default: jss} = require('jss')
const {default: jssPreset} = require('jss-preset-default')
jss.setup(jssPreset())


module.exports = function jssLoader(source, map, meta) {
  const sheet = jss.createStyleSheet(eval(source))

  const css = sheet.toString()

  this.callback(null, css, map, meta)

  // always return undefined when calling callback()
  return
}
