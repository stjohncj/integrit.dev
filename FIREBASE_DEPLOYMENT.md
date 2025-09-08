# Firebase Hosting Deployment Guide

Deploy your IntegritDev website to Firebase Hosting for fast, secure, and reliable hosting with Google's infrastructure.

## Why Firebase Hosting?

✅ **Free tier** - Perfect for marketing sites  
✅ **Global CDN** - Fast loading worldwide  
✅ **SSL certificates** - HTTPS by default  
✅ **Custom domains** - Use integrit.dev  
✅ **Easy deployments** - One command to update  
✅ **Google infrastructure** - 99.95% uptime SLA  

## Prerequisites

- Google account (you already have this with Workspace)
- Node.js installed locally
- Firebase CLI

## Setup Steps

### 1. Install Firebase CLI

```bash
npm install -g firebase-tools
```

### 2. Login to Firebase

```bash
firebase login
```

This will open your browser and log you into your Google account.

### 3. Initialize Firebase Project

From your project directory:

```bash
cd ~/dev/integrit.dev
firebase init hosting
```

**Configuration answers:**
- **Use existing project or create new?** → Create a new project
- **Project name:** `integritdev`
- **Public directory:** `dist`
- **Single-page app?** → No
- **Overwrite index.html?** → No

### 4. Configure firebase.json

Your `firebase.json` should look like this:

```json
{
  "hosting": {
    "public": "dist",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(js|css|svg|png|jpg|jpeg|gif|webp)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "max-age=31536000"
          }
        ]
      }
    ]
  }
}
```

### 5. Build and Deploy

```bash
# Build for production
npm run build

# Deploy to Firebase
firebase deploy
```

### 6. Custom Domain Setup

1. **In Firebase Console:**
   - Go to Hosting section
   - Click "Add custom domain"
   - Enter `integrit.dev`

2. **Update DNS records:**
   - Add A records pointing to Firebase IPs
   - Firebase will provide the exact DNS settings

## Deployment Commands

```bash
# One-time setup
npm run build && firebase deploy

# For updates
npm run build && firebase deploy

# Deploy with custom message
firebase deploy -m "Updated hero section styling"
```

## Advantages over GoDaddy

| Feature | Firebase | GoDaddy |
|---------|----------|---------|
| **Speed** | Global CDN | Single server |
| **SSL** | Free, auto-renew | Extra cost |
| **Deployment** | One command | Manual upload |
| **Uptime** | 99.95% SLA | Variable |
| **Cost** | Free tier | Monthly hosting fee |
| **Scalability** | Automatic | Limited |

## Firebase Console

After deployment, manage your site at:
- **Console:** https://console.firebase.google.com
- **Your site:** https://integritdev.web.app (default)
- **Custom domain:** https://integrit.dev (after setup)

## Continuous Deployment (Optional)

Connect GitHub for automatic deployments:

1. **GitHub Actions** - Deploy on every push to main
2. **Firebase + GitHub integration**

## Cost Estimate

**Firebase Hosting Free Tier:**
- 10 GB storage
- 10 GB/month transfer
- Custom domain included

Your marketing site will easily fit within the free tier!

## Support

- Firebase Documentation: https://firebase.google.com/docs/hosting
- Firebase Console: https://console.firebase.google.com
- Google Cloud Support (with Workspace Business)

---

**Firebase Hosting is the perfect choice for IntegritDev!** 🚀

Professional, fast, and integrates perfectly with your Google Workspace account.