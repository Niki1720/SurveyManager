class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show edit update destroy]

  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html
      format.turbo_stream { render turbo_stream: turbo_stream.replace("survey-list", partial: "surveys/survey_list", locals: { surveys: @surveys }) }
    end
  end
  def refresh
    @surveys = Survey.all

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("survey-list", partial: "surveys/survey_list", locals: { surveys: @surveys }) }
      format.html { redirect_to surveys_path }
    end
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: "The survey has been created"
    else
      respond_to do |format|
        format.html { render :new }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("form_errors", partial: "surveys/form_errors", locals: { survey: @survey }) }
      end
    end
  end

  def update
    if @survey.update(survey_params)
      redirect_to @survey, notice: "The survey has been updated!"
    else
      respond_to do |format|
        format.html { render :edit }
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("form_errors", partial: "surveys/form_errors", locals: { survey: @survey })
        }
      end
    end
  end

  def destroy
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: "The survey has been removed" }
      format.turbo_stream do
        @surveys = Survey.all
        render turbo_stream: turbo_stream.replace("survey-list", template: "surveys/index")
      end
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:first_name, :last_name, :age, :height, :gender, :favorite_color)
  end
end
