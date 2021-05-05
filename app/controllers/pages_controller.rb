class PagesController < ApplicationController
    before_action :authenticate_user!, only: :account

    def account
        @user = current_user
    end

    def about; end

    def team; end

    def features; end
end
