class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show edit update destroy]

  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: "The survey has been created"
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @survey.update(survey_params)
      redirect_to @survey, notice: "The survey has been updated"
    else
      render :edit
    end
  end

  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: "The survey has been removed"
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:first_name, :last_name, :age, :height, :gender, :favorite_color)
  end
end
