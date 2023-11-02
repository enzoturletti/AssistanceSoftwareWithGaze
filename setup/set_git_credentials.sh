# Prompt the user for their name
read -p "Enter your Git user name: " user_name

# Prompt the user for their email
read -p "Enter your Git user email: " user_email

# Set the global Git configuration values
git config --global user.name "$user_name"
git config --global user.email "$user_email"

# Display a confirmation message
echo "Git user name and email have been configured:"
echo "Name: $user_name"
echo "Email: $user_email"

git config --global --add safe.directory "*"

cd core
git checkout master

cd ..
cd train
git checkout master

cd ..
cd graphics
git checkout master