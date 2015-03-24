class AboutsController < InheritedResources::Base

  def index
    @about = About.first
  end

  private

    def about_params
      params.require(:about).permit(:title, :content, :image)
    end
end

