require 'bcrypt'
class User < ActiveRecord::Base

has_many :memberships
has_many :teams, through: :memberships
has_many :leaderships, class_name: "Team", foreign_key: :leader_id
has_many :enrollments, through: :teams
has_many :events, through: :enrollments

validate :password_validator

include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(entered_password)
    self.password == entered_password
  end

  private
  def password_validator
    if new_record? || raw_password
      if @raw_password.nil?
        errors.add(:password, "must enter a password.")
      elsif @raw_password.length < 4
        errors.add(:password, "must contain at least 4 characters")
      end
    end
  end
end
