class Resolvers::SignOutUser < GraphQL::Function
  argument :api_token, !types.String

  type UserType

  def call(_obj, args, ctx)
    return unless args[:api_token]

    user = User.find_by api_token: args[:api_token]

    return unless user
    return unless user.destroy_api_token
    user
  end
end