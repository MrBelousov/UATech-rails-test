ActiveAdmin.register User do

  menu priority: 3

  permit_params :first_name, :last_name, :avatar

  index do
    id_column
    column :first_name
    column :last_name
    actions
  end

  filter :first_name
  filter :last_name

  show do
    panel 'User info' do
      attributes_table_for user do
        row :id
        row :first_name
        row :last_name
        row 'Avatar' do |user|
          if user.avatar.present?
            image_tag user.avatar, class: 'active-admin-image'
          else
            image_tag 'no_profile_img.gif', class: 'active-admin-image'
          end
        end
        panel 'Microposts:' do
          render partial: 'microposts', locals: { user: user }
        end
      end
    end
  end

  form do |f|
    f.inputs 'User:' do
      f.input :first_name
      f.input :last_name
      f.input :avatar
    end
    f.actions
  end
end
