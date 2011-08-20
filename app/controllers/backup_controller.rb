class BackupController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @backup_app_link, @backup_uploads_link = '', ''
    cmd = params[:cmd]
    if cmd == 'backup_app'
      backup_app_file = "app#{Time.now.strftime('%Y%m%d')}.tar.gz"
      sh = "tar zcvf #{Rails.root}/public/backups/#{backup_app_file} --exclude=rubygems #{Rails.root}"
      #sh = "tar zcvf #{Rails.root}/public/backups/#{backup_app_file} #{Rails.root}"
      @backup_app_link = "<a href='/backups/" + backup_app_file + "'>Download</a>"
    elsif cmd == 'backup_uploads'
      backup_uploads_file = "uploads#{Time.now.strftime('%Y%m%d')}.tar.gz"
      sh = "tar zcvf #{Rails.root}/public/backups/#{backup_uploads_file} #{Rails.root}/public/uploads"
      @backup_uploads_link = "<a href='/backups/" + backup_uploads_file + "'>Download</a>"
    elsif cmd == 'clear_backups'
      sh = "rm -f #{Rails.root}/public/backups/*"
    elsif cmd == 'list_backups'
      sh = "ls #{Rails.root}/public/backups"
    else
      sh = cmd || 'ls'
    end
    @shell = %x[#{sh}]
  end

end
