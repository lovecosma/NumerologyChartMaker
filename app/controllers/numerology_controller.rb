class NumerologyController <  ApplicationController
  get '/charts' do
    @charts = current_user.numerology_charts
    erb :'charts/index'
  end

  get '/charts/new' do
    @chart = NumerologyChart.new
    erb :'charts/new'
  end

  post '/charts' do
    @chart = NumerologyChart.new(params)
    @chart.user_id = current_user.id
    if @chart.save
      redirect '/charts'
    else
      erb :'charts/new'
    end
  end

  delete '/charts/:id' do
    set_chart
    @chart.destroy
    redirect '/charts'
  end

  patch '/charts/:id' do
    set_chart
      if @chart.update(
        first_name: params[:first_name],
        middle_name: params[:middle_name],
        last_name: params[:last_name],
        birthdate: params[:birthdate]
      )
      redirect "/charts/#{@chart.id}"
    else
      erb :'charts/edit'
    end
  end

  get '/charts/:id/edit' do
    set_chart
    erb :'charts/edit'
end



  get '/charts/:id' do
    set_chart
    erb :'charts/show'
  end




  private
  def set_chart
    @chart = NumerologyChart.find_by_id(params[:id])
  end



end
