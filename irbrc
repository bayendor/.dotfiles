require 'irb/completion'
require 'irb/ext/save-history'
require 'json'
require 'awesome_print'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# AwesomePrint.irb!
