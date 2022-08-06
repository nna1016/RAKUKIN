Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get 'home/index'
  get 'attendances/attendanceUser/:id/:start/:end' => 'attendances#attendanceUser'
  get 'attendances/attendanceUser/:id' => 'attendances#attendanceUser'
  get 'attendances/attendanceBook'
  delete 'attendances/attendanceDelete/:id' => 'attendances#attendanceDelete'
  get 'attendances/attendanceEdit/:id' => 'attendances#attendanceEdit'
  post 'attendances/attendanceUpdate'
  get 'attendances/auto'
  post 'attendances/success'
  get 'attendances/success_in'
  get 'attendances/success_out'
  get 'attendances/error'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
