Rails.application.routes.draw do
  mount Customers::Engine => "/"
  mount Payments::Engine => "/"
end
