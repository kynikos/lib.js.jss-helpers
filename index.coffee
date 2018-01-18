# This file is part of jss-helpers
# Copyright (C) 2017-present Dario Giovannetti <dev@dariogiovannetti.net>
# Licensed under MIT
# https://github.com/kynikos/jss-helpers/blob/master/LICENSE

react_helpers = require('../react-helpers/index')
styled_jss = require('styled-jss')
styled = styled_jss.default


createFactory = (type) ->
    (style) ->
        react_helpers.createFactory(styled(type)(style))


# TODO: Verify the tag names against html-tag-names in tests like in
#       hyperscript-helpers
#       Also include the SVG tags?
# See https://github.com/ohanhi/hyperscript-helpers/issues/34 for the reason
# why the tags aren't simply required from html-tag-names
HTML_TAG_NAMES = [
  'a', 'abbr', 'acronym', 'address', 'applet', 'area', 'article', 'aside',
  'audio', 'b', 'base', 'basefont', 'bdi', 'bdo', 'bgsound', 'big', 'blink',
  'blockquote', 'body', 'br', 'button', 'canvas', 'caption', 'center', 'cite',
  'code', 'col', 'colgroup', 'command', 'content', 'data', 'datalist', 'dd',
  'del', 'details', 'dfn', 'dialog', 'dir', 'div', 'dl', 'dt', 'element', 'em',
  'embed', 'fieldset', 'figcaption', 'figure', 'font', 'footer', 'form',
  'frame', 'frameset', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'head', 'header',
  'hgroup', 'hr', 'html', 'i', 'iframe', 'image', 'img', 'input', 'ins',
  'isindex', 'kbd', 'keygen', 'label', 'legend', 'li', 'link', 'listing',
  'main', 'map', 'mark', 'marquee', 'math', 'menu', 'menuitem', 'meta',
  'meter', 'multicol', 'nav', 'nextid', 'nobr', 'noembed', 'noframes',
  'noscript', 'object', 'ol', 'optgroup', 'option', 'output', 'p', 'param',
  'picture', 'plaintext', 'pre', 'progress', 'q', 'rb', 'rbc', 'rp', 'rt',
  'rtc', 'ruby', 's', 'samp', 'script', 'section', 'select', 'shadow', 'slot',
  'small', 'source', 'spacer', 'span', 'strike', 'strong', 'style', 'sub',
  'summary', 'sup', 'svg', 'table', 'tbody', 'td', 'template', 'textarea',
  'tfoot', 'th', 'thead', 'time', 'title', 'tr', 'track', 'tt', 'u', 'ul',
  'var', 'video', 'wbr', 'xmp'
]

for tagName in HTML_TAG_NAMES
    module.exports[tagName] = createFactory(tagName)
    module.exports[tagName.charAt(0).toUpperCase() + tagName.slice(1)] =
        createFactory(tagName)


module.exports.createFactory = createFactory
module.exports.create_factory = createFactory
module.exports.styled = createFactory
module.exports.Styled = styled_jss.Styled
module.exports.injectStyled = styled_jss.injectStyled
