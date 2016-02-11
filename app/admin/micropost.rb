ActiveAdmin.register Micropost do

  menu priority: 2

  permit_params :micropost_text, :user_id

  index do
    id_column
    column :micropost_text
    column :user_id
    actions
  end

  filter :user_id, as: :select, collection: User.all.order(id: 'desc')
  filter :micropost_text

  show do
    panel 'Micropost info' do
      attributes_table_for micropost do
        row :id
        row :user_id
        row :micropost_text
      end
    end
  end

  form do |f|
    f.inputs 'Change micropost text:' do
      f.input :micropost_text
    end
    f.actions
  end
end
