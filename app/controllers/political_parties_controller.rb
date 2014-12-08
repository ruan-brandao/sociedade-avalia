class PoliticalPartiesController < ApplicationController
	before_action :set_political_party, only: [:show, :edit, :update, :destroy]
	before_action :require_admin, only: [:new, :edit, :create, :update, :destroy]

	def index
		@political_parties = PoliticalParty.all
	end

	def show
		@users = @political_party.users
	end

	def new
		@political_party = PoliticalParty.new
	end

	def edit
	end

	def create
		@political_party = PoliticalParty.new(political_party_params)

		if @political_party.save
			redirect_to @political_party
		else
			render action: 'new'
		end
	end

	def update
		if @political_party.update(political_party_params)
			redirect_to @political_party
		else
			render action: 'new'
		end
	end

	def destroy
		@political_party.destroy
		redirect_to political_parties_path
	end

	private

	def political_party_params
		params.require(:political_party).permit(:name, :siglum, :number, :position, :picture)
	end

	def set_political_party
		@political_party = PoliticalParty.find(params[:id])
	end
end
