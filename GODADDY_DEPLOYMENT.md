# GoDaddy Deployment Guide

This guide will help you deploy your IntegritDev website to GoDaddy hosting.

## Prerequisites

- GoDaddy hosting account with cPanel access
- FTP/File Manager access
- Domain name configured (integrit.dev)

## Deployment Steps

### Method 1: Using File Manager (Recommended)

1. **Log into your GoDaddy account**
   - Go to [godaddy.com](https://godaddy.com)
   - Sign in to your account
   - Navigate to "My Products" → "Web Hosting"

2. **Access File Manager**
   - Click "Manage" next to your hosting plan
   - Open "File Manager" from cPanel

3. **Navigate to public_html**
   - Open the `public_html` folder (this is your website's root directory)
   - Delete any existing files if this is a fresh setup

4. **Upload your site files**
   - Upload ALL files from the `dist/` folder to `public_html/`
   - Your file structure should look like:
     ```
     public_html/
     ├── index.html
     ├── robots.txt
     ├── sitemap.xml
     └── assets/
         ├── index-B8OQDs_c.css
         ├── index-fuMkl7Ar.js
         ├── index-legacy-BfbblsSZ.js
         ├── polyfills-legacy-Bj7NGYSK.js
         └── logo-C4fsJfY2.svg
     ```

### Method 2: Using FTP

1. **Get FTP credentials**
   - In cPanel, look for "FTP Accounts" or "FTP Access"
   - Use your main account or create a new FTP user

2. **Connect with FTP client**
   - Use FileZilla, WinSCP, or similar FTP client
   - Host: Your domain or server IP
   - Username: Your FTP username
   - Password: Your FTP password

3. **Upload files**
   - Navigate to `/public_html/` on the remote server
   - Upload all contents from your local `dist/` folder

## Files to Upload

Upload these files from your `dist/` directory:

```
✅ index.html          (Main website file)
✅ robots.txt          (SEO - search engine instructions)
✅ sitemap.xml         (SEO - site structure)
✅ assets/ folder      (Contains CSS, JS, and logo files)
   ├── index-B8OQDs_c.css
   ├── index-fuMkl7Ar.js
   ├── index-legacy-BfbblsSZ.js
   ├── polyfills-legacy-Bj7NGYSK.js
   └── logo-C4fsJfY2.svg
```

## Domain Configuration

### If using integrit.dev domain:

1. **Update DNS Settings**
   - In GoDaddy Domain Manager, point your domain to your hosting
   - Set A record to your hosting server's IP
   - Set CNAME for www to point to your domain

2. **SSL Certificate**
   - Enable SSL in cPanel (usually free with GoDaddy)
   - Force HTTPS redirects for security

### Using a subdomain or different domain:

- Update the canonical URLs in your HTML if needed
- Update sitemap.xml and robots.txt with the correct domain

## Post-Deployment Checklist

After uploading:

1. **Test your website**
   - Visit your domain: `https://integrit.dev`
   - Check all pages and links work
   - Verify contact form email works
   - Test on mobile devices

2. **Verify SEO files**
   - Check `https://integrit.dev/robots.txt`
   - Check `https://integrit.dev/sitemap.xml`

3. **Performance check**
   - Test site speed with Google PageSpeed Insights
   - Verify all assets load correctly

## Troubleshooting

### Common Issues:

**404 Errors:**
- Ensure `index.html` is in the root of `public_html/`
- Check file permissions (755 for folders, 644 for files)

**CSS/JS Not Loading:**
- Verify the `assets/` folder uploaded correctly
- Check that file names match exactly (case-sensitive)

**Email Issues:**
- Set up email forwarding in GoDaddy for inquiries@integrit.dev
- Or configure a proper mailbox

**SSL Issues:**
- Enable SSL certificate in cPanel
- Update any hard-coded HTTP links to HTTPS

## Maintenance

To update your website:
1. Make changes locally
2. Run `npm run build`
3. Upload new files from `dist/` folder
4. Clear any caches if needed

## Support

- GoDaddy Support: Available 24/7 via phone/chat
- cPanel documentation for file management
- Contact integrit.dev support for website-specific issues

---

Your IntegritDev website should now be live at integrit.dev! 🚀