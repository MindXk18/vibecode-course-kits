# Screenshot Replication Workflow

Replicate a design exactly from a provided screenshot.

## Prerequisites
- Activate `mx:ui-ux-pro-max` skill first for design intelligence

## Workflow Steps

### 1. Analyze Screenshot Details
Analyze the screenshot directly to extract:
- Design style and visual trends
- Font names (predict Google Fonts), sizes, weights
- Color palette with exact hex codes
- Border radius, spacing patterns
- Element positions, sizes, shapes
- Textures, materials, lighting
- Shadows, reflections, blur, glow effects
- Background transparency, transitions
- Image treatments and effects

**Font Prediction**: Avoid defaulting to Inter/Poppins. Match actual fonts visible.

### 2. Create Implementation Plan
Use `ui-ux-designer` subagent:
- Create plan directory (use `## Naming` pattern from hooks)
- Write `plan.md` (<80 lines, generic overview)
- Add `phase-XX-name.md` files with:
  - Context links, Overview, Key Insights
  - Requirements, Architecture, Related files
  - Implementation Steps, Todo list
  - Success Criteria, Risk Assessment

### 3. Implement
- Follow plan step by step
- Default to HTML/CSS/JS if no framework specified
- Match screenshot precisely

### 4. Verify & Report
- Compare implementation to screenshot
- Report changes summary to user
- Request approval

### 5. Document
If approved, update `./docs/design-guidelines.md`

## Quality Standards
- Match screenshot at pixel level where possible
- Preserve all visual hierarchy
- Maintain exact spacing and proportions
- Replicate animations if visible in source
