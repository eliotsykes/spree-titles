# Uncomment this if you reference any of your controllers in activate
require_dependency 'application_controller'

class TitlesExtension < Spree::Extension
  version "1.0"
  description "Replaces the general Spree title with accurate titles."
  url "http://github.com/eliotsykes/spree-titles"

  def activate

    AppConfiguration.class_eval do
      # Override this default_title in the preferences table or with similar 
      # code in your site extension.
      preference :default_title, :string, :default => 'TitlesExtension - default_title - edit me'
    end
    
    Spree::BaseController.class_eval do
      
      def accurate_title
        return nil
      end
      
      def default_title
        title_string = accurate_title
        return title_string unless title_string.blank?
        return Spree::Config[:default_title]
      end
    end
    
    OrdersController.class_eval do
      def accurate_title
        translate('shopping_cart')
      end
    end
    
    PasswordResetsController.class_eval do
      def accurate_title
        return translate('forgot_password')
      end
    end
    
    ProductsController.class_eval do
      def accurate_title
        return @product.name if @product
      end
    end
    
    TaxonsController.class_eval do
      def accurate_title
        return @taxon.name if @taxon
      end
    end
    
    UsersController.class_eval do
      def accurate_title
        return translate('new_customer')
      end
    end
    
    UserSessionsController.class_eval do
      def accurate_title
        return translate('login_as_existing')
      end
    end
    
  end
end
