include React::ServerRendering
module React
  module ServerRendering
    class I18nJsRenderer < SprocketsRenderer

      def before_render(component_name, props, prerender_options)
        super + "I18n.defaultLocale = '#{Orion::Application.config.i18n.default_locale}'; I18n.fallbacks = true; I18n.locale = '#{I18n.locale}';"
      end

    end
  end
end