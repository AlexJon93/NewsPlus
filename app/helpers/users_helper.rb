module UsersHelper
    def default_image(size)
        image_tag('https://image.flaticon.com/icons/png/512/123/123172.png', size: size, class: 'profile-pic')
    end

    def user_image(user, size)
        if !user.image_id.nil? and image_exists?(user.image_id)
            image_tag(user.image_id, size: size, class: 'profile-pic')
        else
            default_image(size)
        end
    end

    def user_verification(user)
        if !user.verification.nil? and image_exists?(user.verification)
            image_tag(user.verification, size: 256, class: 'verification-pic')
        end
    end

    def image_exists?(id)
        if !id.nil? 
            File.exists?(Rails.root.join('app', 'assets', 'images', id))
        end
    end
end