require 'shoulda/matchers/action_controller/filter_param_matcher'
require 'shoulda/matchers/action_controller/route_params'
require 'shoulda/matchers/action_controller/set_the_flash_matcher'
require 'shoulda/matchers/action_controller/render_with_layout_matcher'
require 'shoulda/matchers/action_controller/respond_with_matcher'
require 'shoulda/matchers/action_controller/set_session_matcher'
require 'shoulda/matchers/action_controller/route_matcher'
require 'shoulda/matchers/action_controller/redirect_to_matcher'
require 'shoulda/matchers/action_controller/render_template_matcher'
require 'shoulda/matchers/action_controller/rescue_from_matcher'

module Shoulda
  module Matchers
    # These are matchers which are designed to be used in controller tests.
    #
    # Here's an example of what a controller spec using shoulda-matchers might
    # look like:
    #
    #     class UsersController < ApplicationController
    #       def create
    #         @user = User.new(params[:user])
    #         if @user.save
    #           flash[:success] = 'User successfully added!'
    #           redirect_to action: :show, id: @user.id
    #         else
    #           render action: :new
    #         end
    #       end
    #     end
    #
    #     # RSpec
    #     describe UsersController do
    #       context 'routing' do
    #         it { should route(:post, '/users').to(action: :create) }
    #       end
    #
    #       describe 'POST /users' do
    #         let(:user) { double }
    #
    #         before do
    #           allow(User).to receive(:new).and_return(user)
    #           post :create
    #         end
    #
    #         context 'on success' do
    #           before do
    #             allow(user).to receive(:id).and_return(42)
    #             allow(user).to receive(:save).and_return(true)
    #           end
    #
    #           it { should redirect_to(action: :show, id: 42) }
    #           it { should set_the_flash[:success].to('User successfully added') }
    #         end
    #
    #         context 'on failure' do
    #           before do
    #             allow(user).to receive(:save).and_return(false)
    #           end
    #
    #           it 'assigns @user to the user' do
    #             expect(assigns[:user]).to eq user
    #           end
    #
    #           it { should render_template('new') }
    #         end
    #       end
    #     end
    #
    #     # Test::Unit (using Mocha)
    #     class UsersController < ActionController::TestCase
    #       context 'routing' do
    #         should route(:post, '/users').to(action: :create)
    #       end
    #
    #       context 'POST /users' do
    #         setup do
    #           @user = stub('user')
    #           User.stubs(:new).returns(@user)
    #           post :create
    #         end
    #
    #         context 'on success' do
    #           setup do
    #             @user.stubs(id: 42, save: true)
    #           end
    #
    #           should redirect_to(action: :show, id: 42)
    #           should set_the_flash[:success].to('User successfully added')
    #         end
    #
    #         context 'on failure' do
    #           setup do
    #             @user.stubs(save: false)
    #           end
    #
    #           it 'assigns @user to the user' do
    #             assert_equal @user, assigns[:user]
    #           end
    #
    #           should render_template('new')
    #         end
    #       end
    #     end
    #
    module ActionController
    end
  end
end
