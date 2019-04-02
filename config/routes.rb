Rails.application.routes.draw do
	post 'users' => 'users#create'
	post 'authenticate' => 'auth#authenticate'
end
