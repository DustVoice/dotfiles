; Tree-sitter highlighting queries for M3L (Module Markup Language)
; Compatible with Helix editor
; Place at: ~/.config/helix/runtime/queries/m3l/highlights.scm

; ============================================================================
; STRUCTURE - Record Sets, Records, Headings
; ============================================================================

; Record Set: #### TYPE :: Name
(record_set
  "####" @punctuation.special)

(record_set_type) @type

(record_set
  "::" @punctuation.delimiter)

; Record: ### Name
(record
  "###" @punctuation.special)

(record
  base_path: (database_path) @string.special)

(record
  "::" @punctuation.delimiter)

; Heading: ## Text
(heading
  "##" @punctuation.special)

; ============================================================================
; ATTRIBUTES - Core syntax with special selectors
; ============================================================================

; Attribute marker
(attribute "@@" @keyword.directive)

; Special operators (append/prepend/remove)
(attribute
  operator: _ @keyword.operator)

; Attribute path components
(attribute_path) @variable.other.member

; CRITICAL: Wildcard selector (*) - Creates NEW nodes
(wildcard) @warning

; CRITICAL: Extender selector (_) - References LAST created node
(extender) @constant.builtin

; Regular identifiers in paths
(identifier) @variable.other.member

; Path separator
(attribute_path "." @punctuation.delimiter)

; Attribute separator
(attribute "::" @punctuation.delimiter)

; ============================================================================
; ATTRIBUTE VALUES - Typed data
; ============================================================================

; Number value (#)
(number_value
  "#" @keyword.operator)

(number_value) @constant.numeric

; Dice value (~)
(dice_value
  "~" @keyword.operator)

(dice_value) @constant.numeric.float

; Link value (@)
(link_value
  "@" @keyword.operator)

(link_data) @string.special

; Token value (!)
(token_value
  "!" @keyword.operator)

(token_data) @string.special

; Formula value ($)
(formula_value
  "$" @keyword.operator)

(formula_value) @function.macro

; Multiline value (|)
(multiline_value
  "|" @keyword.operator)

(multiline_value) @string

; Plain string value
(string_value) @string

; Dynamic reference in links (?@)
(dynamic_reference
  "?@" @keyword.special)

; Database paths
(database_path) @string.special

; Module references (@MODULE)
(link_data
  "@" @keyword.operator)

(token_data
  "@" @keyword.operator)

; ============================================================================
; INLINE FORMATTING - Markdown-like
; ============================================================================

; Bold + Italic: **//text//**
(bold_italic
  "**" @markup.bold
  "//" @markup.italic
  "**" @markup.bold)

(bold_italic) @markup.bold

; Bold: **text**
(bold
  "**" @markup.bold)

(bold) @markup.bold

; Italic: //text//
(italic
  "//" @markup.italic)

(italic) @markup.italic

; Underline: __text__
(underline
  "__" @markup.underline)

(underline) @markup.underline

; ============================================================================
; LINKS - Various formats
; ============================================================================

; Make entire link stand out prominently
(link) @markup.link.url

; Link markers - also highlight prominently
(link
  "{{" @markup.link.url
  "}}" @markup.link.url)

(link
  "::" @punctuation.delimiter)

; URL keyword
(link
  "url" @keyword)

; FG database links - window class
(link
  window_class: (identifier) @type)

; Dynamic links
(link
  dynamic_ref: (dynamic_reference) @keyword.special)

; ============================================================================
; CHAT FRAMES - Narrative text
; ============================================================================

; Chat frame markers
(chat_frame
  "<<" @punctuation.bracket
  ">>" @punctuation.bracket)

; Chat frame content
(chat_frame) @string
(chat_full_content) @string

; ============================================================================
; LISTS AND SEPARATORS
; ============================================================================

; List items
(list_item
  "--" @markup.list.unnumbered)

; Separators (---, ===, ___)
(separator) @comment

; ============================================================================
; GENERAL
; ============================================================================

; Plain text
(text) @text
