class UsersController < ApplicationController

  def create
    customer = Stripe::Customer.create email: params[:email],
        card: params[:stripeToken]

    user = User.new first_name: params[:first], last_name: params[:last],
        email: params[:email], stripe_id: customer

    if user.save
      Stripe::Charge.create(
        :amount => 2500,
        :currency => "usd",
        :customer => customer,
        :description => "Early beta access."
      )

      flash[:notice] = "Thanks for signing up! You have successfully signed up."
    else
      flash[:error] = "Something went wrong."
    end
    redirect_to root_path
  end

    rescue_from Stripe::CardError do |e|
      flash[:error] = "Something went wrong with your card."
      redirect_to root_path
    end

end
