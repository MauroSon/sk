require "test_helper"

class OnboardingControllerTest < ActionDispatch::IntegrationTest
  test "should get index with default step" do
    get onboarding_url
    assert_response :success
    assert_select "h1", "Welcome to Kanbino!"
  end

  test "should get index with welcome step" do
    get onboarding_url(step: "welcome")
    assert_response :success
    assert_select "h1", "Welcome to Kanbino!"
  end

  test "should get index with features step" do
    get onboarding_url(step: "features")
    assert_response :success
    assert_select "h1", "Key Features"
  end

  test "should get index with setup step" do
    get onboarding_url(step: "setup")
    assert_response :success
    assert_select "h1", "Quick Setup Guide"
  end

  test "should get index with complete step" do
    get onboarding_url(step: "complete")
    assert_response :success
    assert_select "h1", "You're All Set!"
  end

  test "should default to welcome step for invalid step" do
    get onboarding_url(step: "invalid")
    assert_response :success
    assert_select "h1", "Welcome to Kanbino!"
  end

  test "should calculate correct progress percentage" do
    get onboarding_url(step: "welcome")
    assert_response :success
    assert_match(/Step 1 of 4/, @response.body)

    get onboarding_url(step: "features")
    assert_response :success
    assert_match(/Step 2 of 4/, @response.body)

    get onboarding_url(step: "setup")
    assert_response :success
    assert_match(/Step 3 of 4/, @response.body)

    get onboarding_url(step: "complete")
    assert_response :success
    assert_match(/Step 4 of 4/, @response.body)
  end

  test "should advance to next step on update" do
    patch onboarding_update_url, params: { step: "welcome" }
    assert_redirected_to onboarding_url(step: "features")

    patch onboarding_update_url, params: { step: "features" }
    assert_redirected_to onboarding_url(step: "setup")

    patch onboarding_update_url, params: { step: "setup" }
    assert_redirected_to onboarding_url(step: "complete")
  end

  test "should complete onboarding and redirect from last step" do
    patch onboarding_update_url, params: { step: "complete" }
    # Should redirect to complete step if root_path is not defined
    assert_redirected_to onboarding_url(step: "complete")
  end

  test "should set onboarding_completed in session" do
    patch onboarding_update_url, params: { step: "complete" }
    assert session[:onboarding_completed]
  end

  test "should show navigation buttons appropriately" do
    # First step should not show previous button
    get onboarding_url(step: "welcome")
    assert_response :success
    assert_select ".btn-secondary", count: 0

    # Middle steps should show both buttons
    get onboarding_url(step: "features")
    assert_response :success
    assert_select ".btn-secondary", count: 1
    assert_select ".btn-primary", count: 1

    # Last step should show Get Started button
    get onboarding_url(step: "complete")
    assert_response :success
    assert_select "button", text: "Get Started"
  end

  test "should show skip link on non-final steps" do
    get onboarding_url(step: "welcome")
    assert_response :success
    assert_select ".skip-link", count: 1

    get onboarding_url(step: "complete")
    assert_response :success
    assert_select ".skip-link", count: 0
  end
end
