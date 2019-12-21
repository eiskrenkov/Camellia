class UserActionType < EnumerateIt::Base
  associate_values :create, :update, :delete
end
