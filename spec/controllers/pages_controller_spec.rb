require 'spec_helper'

RSpec.describe PagesController, type: :controller do
	describe 'welcome' do
		before { get :welcome }
		it 'should be successful' do
			expect(response.status).to eq(200)
		end
		it 'renders welcome page' do
			expect(response).to render_template("welcome")
		end
	end

	describe 'about' do
		it 'should be successful' do
			expect(response.status).to eq(200)
		end
		it 'renders about page' do
			get :about
			expect(response).to render_template("about")
		end
	end

	describe 'terms of use' do
		it 'should be successful' do
			expect(response.status).to eq(200)
		end
		it 'renders terms of use page' do
			get :terms_of_use
			expect(response).to render_template("terms_of_use")
 		end
	end
end