class User < ApplicationRecord
  #include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  # include DeviseTokenAuth::Concerns::User
  devise :omniauthable, omniauth_providers: [:facebook]

  def self.create_from_omniauth(params)
    puts "==============================>",params
    user = find_or_create_by!(email: params.info.email, uid: params.uid)
    user.update({
      token: params.credentials.token,
      # name: params.info.name,
      # avatar: params.info.image
    })
    user
  end
end
