class Public::ContactController < PublicController

  def index
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.valid?
        ApplicationMailer.contact(@contact).deliver
        format.html { redirect_to public_root_path, notice: t('contact_send_confirmation_message')}
      else
        format.html { render :index }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end

  end


  private

    def contact_params
      params.require(:contact).permit(:firstName, :lastName, :email, :message)
    end


end
