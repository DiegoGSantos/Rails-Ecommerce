class ContactsController < InheritedResources::Base

  def index
    @contact = Contact.first
  end

  private

    def contact_params
      params.require(:contact).permit(:Address, :city, :phone, :email, :working_time)
    end
end

