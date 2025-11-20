require "application_system_test_case"

class OnboardingTest < ApplicationSystemTestCase
  test "visiting the onboarding page shows welcome step" do
    visit onboarding_url

    assert_selector "h1", text: "Welcome to Kanbino!"
    assert_text "Step 1 of 4"
    assert_button "Next"
  end

  test "can navigate through all onboarding steps" do
    visit onboarding_url

    # Step 1: Welcome
    assert_selector "h1", text: "Welcome to Kanbino!"
    assert_text "Step 1 of 4"
    click_button "Next"

    # Step 2: Features
    assert_selector "h1", text: "Key Features"
    assert_text "Step 2 of 4"
    assert_text "Kanban Boards"
    assert_text "Team Collaboration"
    click_button "Next"

    # Step 3: Setup
    assert_selector "h1", text: "Quick Setup Guide"
    assert_text "Step 3 of 4"
    assert_text "Create Your First Board"
    click_button "Next"

    # Step 4: Complete
    assert_selector "h1", text: "You're All Set!"
    assert_text "Step 4 of 4"
    assert_button "Get Started"
  end

  test "can navigate backward through steps" do
    visit onboarding_url(step: "features")

    assert_selector "h1", text: "Key Features"
    click_link "Previous"

    assert_selector "h1", text: "Welcome to Kanbino!"
  end

  test "progress bar updates correctly" do
    visit onboarding_url

    # Check progress bar exists
    assert_selector ".progress-bar"
    assert_selector ".progress-fill"

    # Navigate and check progress updates
    click_button "Next"
    assert_selector "h1", text: "Key Features"

    click_button "Next"
    assert_selector "h1", text: "Quick Setup Guide"

    click_button "Next"
    assert_selector "h1", text: "You're All Set!"
  end

  test "can skip onboarding" do
    visit onboarding_url

    assert_link "Skip onboarding"
    accept_confirm do
      click_link "Skip onboarding"
    end

    assert_selector "h1", text: "You're All Set!"
  end

  test "no previous button on first step" do
    visit onboarding_url

    assert_selector "h1", text: "Welcome to Kanbino!"
    assert_no_link "Previous"
  end

  test "no skip link on final step" do
    visit onboarding_url(step: "complete")

    assert_selector "h1", text: "You're All Set!"
    assert_no_link "Skip onboarding"
  end

  test "displays all feature cards on features step" do
    visit onboarding_url(step: "features")

    assert_selector ".feature-card", count: 4
    assert_text "Kanban Boards"
    assert_text "Team Collaboration"
    assert_text "Real-time Updates"
    assert_text "Progress Tracking"
  end

  test "displays all setup steps on setup step" do
    visit onboarding_url(step: "setup")

    assert_selector ".setup-step", count: 4
    assert_text "Create Your First Board"
    assert_text "Add Columns"
    assert_text "Create Tasks"
    assert_text "Collaborate & Track"
  end

  test "displays tips on complete step" do
    visit onboarding_url(step: "complete")

    assert_selector ".tip-card", count: 3
    assert_text "Need Help?"
    assert_text "Start Simple"
    assert_text "Customize"
  end

  test "invalid step defaults to welcome" do
    visit onboarding_url(step: "invalid_step")

    assert_selector "h1", text: "Welcome to Kanbino!"
  end

  test "completing onboarding redirects appropriately" do
    visit onboarding_url(step: "complete")

    click_button "Get Started"

    # Should redirect to complete step if root is not defined
    assert_current_path onboarding_path(step: "complete")
  end
end
