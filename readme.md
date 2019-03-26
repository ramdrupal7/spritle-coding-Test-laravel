1. composer update ( if load libraries)
2.	php artisan key:generate ( if there is an error at key)

# artisan to create a fake users
	# open tinker at console
	php artisan tinker
	# create fake users
	factory(App\User::class, 10)->create();
	
php artisan serve


Note : incase need sample database ,use databasesample folder for sample database and use secret as password for users.