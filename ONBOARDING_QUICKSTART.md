# Onboarding Quick Start

## View the Onboarding Page

### 1. Start the Rails Server
```bash
bin/rails server
# or
rails s
```

### 2. Visit the Onboarding Page
Open your browser and navigate to:
```
http://localhost:3000/onboarding
```

### 3. Navigate Through the Steps
- Click **Next** to advance through the steps
- Click **Previous** to go back
- Click **Skip onboarding** to jump to the end
- Use **arrow keys** (← →) for keyboard navigation

## The 4 Onboarding Steps

1. **Welcome** - Introduction to Kanbino
2. **Features** - Showcase of key features (4 feature cards)
3. **Setup** - Quick setup guide (4 numbered steps)
4. **Complete** - Completion screen with helpful tips

## Routes Available

- `GET /onboarding` - Main onboarding page
- `GET /onboarding?step=welcome` - Specific step (welcome, features, setup, complete)
- `PATCH /onboarding/update` - Advance to next step

## Running Tests

### All Tests
```bash
rails test
```

### Controller Tests Only
```bash
rails test test/controllers/onboarding_controller_test.rb
```

### System Tests Only
```bash
rails test:system test/system/onboarding_test.rb
```

## Files to Review

- Controller: `app/controllers/onboarding_controller.rb`
- Views: `app/views/onboarding/`
- Styles: `app/assets/stylesheets/onboarding.css`
- JavaScript: `app/javascript/controllers/onboarding_controller.js`
- Routes: `config/routes.rb` (lines 12-14)

## Customization Tips

1. **Change Colors**: Edit CSS variables in `app/assets/stylesheets/onboarding.css`
2. **Update Content**: Edit step partials in `app/views/onboarding/steps/`
3. **Add Steps**: Update `STEPS` array in controller and create new partials
4. **Modify Completion**: Edit `complete_onboarding` method in controller

## Features to Try

✓ Responsive design (resize browser window)
✓ Dark mode (if your OS is in dark mode)
✓ Keyboard navigation (use arrow keys)
✓ Skip functionality (with confirmation)
✓ Progress bar animation
✓ Smooth transitions with Turbo

## Need Help?

See `ONBOARDING_IMPLEMENTATION.md` for detailed documentation.
