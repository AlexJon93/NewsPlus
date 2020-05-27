module UsersHelper
    def default_image(size)
        image_tag('https://image.flaticon.com/icons/png/512/123/123172.png', size: size, alt: 'username', class: 'profile-pic')
    end
end
