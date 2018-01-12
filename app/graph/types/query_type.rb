QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :me do
    type UserType
    description "Current user"
    resolve ->(obj, args, ctx) {
      ctx[:current_user]
    }
  end

  field :post do
    type PostType
    argument :id, !types.ID
    description "Find a Post by ID"
    resolve ->(obj, args, ctx) { Post.find_by_id(args["id"]) }
  end
end
