Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'sidekiq_admin_link',
  insert_bottom: 'nav',
  partial: 'spree/admin/shared/sidekiq_menu'
)
