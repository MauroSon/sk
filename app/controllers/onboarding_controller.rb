class OnboardingController < ApplicationController
  # Skip authentication for onboarding (adjust if you have authentication)
  # before_action :skip_onboarding_check

  STEPS = %w[welcome features setup complete].freeze

  def index
    @current_step = params[:step] || "welcome"
    @current_step = "welcome" unless STEPS.include?(@current_step)
    @step_index = STEPS.index(@current_step)
    @total_steps = STEPS.length
    @progress_percentage = ((@step_index.to_f / (@total_steps - 1)) * 100).round
  end

  def update
    current_step = params[:step] || "welcome"
    current_index = STEPS.index(current_step) || 0
    next_step = STEPS[current_index + 1]

    if next_step
      redirect_to onboarding_path(step: next_step)
    else
      # Mark onboarding as complete and redirect to main app
      complete_onboarding
    end
  end

  private

  def complete_onboarding
    # Store onboarding completion in session or user model
    session[:onboarding_completed] = true

    # Redirect to root or dashboard
    redirect_to root_path, notice: "Welcome to Kanbino! Let's get started."
  rescue ActionController::RoutingError
    # If root_path is not defined, redirect to onboarding with complete step
    redirect_to onboarding_path(step: "complete")
  end
end
