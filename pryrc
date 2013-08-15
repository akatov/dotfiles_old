Pry.config.disable_auto_reload = true
Pry.config.should_load_plugins = false

require 'pry-doc'

main_prompt = proc { |target_self, nest_level, pry|
  env = case ENV['RAILS_ENV']
    when 'production'
      '[prod] '
    when 'qa'
      '[qa] '
    end
  "#{env}#{pry.input_array.size}:(#{Pry.view_clip(target_self)})> "
}

secondary_prompt = proc { |target_self, nest_level, pry|
  whitespace_length = main_prompt[target_self, nest_level, pry].length - 3
  "#{' ' * whitespace_length}>> "
}

Pry.prompt = [main_prompt, secondary_prompt]
