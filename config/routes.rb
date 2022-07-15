Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/index'
  get 'attendances/attendanceBook'
  get 'attendances/auto'
  post 'attendances/success'
  get 'attendances/success_in'
  get 'attendances/success_out'
  get 'attendances/error'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
