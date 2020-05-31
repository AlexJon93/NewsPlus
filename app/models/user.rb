class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\d{9,13}/
    has_secure_password
    before_save {self.email = email.downcase}

    validates :username,    presence: true, length: {minimum:5, maximum:30}
    validates :email,       presence: true, length: {maximum:256},
                                            format: {with: VALID_EMAIL_REGEX},
                                            uniqueness: {case_sensitive: false}
    validates :mobile,      presence: true, format: {with: VALID_PHONE_REGEX},
                                            length: {minimum: 9, maximum:13}
    has_many :posts
    has_many :comments

    attr_accessor :remember_token, :reset_token

    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def self.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def forget
        update_attribute(:remember_digest, nil)
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_at, Time.zone.now)
    end

    def send_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    def reset_expired?
        reset_at < 2.hours.ago
    end
end

# User schema:
# username              string
# email                 string
# mobile                string
# password_digest       string
# remember_digest       string
# reset_digest          string
# reset_at              datetime