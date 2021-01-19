# frozen_string_literal: true

class FriendsController < ApplicationController
  before_action :set_friend, only: %i[show edit update destroy]
  # shirin
  before_action :authenticate_user!, except: %i[index show]
  # shirin 1
  before_action :corrent_user, only: %i[edit update destroy]
  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show; end

  # GET /friends/new
  def new
    # shirin 1.3
    @friend = current_user.friends.build
    # friend = Friend.new
  end

  # GET /friends/1/edit
  def edit; end

  # POST /friends
  # POST /friends.json
  def create
    # shirin 1.4
    @friend = current_user.friends.build(friend_params)
    # friend = Friend.new(friend_params)
    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # current_user shirin 1
  def corrent_user
    @friend = current_user.friends.find_by(id: params[:id])
    redirect_to friends_path, notice: 'NOT Authorized To Edit this Friend' if @friend.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friend
    @friend = Friend.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def friend_params
    params.require(:friend).permit(:frist_name, :last_name, :email, :phone, :twitter, :user_id)
  end
end
