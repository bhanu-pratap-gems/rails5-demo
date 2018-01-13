MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  description "The mutation root of this schema"

  field :signInUser, function: Resolvers::SignInUser.new
  field :signOutUser, function: Resolvers::SignOutUser.new
  field :createPost, function: Resolvers::CreatePost.new
end