json.(user, :id, :email, :username, :bio, :image)
json.token user.generate_jwt

# JSON partial will be used by our controllers whenever we're dealing with authentication

#contains the user's JWT token which is considered sensitive, so it will be the partial only ever gets rendered for the current user