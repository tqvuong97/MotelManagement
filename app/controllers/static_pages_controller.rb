class StaticPagesController < ApplicationController
  # before_action :authenticate_admin!
  # before_action :check_expire
  #   def check_expire
  #     unless current_admin.expired_at.to_i > Time.now.to_i
  #       @notice1 =  'Your account was expired ! Please contact Admin to be supported .'
  #     end
  #   end
    def show
        if valid_page?
            render template: "static_pages/#{params[:page]}"
        else
            render file: "public/404.html", status: :not_found
        end
    end
    def guestinfo
      if params[:r]
        @guests = Guest.where("email = ?",params[:r])
        @guests.each do |g1|
          @b1 = g1.room
          @b2 = @b1.services_rooms.each do |g2|
            @b3 = g2.billings.each do |g3|
              @bills = g3
            end

          end

        end
      else
        @guests = []
      end
    end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/static_pages/#{params[:page]}.html.erb"))
  end
       
    
end
