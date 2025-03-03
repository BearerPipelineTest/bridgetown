# frozen_string_literal: true

# rubocop:disable all

unless File.exist?("postcss.config.js")
  error_message = "#{"postcss.config.js".bold} not found. Please configure postcss in your project."

  @logger.error "\nError:".red, "🚨 #{error_message}"
  @logger.info "\nRun #{"bridgetown webpack enable-postcss".bold.blue} to set it up.\n"

  return
end

confirm = ask "This configuration will ovewrite your existing #{"postcss.config.js".bold.white}. Would you like to continue? [Yn]"
return unless confirm.casecmp?("Y")

plugins = %w(postcss-mixins postcss-color-mod-function cssnano)

say "Adding the following PostCSS plugins: #{plugins.join(' | ')}", :green
run "yarn add -D #{plugins.join(' ')}"

copy_file in_templates_dir("postcss.config.js"), "postcss.config.js", force: true

# rubocop:enable all
