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
end

# User schema:
# username              string, null: false
# email                 string, null: false
# mobile                string, null: false
# password_digest       string, null: false