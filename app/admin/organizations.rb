ActiveAdmin.register Organization do
  permit_params :name,  product_ids: []

  show title: 'My Organization' do
    h3 'You have '+ pluralize(organization.products.count, ' product') + ' for this organization'
    organization.products.each do |product|
      div do
        h1 product.title
        h4 link_to "[#{product.id}]: You created this product on #{product.created_at.strftime("%a, %b, %y at %I%M %p")}", admin_product_path(product)
      end 
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :establish_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :establish_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
