# Technical Guide Overview

Technical considerations and best practices for frontend asset delivery.

## Quick Reference

### Format Selection
- **WebP**: Best for web, 25-35% smaller than PNG, wide browser support
- **AVIF**: Cutting edge, 50% smaller than WebP, limited support
- **PNG**: Lossless, large file size, use for transparency
- **JPEG**: Lossy, smaller than PNG, photos without transparency

## Detailed References

- `technical-accessibility.md` - WCAG compliance, contrast checks, alt text
- `technical-best-practices.md` - Checklists, quality gates
- `technical-optimization.md` - Cost strategies, model selection

## Responsive Image Strategies

**Art Direction (different crops)**:
```html
<picture>
  <source media="(min-width: 768px)" srcset="hero-desktop.webp">
  <source media="(max-width: 767px)" srcset="hero-mobile.webp">
  <img src="hero-desktop.jpg" alt="Hero image">
</picture>
```

**Resolution Switching (same crop, different sizes)**:
```html
<img
  srcset="hero-400w.webp 400w, hero-800w.webp 800w, hero-1200w.webp 1200w"
  sizes="(max-width: 600px) 400px, (max-width: 1000px) 800px, 1200px"
  src="hero-800w.jpg"
  alt="Hero image"
/>
```
