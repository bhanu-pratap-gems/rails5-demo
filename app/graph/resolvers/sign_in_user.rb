class Resolvers::SignInUser < GraphQL::Function
  argument :email, !types.String
  argument :password, !types.String

  type UserType

  def call(_obj, args, ctx)
    return unless args[:email]

    user = User.find_by email: args[:email]

    return unless user
    return unless user.authenticated?(args[:password])
    user.generate_api_token
    user.save
    user
  end
end