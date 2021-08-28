# frozen_string_literal: true

# app/models/user.rb
class User < ApplicationRecord
  validates_presence_of :name
end
