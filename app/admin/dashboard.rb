ActiveAdmin.register_page "Dashboard" do
  content do
    div class: "welcome-message" do
      h2 "Welcome to the Admin Dashboard!"
      para "This is the customized dashboard."
    end

    # Example: Show a list of recent orders
    section "Recent Orders" do
      table_for Order.order("created_at desc").limit(5) do
        column :id
        column :user
        column :total_price
        column :created_at
      end
      strong { link_to "View All Orders", admin_orders_path }
    end
  end
end
