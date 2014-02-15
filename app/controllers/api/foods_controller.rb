class Api::FoodsController < ApiController

  def create
    create_food(User.find(params[:user_id]),params)
  end

  def index
    @foods = Food.where(:owner_id => params[:user_id]).order_by(:created_at.desc)
    @foods_length = @foods.length
  end

  def edit
    @food = Food.find_by(:_id => params[:id])
  end

  def update
    @food = Food.find_by(:_id => params[:id])
    @food.update_attributes(
        {
            name: params[:name],
            price: params[:price],
            describe: params[:describe],
            picture: params[:picture]
        }
    )
    render status: :ok
  end

  def destroy
    found?(@food = Food.find_by(:_id => params[:id])) do
      @food.delete
      render status: :ok
    end

  end

  private

  def create_food(owner, params)
    found?(owner) do
      valid?(@food = Food.create(
          name: params[:name],
          describe: params[:describe],
          price: params[:price].to_f,
          picture: params[:picture],
          owner: owner)
      ) do
        render status: :created
      end
    end
  end
end