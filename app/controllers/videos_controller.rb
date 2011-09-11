
class VideosController < ApplicationController
  def new
  
  end
  
  # framey callback
  def callback
    render :text => "" and return unless request.post? && params[:video]

    video = Video.create!({
      :name => params[:video][:name],
      :filesize => params[:video][:filesize],
      :duration => params[:video][:duration],
      :state => params[:video][:state],
      :views => params[:video][:views],
      :flv_url => params[:video][:flv_url],
      :mp4_url => params[:video][:mp4_url],
      :small_thumbnail_url => params[:video][:small_thumbnail_url],
      :medium_thumbnail_url => params[:video][:medium_thumbnail_url],          
      :large_thumbnail_url => params[:video][:large_thumbnail_url]
    })

    render :text => "" and return
  end
  
  def index
    wtc = [40.711626, -74.010714]
    @videos = Video.all
    # example
    # @map = Cartographer::Gmap.new('map',
    #                                 :type => 'terrain',
    #                                 :center => wtc,
    #                                 :zoom => 14,
    #                                 :controls => [:zoom]
    #                              )
#   @map.zoom = :bound
    # @icon = Cartographer::Gicon.new()
    # @map.icons <<  @icon
    # marker1 = Cartographer::Gmarker.new(:name=> "taj_mahal", :marker_type => "Building",
    #            :position => [27.173006,78.042086],
    #            :info_window_url => "/url_for_info_content", :icon => @icon)
    # 
    # marker2 = Cartographer::Gmarker.new(:name=> "wtc", :marker_type => "Building",
    #            :position => wtc,
    #            :info_window_url => "/url_for_info_content", :icon => @icon)
    # marker3 = Cartographer::Gmarker.new(:name=> "raj_bhawan", :marker_type => "Building",
    #            :position => [28.614309,77.201353],
    #            :info_window_url => "/url_for_info_content", :icon => @icon)
    # 
    # @map.markers << marker1
    # @map.markers << marker2
    # @map.markers << marker3
  end
  
  def show
    @video = Video.find_by_name(params[:id])
  end

end
