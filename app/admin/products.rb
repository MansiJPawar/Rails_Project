ActiveAdmin.register Product do
  permit_params :name, :cost, :tag, :organization_id

  form title: 'Product App' do |f|
    f.inputs 'Product' do
      f.input :organization
      f.input :name
      f.input :cost
      f.input :tag
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :cost, :organization_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :cost, :organization_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
