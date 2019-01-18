class BackupGuestsController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:r]
      @backup_guests = BackupGuest.joins("inner join rooms on backup_guests.room_id = rooms.id")
                           .where("rooms.admin_id = ? and (backup_guests.name like ? or backup_guests.identitycard like ? or backup_guests.phonenumber like ?)",current_admin.id,"%#{params[:r]}%","#{params[:r]}%","%#{params[:r]}%")
                           .order('created_at desc')
    else
      @backup_guests = BackupGuest.joins("inner join rooms on backup_guests.room_id = rooms.id")
                           .where("rooms.admin_id = ?",current_admin.id).order('created_at desc')

    end
  end

  private
  def backup_guest_params
    params.require(:backup_guest).permit(:name, :birth, :address, :identitycard, :phonenumber, :image, :job, :notice, :room_id,:email,:deleted_at)
  end
end