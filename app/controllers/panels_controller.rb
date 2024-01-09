class PanelsController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
     render 'layouts/index'
    end

    def get_data
        @panel = Panel.all
        render json: @panel 
    end

    def new
        @panel = Panel.new
        render 'layouts/new'
      end
      
    
      def create
        content = params[:_json]
      #  puts "========= params #{params[:_json]} content: #{content}"
       @panel = Panel.new(content:content)
        res_json = {}
        begin
          @panel.save!
          res_json[:content] = content
          render json: res_json, status: 200
        rescue => e
          byebug
          res_json[:message] = e.message
          render json: res_json, status: 400
        end
          # Record saved successfully
          puts "=== Panel saved #{@panel.inspect}"
          
      end

    # private
    # def panel_params
    #   puts params
    #   params.require(:panel).permit(:content)
    # end
    
  end

