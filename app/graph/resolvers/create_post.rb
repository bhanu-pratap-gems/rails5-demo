class Resolvers::CreatePost < GraphQL::Function
  argument :title, types.String
  argument :body, types.String
  argument :api_token, types.String

  type PostType

  def call(_obj, args, _ctx)
    user = User.find_by_api_token(args[:api_token])
    raise ActiveRecord::RecordNotFound if user.nil?
    user.posts.create!(
      title: args[:title],
      body: args[:body]
    )
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end