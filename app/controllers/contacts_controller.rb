class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    # Spam bot honeypot
    spam_filter

    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.contact_email(@contact).deliver_now
      flash[:notice] = I18n.t('contacts.notice')
      @contact = Contact.new
      render :new, status: :ok
    else
      render_error
    end
  end

  def render_error
    flash.now[:alert] = I18n.t('contacts.failure')
    render :new, status: :unprocessable_content
  end

  def spam_filter
    return if params.dig(:contact, :nickname).blank?

    head :unprocessable_entity
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :location, :message)
  end
end
