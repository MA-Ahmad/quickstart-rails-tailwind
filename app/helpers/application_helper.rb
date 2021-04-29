module ApplicationHelper
    def full_name first_name, last_name
        [first_name, last_name].join(" ").strip
    end
end
